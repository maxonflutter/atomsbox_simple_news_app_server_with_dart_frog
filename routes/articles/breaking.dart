import 'dart:io';

import 'package:atomsbox_simple_news_app_server_with_dart_frog/src/news_data_source/news_data_source.dart';
import 'package:atomsbox_simple_news_app_server_with_dart_frog/src/news_data_source/remote_news_data_source.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:postgres/postgres.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  var connection = context.read<RemoteNewsDataSource>();

  final results = await connection.runQuery();

  for (final row in results) {
    var a = row[0];
    var b = row[1];
    print(row);
  }

  final newsDataSource = context.read<NewsDataSource>();
  final articles = await newsDataSource.getBreakingNewsArticles();

  if (articles.isEmpty) return Response(statusCode: HttpStatus.notFound);

  return Response.json(
    body: {
      'results': articles.map((article) => article.toJson()).toList(),
    },
  );
}
