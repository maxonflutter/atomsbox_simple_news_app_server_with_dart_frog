import 'dart:io';

import 'package:atomsbox_simple_news_app_server_with_dart_frog/src/news_data_source/news_data_source.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  // final newsDataSource = context.read<NewsDataSource>();
  // final article = await newsDataSource.getArticleById(id: id);

  final newsDataSource = context.read<NewsDataSource>();
  final article = await newsDataSource.getArticleById(id: id);

  if (article == null) return Response(statusCode: HttpStatus.notFound);
  return Response.json(body: article.toJson());
}
