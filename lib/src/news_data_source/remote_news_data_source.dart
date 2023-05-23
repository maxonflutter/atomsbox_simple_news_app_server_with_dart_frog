import 'package:postgres/postgres.dart';

import '../models/article.dart';
import '../models/author.dart';
import 'in_memory_news_data_source.dart';
import 'news_data_source.dart';

class RemoteNewsDataSource implements NewsDataSource {
  RemoteNewsDataSource();

  PostgreSQLConnection get connection => _connection;

  final _connection = PostgreSQLConnection(
    'localhost',
    5432,
    'mydatabase',
    username: 'myuser',
    password: 'mypassword',
  );

  initPostgresConnection() async {
    _connection.open().then((value) {
      print("Database Connected!");
    });
  }

  @override
  Future<Article?> getArticleById({
    required String id,
  }) async {
    if (_connection.isClosed) {
      await initPostgresConnection();
    }
    try {
      List<Map<String, Map<String, dynamic>>> results =
          await _connection.mappedResultsQuery("""
          SELECT
            id,
            author_id,
            headline,
            lead_paragraph,
            image_url,
            is_breaking_news,
            is_popular,
            category
          FROM articles WHERE id = @idValue
          """, substitutionValues: {"idValue": id});

      return Article(
        id: '${results[0]['articles']!['id']}',
        author: Author(
          id: '${results[0]['articles']!['author_id']}',
          name: '${results[0]['articles']!['author_id']}',
          surname: '${results[0]['articles']!['author_id']}',
        ),
        headline: results[0]['articles']!['headline'],
        leadParagraph: results[0]['articles']!['lead_paragraph'],
        supportingParagraph: [results[0]['articles']!['lead_paragraph']],
        imageUrl: results[0]['articles']!['image_url'],
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<Article>> getArticlesByCategory({
    required String newsCategory,
  }) async {
    if (_connection.isClosed) {
      await initPostgresConnection();
    }
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
    if (_connection.isClosed) {
      await initPostgresConnection();
    }
    try {
      return articles.where((article) => article.isPopular).toList();
    } catch (_) {
      return [Article.empty];
    }
  }

  @override
  Future<List<Article>> getBreakingNewsArticles() async {
    if (_connection.isClosed) {
      await initPostgresConnection();
    }
    try {
      List<List<dynamic>> results = await _connection.query("""
          SELECT 
            id,  
            author_id,
            headline,
            lead_paragraph,
            image_url,
            is_breaking_news,
            is_popular,
            category,
          FROM articles 
          WHERE is_breaking_news = @is_breaking_newsValue
          """, substitutionValues: {"is_breaking_newsValue": true});

      for (final row in results) {
        var a = row[0];
        var b = row[1];
        print(row);
      }

      return articles.where((article) => article.isBreakingNews).toList();
    } catch (_) {
      return [Article.empty];
    }
  }
}
