import 'package:dio/dio.dart';

class HTTPClient {
  final _instance = Dio();

   get(String url) async {
    final response = await _instance.get(url);
    return response;
  }

  post(String url, Map<String, dynamic> data) async {
    final response = await _instance.post(url, data: data);
    return response;
  }
}