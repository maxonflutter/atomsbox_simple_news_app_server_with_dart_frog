import '../models/article.dart';
import '../models/author.dart';
import 'news_data_source.dart';

part 'static_news_data.dart';

class InMemoryNewsDataSource implements NewsDataSource {
  InMemoryNewsDataSource();

  @override
  Future<Article?> getArticleById({
    required String id,
  }) async {
    try {
      return articles.where((article) => article.id == id).first;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<Article>> getArticlesByCategory({
    required String newsCategory,
  }) async {
    try {
      return articles
          .where((article) => article.category?.name == newsCategory)
          .toList();
    } catch (_) {
      return [Article.empty];
    }
  }

  @override
  Future<List<Article>> getPopularArticles() async {
    try {
      return articles.where((article) => article.isPopular).toList();
    } catch (_) {
      return [Article.empty];
    }
  }

  @override
  Future<List<Article>> getBreakingNewsArticles() async {
    try {
      return articles.where((article) => article.isBreakingNews).toList();
    } catch (_) {
      return [Article.empty];
    }
  }
}
