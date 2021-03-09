import 'dart:async';

import 'package:dio/dio.dart';
import 'package:relief/data/model/translation.dart';
import 'package:relief/data/network/rest_client.dart';

class TranslationsRepository {
  TranslationsRepository();

  static const translationsTable = 'translations';

  Future<List<Translation>> getTranslations() async {
    final dio = Dio();
    final client = RestClient(dio);

    List<Translation> translations = [];
    (await client.getTranslations()).forEach((element) {
      translations.add(element);
      print(element);
    });

    return translations;
  }
}
