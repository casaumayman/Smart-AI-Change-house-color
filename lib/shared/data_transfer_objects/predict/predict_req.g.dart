// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predict_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PredictReq _$PredictReqFromJson(Map<String, dynamic> json) => PredictReq(
      json['inputName'] as String,
      json['numOfResult'] as int,
      json['themeId'] as int,
    );

Map<String, dynamic> _$PredictReqToJson(PredictReq instance) =>
    <String, dynamic>{
      'inputName': instance.inputName,
      'themeId': instance.themeId,
      'numOfResult': instance.numOfResult,
    };
