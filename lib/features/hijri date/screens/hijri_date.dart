import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaz_app/features/namaz%20time/screens/namaz_time_screen.dart';

import '../../../core/error_text.dart';
import '../../../core/loader.dart';
import '../../namaz time/controller/namaz_controller.dart';

class HijriDate extends ConsumerWidget {
  const HijriDate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(namazProvider);
    final dateTime = ref.watch(dateTimeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hijri Date"),
      ),
      body: data.when(
          data: (data) {
            final hijri = data![dateTime.day - 1].date!.hijri!;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ListTile(
                    trailing: Text("${hijri.date}"),
                    tileColor: Colors.deepPurple[200],
                    title: const Text("Date:"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ListTile(
                    trailing:
                        Text("${hijri.weekday!.en} (${hijri.weekday!.ar})"),
                    tileColor: Colors.deepPurple[200],
                    title: const Text("Weekdays:"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ListTile(
                    trailing: Text("${hijri.month!.en} (${hijri.month!.ar})"),
                    tileColor: Colors.deepPurple[200],
                    title: const Text("Month:"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ListTile(
                    trailing: Text("${hijri.holidays!}"),
                    tileColor: Colors.deepPurple[200],
                    title: const Text("Holidays:"),
                  ),
                ),
              ],
            );
          },
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () => const Loader()),
    );
  }
}
