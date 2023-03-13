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
    return articles.where((article) => article.id == id).first;
  }

  @override
  Future<List<Article>> getArticlesByCategory({
    required String newsCategory,
  }) async {
    return articles
        .where((article) => article.category?.name == newsCategory)
        .toList();
  }

  @override
  Future<List<Article>> getPopularArticles() async {
    return articles.where((article) => article.isPopular).toList();
  }

  @override
  Future<List<Article>> getBreakingNewsArticles() async {
    return articles.where((article) => article.isBreakingNews).toList();
  }
}
