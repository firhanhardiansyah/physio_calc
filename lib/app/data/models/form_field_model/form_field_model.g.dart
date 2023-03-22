// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_field_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FormFieldModel _$$_FormFieldModelFromJson(Map<String, dynamic> json) =>
    _$_FormFieldModel(
      fieldId: json['fieldId'] as int,
      fieldName: json['fieldName'] as String,
      fieldLabel: json['fieldLabel'] as String,
      fieldScores: (json['fieldScores'] as List<dynamic>)
          .map((e) => FormFieldScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      fieldPointName: json['fieldPointName'] as String,
      fieldPointValue: json['fieldPointValue'] ?? '-',
      fieldImageAssets: json['fieldImageAssets'] as String?,
    );

Map<String, dynamic> _$$_FormFieldModelToJson(_$_FormFieldModel instance) =>
    <String, dynamic>{
      'fieldId': instance.fieldId,
      'fieldName': instance.fieldName,
      'fieldLabel': instance.fieldLabel,
      'fieldScores': instance.fieldScores,
      'fieldPointName': instance.fieldPointName,
      'fieldPointValue': instance.fieldPointValue,
      'fieldImageAssets': instance.fieldImageAssets,
    };

_$_FormFieldScoreModel _$$_FormFieldScoreModelFromJson(
        Map<String, dynamic> json) =>
    _$_FormFieldScoreModel(
      scoreId: json['scoreId'] as int?,
      scoreName: json['scoreName'] as String,
      scoreValue: json['scoreValue'] as int,
    );

Map<String, dynamic> _$$_FormFieldScoreModelToJson(
        _$_FormFieldScoreModel instance) =>
    <String, dynamic>{
      'scoreId': instance.scoreId,
      'scoreName': instance.scoreName,
      'scoreValue': instance.scoreValue,
    };

_$_QuestionModel _$$_QuestionModelFromJson(Map<String, dynamic> json) =>
    _$_QuestionModel(
      id: json['id'] as int,
      questionName: json['questionName'] as String,
      questionPoint: json['questionPoint'] as int? ?? 0,
      fields: (json['fields'] as List<dynamic>)
          .map((e) => FormFieldModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QuestionModelToJson(_$_QuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionName': instance.questionName,
      'questionPoint': instance.questionPoint,
      'fields': instance.fields,
    };
