// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author.toJson(),
      'headline': instance.headline,
      'leadParagraph': instance.leadParagraph,
      'supportingParagraph': instance.supportingParagraph,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt?.toIso8601String(),
      'modifiedAt': instance.modifiedAt?.toIso8601String(),
      'category': _$NewsCategoryEnumMap[instance.category],
      'isBreakingNews': instance.isBreakingNews,
      'isPopular': instance.isPopular,
    };

const _$NewsCategoryEnumMap = {
  NewsCategory.economy: 'economy',
  NewsCategory.politics: 'politics',
  NewsCategory.entertainment: 'entertainment',
  NewsCategory.sport: 'sport',
};
