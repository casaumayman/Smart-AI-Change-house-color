import 'package:json_annotation/json_annotation.dart';

part 'base_res.g.dart';

@JsonSerializable()
class ErrorDetail {
  final String message;
  final dynamic errorData;

  ErrorDetail(this.errorData, this.message);
  factory ErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailFromJson(json);
}

@JsonSerializable()
class BaseRes {
  final bool isError;
  final dynamic data;
  final ErrorDetail? errorDetail;

  BaseRes(this.isError, this.data, this.errorDetail);
  factory BaseRes.fromJson(Map<String, dynamic> json) =>
      _$BaseResFromJson(json);
}
