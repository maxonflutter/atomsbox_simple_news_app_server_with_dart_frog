import 'package:dart_frog/dart_frog.dart';

import '../news_data_source/remote_news_data_source.dart';

final _remoteNewsDataSource = RemoteNewsDataSource();

Middleware remoteNewsDataSourceProvider() {
  return (handler) {
    return handler
        .use(provider<RemoteNewsDataSource>((_) => _remoteNewsDataSource));
  };
}
