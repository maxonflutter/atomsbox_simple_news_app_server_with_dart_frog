import 'package:json_annotation/json_annotation.dart';

import 'author.dart';

part 'article.g.dart';

enum NewsCategory {
  @JsonValue('economy')
  economy,
  @JsonValue('politics')
  politics,
  @JsonValue('entertainment')
  entertainment,
  @JsonValue('sport')
  sport
}

@JsonSerializable(explicitToJson: true)
class Article {
  const Article({
    required this.id,
    required this.author,
    required this.headline,
    required this.leadParagraph,
    required this.supportingParagraph,
    required this.imageUrl,
    this.createdAt,
    this.modifiedAt,
    this.category,
    this.isBreakingNews = false,
    this.isPopular = false,
  });

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  /// A unique identifier for the Article
  final String id;

  /// The details about the author of the article
  final Author author;

  /// The title of the news article
  final String headline;

  /// Beginning of the article, briefly answers the questions “who”, “what”, “when”, “why”, “where”, and “how”
  final String leadParagraph;

  /// More content to develop the ideas introduced by the lead and give more information
  final List<String> supportingParagraph;

  /// The main image of the article
  final String imageUrl;

  /// The date/time at which the article was created
  final DateTime? createdAt;

  /// The date/time at which the article was last modified
  final DateTime? modifiedAt;

  /// The news category of the article
  final NewsCategory? category;

  /// Whether the article is one of the latest news in the app
  final bool isBreakingNews;

  /// Whether the article is among the most popular on the news app or not
  final bool isPopular;
}
