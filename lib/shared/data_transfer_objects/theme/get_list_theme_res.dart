import 'package:change_house_colors/shared/models/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_list_theme_res.g.dart';

@JsonSerializable()
class GetListThemeRes {
  final List<ThemeModel> exterior;
  final List<ThemeModel> interior;
  GetListThemeRes(this.interior, this.exterior);

  factory GetListThemeRes.fromJson(Map<String, dynamic> json) =>
      _$GetListThemeResFromJson(json);
}
