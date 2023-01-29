// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ugo_fisch_scale_field_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UgoFischScaleFieldModel _$$_UgoFischScaleFieldModelFromJson(
        Map<String, dynamic> json) =>
    _$_UgoFischScaleFieldModel(
      name: json['name'] as String,
      label: json['label'] as String,
      pointName: json['pointName'] as String,
      pointValue: json['pointValue'] ?? '-',
    );

Map<String, dynamic> _$$_UgoFischScaleFieldModelToJson(
        _$_UgoFischScaleFieldModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
      'pointName': instance.pointName,
      'pointValue': instance.pointValue,
    };
