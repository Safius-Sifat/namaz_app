import 'package:flutter/material.dart';
import 'package:namaz_app/features/hijri%20date/screens/hijri_date.dart';
import 'package:namaz_app/features/namaz%20time/screens/namaz_time_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> widgetList = [
    const NamazTime(),
    const HijriDate(),
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          selectedItemColor: const Color(0xFF6B70FF),
          unselectedItemColor: Colors.grey[500],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_rounded), label: "Namaz Time"),
            BottomNavigationBarItem(
                icon: Icon(Icons.place), label: "Hijri Date"),
          ]),
    );
  }
}
