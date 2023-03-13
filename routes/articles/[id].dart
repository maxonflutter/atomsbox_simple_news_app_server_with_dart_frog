import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context, String id) {
  return Response(
    body: 'This route returns an article based on the ID provided $id',
  );
}
