import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:namaz_app/core/typedefs.dart';

import '../../../core/failure.dart';
import '../../../models/namaz_model.dart';

final namazRepositoryProvider = Provider<NamazRepository>((ref) {
  return NamazRepository();
});

class NamazRepository {
  FutureEither<List<Data>?> fetchApi() async {
    var uri = Uri.parse(
        "https://api.aladhan.com/v1/calendar/2017/4?latitude=51.508515&longitude=-0.1254872&method=2");

    try {
      final response = await http.get(uri);

      int statusCode = response.statusCode;
      print(statusCode.toString());

      final Map<String, dynamic> result = jsonDecode(response.body);
      return right(Namaz.fromJson(result).data);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
