import 'package:atomsbox_simple_news_app_server_with_dart_frog/src/news_data_source/news_data_source.dart';
import 'package:dart_frog/dart_frog.dart';

import '../news_data_source/remote_news_data_source.dart';

final _remoteNewsDataSource = RemoteNewsDataSource();

Middleware remoteNewsDataSourceProvider() {
  return (handler) {
    return handler.use(provider<NewsDataSource>((_) => _remoteNewsDataSource));
  };
}
