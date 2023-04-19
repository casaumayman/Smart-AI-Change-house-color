import 'dart:async';
import 'dart:io';
import 'package:change_house_colors/shared/utils/network_utils.dart';
import 'package:get/state_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;
// import 'package:get/get.dart';import 'dart:ui' as ui;

class PredictService extends GetxService {
  Future<bool> checkServer() async {
    final res = await NetworkUtils.get("/");
    return res != null;
  }

  Future<int> predict(String filePath, String fileName, bool useAsset) async {
    final file = File(filePath);
    final ext = path.extension(fileName).substring(1);
    late final MultipartFile multipartFile;
    if (useAsset) {
      final ByteData imageData = await rootBundle.load(filePath);
      final Uint8List uint8List = imageData.buffer.asUint8List();
      final List<int> imageDataBytes = uint8List.toList();
      multipartFile = MultipartFile.fromBytes(imageDataBytes,
          filename: fileName, contentType: MediaType('image', ext));
    } else {
      multipartFile = await MultipartFile.fromFile(file.path,
          filename: fileName, contentType: MediaType('image', ext));
    }
    final map = {
      "file": multipartFile,
    };
    final dataMap = await NetworkUtils.uploadFile("/predict", map);
    return dataMap['predictId'];
  }

  Future<dynamic> getResults(int predictId) async {
    final response = await NetworkUtils.get("/predict/mask-url/$predictId");
    if (response == null) {
      return null;
    }
    if (response['mask'] != null) {
      return response['mask'] as String;
    }
    if (response['inQueue'] != null) {
      return response;
    }
    return null;
  }

  String _colorToHexString(Color color) {
    String hexString = color.value.toRadixString(16).padLeft(6, '0');
    return "#$hexString";
  }

  Future<Uint8List?> changeColor(
      int predictId, Color roofColor, Color wallColor, Color doorColor) async {
    final body = {
      "predictId": predictId,
      "roofColor": _colorToHexString(roofColor),
      "wallColor": _colorToHexString(wallColor),
      "doorColor": _colorToHexString(doorColor)
    };
    final response =
        await NetworkUtils.downloadFile("/predict/change-color", body);
    if (response == null) {
      return null;
    }
    return response;
  }
}
