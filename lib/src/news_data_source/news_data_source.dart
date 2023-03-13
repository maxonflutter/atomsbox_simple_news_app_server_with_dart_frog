import '../models/models.dart';

abstract class NewsDataSource {
  const NewsDataSource();

  Future<Article?> getArticleById({required String id});

  Future<List<Article>> getPopularArticles();

  Future<List<Article>> getBreakingNewsArticles();

  Future<List<Article>> getArticlesByCategory({required String newsCategory});
}
