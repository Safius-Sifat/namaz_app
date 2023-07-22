import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaz_app/core/loader.dart';
import 'package:namaz_app/features/namaz%20time/controller/namaz_controller.dart';
import 'package:namaz_app/main.dart';

import '../../../core/error_text.dart';

final dateTimeProvider = StateProvider<DateTime>((ref) {
  return DateTime(2017, 4, 1);
});

class NamazTime extends ConsumerWidget {
  const NamazTime({super.key});
  void showDateTimePicker(BuildContext context, WidgetRef ref) {
    showDatePicker(
            context: context,
            initialDate: DateTime(2017, 4, 1),
            firstDate: DateTime(2017, 4, 1),
            lastDate: DateTime(2017, 4, 30))
        .then((value) => ref.read(dateTimeProvider.notifier).state = value!);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(namazProvider);
    final dateTime = ref.watch(dateTimeProvider);

    return Scaffold(
      key: ref.watch(scaffoldMessengerKeyPod),
      appBar: AppBar(
        title: const Text('Namaz Time'),
      ),
      body: data.when(
          data: (data) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "${dateTime.day}-0${dateTime.month}-${dateTime.year}",
                    style: const TextStyle(fontSize: 24.0),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDateTimePicker(context, ref);
                    },
                    child: const Text("Select Date"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      trailing: Text(
                          data![dateTime.day - 1].timings!.fajr ?? "No data"),
                      tileColor: Colors.deepPurple[200],
                      title: const Text("Fajr"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      trailing: Text(
                          data[dateTime.day - 1].timings!.sunrise ?? "No data"),
                      tileColor: Colors.deepPurple[200],
                      title: const Text("Sunrise"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      trailing: Text(
                          data[dateTime.day - 1].timings!.dhuhr ?? "No data"),
                      tileColor: Colors.deepPurple[200],
                      title: const Text("Dhuhr"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      trailing: Text(
                          data[dateTime.day - 1].timings!.asr ?? "No data"),
                      tileColor: Colors.deepPurple[200],
                      title: const Text("Asr"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      trailing: Text(
                          data[dateTime.day - 1].timings!.sunset ?? "No data"),
                      tileColor: Colors.deepPurple[200],
                      title: const Text("Sunset"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      trailing: Text(
                          data[dateTime.day - 1].timings!.maghrib ?? "No data"),
                      tileColor: Colors.deepPurple[200],
                      title: const Text("Maghrib"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      trailing: Text(
                          data[dateTime.day - 1].timings!.isha ?? "No data"),
                      tileColor: Colors.deepPurple[200],
                      title: const Text("Isha"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      trailing: Text(
                          data[dateTime.day - 1].timings!.imsak ?? "No data"),
                      tileColor: Colors.deepPurple[200],
                      title: const Text("Imsak"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      trailing: Text(data[dateTime.day - 1].timings!.midnight ??
                          "No data"),
                      tileColor: Colors.deepPurple[200],
                      title: const Text("Midnight"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      trailing: Text(
                          data[dateTime.day - 1].timings!.firstthird ??
                              "No data"),
                      tileColor: Colors.deepPurple[200],
                      title: const Text("First third"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      trailing: Text(
                          data[dateTime.day - 1].timings!.lastthird ??
                              "No data"),
                      tileColor: Colors.deepPurple[200],
                      title: const Text("Last third"),
                    ),
                  )
                ],
              ),
            );
          },
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () => const Loader()),
    );
  }
}
