import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:jbbase_app/utils/config/app_config.dart';

import '../interceptor/header_interceptor.dart';
import '../interceptor/log_interceptor.dart';
import '../interceptor/token_interceptor.dart';

enum DioBulderType { withToken, ignoredToken, refresh }

class DioBuilder extends DioMixin implements Dio {
  final String contentType = 'application/json';
  final Duration connectionTimeOutMls = const Duration(seconds: 30);
  final Duration readTimeOutMls = const Duration(seconds: 30);
  final Duration writeTimeOutMls = const Duration(seconds: 30);

  DioBuilder(
      {bool ignoredToken = false,
      required BaseOptions options,
      Dio? dioRefresh}) {
    options = BaseOptions(
      baseUrl: options.baseUrl,
      contentType: contentType,
      connectTimeout: connectionTimeOutMls,
      receiveTimeout: readTimeOutMls,
      sendTimeout: writeTimeOutMls,
    );

    this.options = options;

    interceptors.add(HeaderInterceptor());

    if (!ignoredToken && dioRefresh != null) {
      interceptors.add(TokenInterceptor(dioRefresh));
    }

    // interceptors.add(RetryInterceptor(
    //   dio: this,
    //   logPrint: print,
    //   retries: 2,
    //   retryDelays: const [
    //     Duration(seconds: 1),
    //     Duration(seconds: 3),
    //   ],
    // ));

    // Config cache
    // final cacheConfig = CacheConfig(baseUrl: Constants.shared().endpoint);
    // interceptors.add(DioCacheManager(cacheConfig).interceptor as InterceptorsWrapper);

    // Debug mode
    if (kDebugMode) {
      // interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
      interceptors.add(
        CustomLogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
          error: true,
          maxWidth: 100,
        ),
      );
    }

    // Create default http client
    httpClientAdapter = IOHttpClientAdapter();

    final proxy = AppConfig.currentProxy;
    if (proxy != null) {
      (httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          return Platform.isAndroid;
        };
        client.findProxy = (url) {
          return 'PROXY $proxy';
        };

        return null;
      };
    }
  }
}
