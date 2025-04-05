// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageResponse _$LanguageResponseFromJson(Map<String, dynamic> json) =>
    LanguageResponse(
      iso6391: json['iso_639_1'] as String?,
      englishName: json['english_name'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$LanguageResponseToJson(LanguageResponse instance) =>
    <String, dynamic>{
      'iso_639_1': instance.iso6391,
      'english_name': instance.englishName,
      'name': instance.name,
    };
