// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_list_theme_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetListThemeRes _$GetListThemeResFromJson(Map<String, dynamic> json) =>
    GetListThemeRes(
      (json['interior'] as List<dynamic>)
          .map((e) => ThemeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['exterior'] as List<dynamic>)
          .map((e) => ThemeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetListThemeResToJson(GetListThemeRes instance) =>
    <String, dynamic>{
      'exterior': instance.exterior,
      'interior': instance.interior,
    };
