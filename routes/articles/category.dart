import 'dart:io';

import 'package:atomsbox_simple_news_app_server_with_dart_frog/src/news_data_source/news_data_source.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final newsDataSource = context.read<NewsDataSource>();

  final params = context.request.uri.queryParameters;
  var newsCategory = params['newsCategory'];

  final articles = await newsDataSource.getArticlesByCategory(
    newsCategory: newsCategory ?? '',
  );

  if (articles.isEmpty) return Response(statusCode: HttpStatus.notFound);

  return Response.json(
    body: {
      'results': articles.map((article) => article.toJson()).toList(),
    },
  );
}
