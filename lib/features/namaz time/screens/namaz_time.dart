import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:namaz_app/core/loader.dart';
import 'package:namaz_app/features/namaz%20time/controller/namaz_controller.dart';

import '../../../core/error_text.dart';
import '../../../models/namaz_model.dart';

class NamazTime extends ConsumerWidget {
  const NamazTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(namazProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Namaz Time'),
      ),
      body: data.when(
          data: (data) {
            // List<Namaz> namaz = data.map((e) => e).toList();
            return Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: data!.length,
                        itemBuilder: (_, index) {
                          return ListTile(
                            title:
                                Text(data[index].timings!.fajr ?? "data nai"),
                          );
                        }))
              ],
            );
          },
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () => const Loader()),
    );
  }
}
