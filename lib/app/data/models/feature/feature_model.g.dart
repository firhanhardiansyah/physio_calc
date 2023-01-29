// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeatureModel _$$_FeatureModelFromJson(Map<String, dynamic> json) =>
    _$_FeatureModel(
      id: json['id'] as int,
      name: json['name'] as String,
      route: json['route'] as String,
      actived: json['actived'] as bool,
    );

Map<String, dynamic> _$$_FeatureModelToJson(_$_FeatureModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'route': instance.route,
      'actived': instance.actived,
    };
