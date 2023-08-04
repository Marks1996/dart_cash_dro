import 'dart:convert';
import 'dart:io';

import 'model/export.dart';

/// Http请求类
class Http {
  factory Http() => _instance;
  static final Http _instance = Http._internal();
  Http._internal();

  /// get请求
  Future<Result<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic jsonAsT,
  }) async {
    final httpClient = HttpClient();
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) {
      return true;
    };

    if (queryParameters != null) {
      url += '?';
      queryParameters.forEach((key, value) {
        url += '$key=$value&';
      });
      url = url.substring(0, url.length - 1);
    }
    httpClient.connectionTimeout = Duration(seconds: 30);
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.set('Content-Type', 'application/json');
    HttpClientResponse response = await request.close();
    String resultStr = await response.transform(utf8.decoder).join();
    httpClient.close();
    final result = Result<T>.fromJson(jsonDecode(resultStr), jsonAsT);
    return result;
  }
}
