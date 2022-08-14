import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

// ignore: deprecated_member_use
@JsonSerializable(nullable: false)
class Article {
  Article();
  @JsonKey(name: "author")
  late String author;

  @JsonKey(name: "title")
  late String title;

  @JsonKey(name: "description")
  late String description;

  @JsonKey(name: "url")
  late String url;

  @JsonKey(name: "urlToImage")
  late String urlToImage;

  @JsonKey(name: "publishedAt")
  late String publishedAt;

  DateTime? get getPublishedAtDate => DateTime.tryParse(publishedAt);

  @JsonKey(name: "content")
  late String content;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
