import 'package:dio/dio.dart';

class HTTPClientService {
  late final Dio _instance;
  final String baseURL;

  HTTPClientService({required this.baseURL}) {
    _instance = Dio();
  }

  get(String url) async {
    final response = await _instance.get(baseURL + url);
    return response;
  }

  post(String url, Map<String, dynamic> data) async {
    final response = await _instance.post(baseURL + url, data: data);
    return response;
  }

  put(String url, Map<String, dynamic> data) async {
    final response = await _instance.put(baseURL + url, data: data);
    return response;
  }

  delete(String url) async {
    final response = await _instance.delete(baseURL + url);
    return response;
  }
}
