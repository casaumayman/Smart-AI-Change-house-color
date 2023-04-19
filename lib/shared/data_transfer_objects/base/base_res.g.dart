// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorDetail _$ErrorDetailFromJson(Map<String, dynamic> json) => ErrorDetail(
      json['errorData'],
      json['message'] as String,
    );

Map<String, dynamic> _$ErrorDetailToJson(ErrorDetail instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errorData': instance.errorData,
    };

BaseRes _$BaseResFromJson(Map<String, dynamic> json) => BaseRes(
      json['isError'] as bool,
      json['data'],
      json['errorDetail'] == null
          ? null
          : ErrorDetail.fromJson(json['errorDetail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseResToJson(BaseRes instance) => <String, dynamic>{
      'isError': instance.isError,
      'data': instance.data,
      'errorDetail': instance.errorDetail,
    };
