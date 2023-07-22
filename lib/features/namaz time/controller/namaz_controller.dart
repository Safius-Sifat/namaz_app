// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:namaz_app/features/namaz%20time/repository/namaz_repository.dart';

import '../../../core/utils.dart';
import '../../../models/namaz_model.dart';

final namazProvider = FutureProvider<List<Data>?>((ref) async {
  return ref.watch(namazControllerProvider).fetchApi();
});

final namazControllerProvider = Provider<NamazController>((ref) {
  return NamazController(
      namazRepository: ref.watch(
        namazRepositoryProvider,
      ),
      ref: ref);
});

class NamazController {
  final NamazRepository _namazRepository;
  final Ref _ref;
  NamazController({required NamazRepository namazRepository, required Ref ref})
      : _namazRepository = namazRepository,
        _ref = ref;

  Future<List<Data>?> fetchApi() async {
    List<Data>? namaz = [];
    final namazFuture = await _namazRepository.fetchApi();
    namazFuture.fold((l) => showSnackBar(_ref, l.message), (r) {
      namaz = r;
    });
    return namaz;
  }
}
