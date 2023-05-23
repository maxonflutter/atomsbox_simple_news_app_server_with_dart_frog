import 'package:postgres/postgres.dart';

import '../models/article.dart';
import 'in_memory_news_data_source.dart';
import 'news_data_source.dart';

class RemoteNewsDataSource implements NewsDataSource {
  RemoteNewsDataSource();

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

  Future<List<List<dynamic>>> runQuery() async {
    if (_connection.isClosed) {
      await initPostgresConnection();
    }

    List<List<dynamic>> results =
        await _connection.query("SELECT * FROM authors");
    return results;
  }

  @override
  Future<Article?> getArticleById({
    required String id,
  }) async {
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
          WHERE id = @idValue
          """, substitutionValues: {"idValue": 3});

      for (final row in results) {
        var a = row[0];
        var b = row[1];
      }
      return articles.where((article) => article.id == id).first;
    } catch (_) {
      return null;
    }
  }

// List<Map<String, Map<String, dynamic>>> results = await connection.mappedResultsQuery(
//   "SELECT t.id, t.name, u.name FROM t LEFT OUTER JOIN u ON t.id=u.t_id");

// for (final row in results) {
//   var tID = row["t"]["id"];
//   var tName = row["t"]["name"];
//   var uName = row["u"]["name"];
// }

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
      return articles.where((article) => article.isBreakingNews).toList();
    } catch (_) {
      return [Article.empty];
    }
  }
}
