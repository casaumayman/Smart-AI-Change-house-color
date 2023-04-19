import 'package:json_annotation/json_annotation.dart';

part 'theme_model.g.dart';

@JsonSerializable()
class ThemeModel {
  ThemeModel(this.id, this.name);
  int id;
  String name;

  factory ThemeModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeModelFromJson(json);
}
