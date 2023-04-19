import 'package:json_annotation/json_annotation.dart';

part 'predict_req.g.dart';

@JsonSerializable()
class PredictReq {
  final String inputName;
  final int themeId;
  final int numOfResult;

  PredictReq(this.inputName, this.numOfResult, this.themeId);
  Map<String, dynamic> toJson() => _$PredictReqToJson(this);
}
