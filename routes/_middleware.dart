import 'package:atomsbox_simple_news_app_server_with_dart_frog/src/middleware/news_data_source_provider.dart';
import 'package:atomsbox_simple_news_app_server_with_dart_frog/src/middleware/remote_news_data_source_provider.dart';
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      // .use(newsDataSourceProvider())
      .use(remoteNewsDataSourceProvider());
}
