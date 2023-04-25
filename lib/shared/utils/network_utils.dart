import 'dart:typed_data';

import 'package:change_house_colors/constants/network_constants.dart';
import 'package:dio/dio.dart';

class NetworkUtils {
  // Timeout 15 seconds
  static final Dio _dio = Dio(BaseOptions(
      baseUrl: networkHost, receiveTimeout: const Duration(seconds: 15)));

  static get(String path) async {
    final response = await _dio.get(path);
    final Map<String, dynamic> jsonMap = response.data;
    if (response.statusCode == 200) {
      return jsonMap['data'];
    }
    throw Exception(jsonMap['errorDetail']['message']);
  }

  static post(String path, dynamic bodyObject) async {
    final response = await _dio.post(path, data: bodyObject);
    final Map<String, dynamic> jsonMap = response.data;
    if (response.statusCode == 200) {
      return jsonMap['data'];
    }
    throw Exception(jsonMap['errorDetail']['message']);
  }

  static uploadFile(String path, Map<String, dynamic> mapData) async {
    final formData = FormData.fromMap(mapData);
    final response = await _dio.post(path, data: formData);
    final Map<String, dynamic> jsonMap = response.data;
    if (response.statusCode == 200) {
      return jsonMap['data'];
    }
    throw Exception(jsonMap['errorDetail']['message']);
  }

  static Future<Uint8List?> downloadFile(
      String path, Map<String, dynamic> mapData) async {
    final Response<List<int>> response = await _dio.post(path,
        data: mapData, options: Options(responseType: ResponseType.bytes));
    return response.data as Uint8List;
  }
}
