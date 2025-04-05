import 'package:json_annotation/json_annotation.dart';

part 'language_response.g.dart';

@JsonSerializable()
class LanguageResponse {
    @JsonKey(name: "iso_639_1")
    String? iso6391;
    @JsonKey(name: "english_name")
    String? englishName;
    @JsonKey(name: "name")
    String? name;

    LanguageResponse({
        this.iso6391,
        this.englishName,
        this.name,
    });

    factory LanguageResponse.fromJson(Map<String, dynamic> json) => _$LanguageResponseFromJson(json);

    Map<String, dynamic> toJson() => _$LanguageResponseToJson(this);
}
