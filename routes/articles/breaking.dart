import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  return Response(
    body: 'This route returns a list of breaking news articles',
  );
}
