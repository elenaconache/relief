// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Translation _$TranslationFromJson(Map<String, dynamic> json) {
  return Translation(
    tag: json['tag'] as String,
    ro: json['ro'] as String,
    en: json['en'] as String,
  );
}

Map<String, dynamic> _$TranslationToJson(Translation instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'ro': instance.ro,
      'en': instance.en,
    };
