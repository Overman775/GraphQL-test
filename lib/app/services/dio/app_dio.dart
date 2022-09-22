import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AppDio {
  Dio init() {
    final dio = Dio();

    // dio.httpClientAdapter = HttpCompressAdapter(
    //   Http2Adapter(
    //     ConnectionManager(
    //       // Ignore bad certificate
    //       onClientCreate: (_, config) {
    //         config
    //           ..onBadCertificate = _onBadCertificate
    //           ..proxy = _getProxy();
    //       },
    //     ),
    //   ),
    // );

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      );
    }

    return dio;
  }

  bool _onBadCertificate(X509Certificate _) => kDebugMode;

  Uri? _getProxy() {
    const String? proxyUrl = null;

    return proxyUrl != null
        ? proxyUrl.startsWith('http://') || proxyUrl.startsWith('https://')
            ? Uri.parse(proxyUrl)
            : Uri.parse('http://$proxyUrl')
        : null;
  }
}
