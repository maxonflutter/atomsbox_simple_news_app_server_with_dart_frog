import 'package:dart_frog/dart_frog.dart';

import '../news_data_source/in_memory_news_data_source.dart';
import '../news_data_source/news_data_source.dart';

final _newsDataSource = InMemoryNewsDataSource();

/// Provider of a [NewsDataSource] to the current [RequestContext].
Middleware newsDataSourceProvider() {
  return (handler) {
    return handler.use(provider<NewsDataSource>((_) => _newsDataSource));
  };
}
