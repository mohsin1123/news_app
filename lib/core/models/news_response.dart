import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/core/models/article_model.dart';

part 'news_response.g.dart';

// ignore: deprecated_member_use
@JsonSerializable(nullable: false)
class NewsResponse {
  NewsResponse();
  @JsonKey(name: "status")
  late String status;

  @JsonKey(name: "totalResults")
  late int totalResults;

  @JsonKey(name: "articles")
  late List<Article> articles;

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
