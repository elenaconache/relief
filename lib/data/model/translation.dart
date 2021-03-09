import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'translation.g.dart';

@JsonSerializable(nullable: false)
class Translation {
  final String tag;
  final String ro;
  final String en;

  Translation({
    @required this.tag,
    this.ro,
    @required this.en,
  });

  factory Translation.fromJson(Map<String, dynamic> json) =>
      _$TranslationFromJson(json);

  Map<String, dynamic> toJson() => _$TranslationToJson(this);

  @override
  String toString() {
    return 'Translation[tag: $tag, ro: $ro, en: $en]';
  }
}
