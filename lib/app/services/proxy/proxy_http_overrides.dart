import 'dart:io';

import 'package:flutter/foundation.dart';

class ProxyHttpOverrides extends HttpOverrides {
  final String _proxy;
  ProxyHttpOverrides(this._proxy);

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..findProxy = (uri) {
        return "PROXY $_proxy;";
      }
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => kDebugMode;
  }
}
