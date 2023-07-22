// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:namaz_app/features/namaz%20time/repository/namaz_repository.dart';

import '../../../models/namaz_model.dart';

final namazProvider = FutureProvider<List<Data>?>((ref) async {
  return ref.watch(namazControllerProvider).fetchApi();
});

final namazControllerProvider = Provider<NamazController>((ref) {
  return NamazController(namazRepository: ref.watch(namazRepositoryProvider));
});

class NamazController {
  final NamazRepository _namazRepository;
  NamazController({
    required NamazRepository namazRepository,
  }) : _namazRepository = namazRepository;

  Future<List<Data>?> fetchApi() async {
    List<Data>? namaz = [];
    final namazFuture = await _namazRepository.fetchApi();
    namazFuture.fold((l) => print(l.message), (r) {
      namaz = r;
    });
    return namaz;
  }
}
