import 'package:dart_frog/dart_frog.dart';
import 'package:postgres/postgres.dart';
import 'package:stormberry/stormberry.dart';

import '../news_data_source/remote_news_data_source.dart';

final _remoteNewsDataSource = RemoteNewsDataSource();

Middleware remoteNewsDataSourceProvider() {
  return (handler) {
    return (context) async {
      return await handler(context.provide(() => _remoteNewsDataSource));
    };
    // return handler
    //     .use(provider<RemoteNewsDataSource>((_) => _remoteNewsDataSource));
  };
}

// Middleware bearerAuthentication() {
//   return (handler) {
//     return (context) async {
//       return await handler(context.provide(() => userId));
//     };
//   };
// }
