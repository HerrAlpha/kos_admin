import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:kos_admin/constant/core/api_const.dart';

class ApiServices {
  ApiServices._internal();
  static Uint8List error = Uint8List(8);
  static Dio dioCall(
      {Duration connectTimeout = const Duration(seconds: 20),
      String? token,
      String? authorization}) {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (token != null) {
      headers['token'] = token;
    }

    var dio = Dio(
      BaseOptions(
        headers: headers,
        baseUrl: ApiConst.baseUrl,
        connectTimeout: connectTimeout,
      ),
    );

    // Disable certificate verification (use it cautiously)
    // ignore: deprecated_member_use
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    return dio;
  }
}
