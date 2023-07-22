import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:namaz_app/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final scaffoldMessengerKeyPod = Provider((ref) {
  return GlobalKey<ScaffoldMessengerState>();
});

/// Returns the scaffold messenger associated with [scaffoldMessengerKeyPod].
///
final scaffoldMessengerPod = Provider((ref) {
  return ref.watch(scaffoldMessengerKeyPod).currentState!;
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
