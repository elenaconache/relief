import 'dart:async';

import 'package:dio/dio.dart';
import 'package:relief/data/model/translation.dart';
import 'package:relief/data/network/rest_client.dart';

class TranslationsRepository {
  TranslationsRepository();

  static const translationsTable = 'translations';
  static const int _pageSize = 11;

  Future<List<Translation>> getTranslations() async {
    final dio = Dio();
    final client = RestClient(dio);

    List<Translation> translations = [];
    bool retry = true;
    int pageOffset = 0;
    while (retry) {
      var newData =
          await client.getTranslations(_pageSize, _pageSize * pageOffset);
      newData.forEach((element) {
        translations.add(element);
        print(element);
      });
      pageOffset++;
      if (newData.isEmpty) {
        retry = false;
      }
    }
    return translations;
  }
}
