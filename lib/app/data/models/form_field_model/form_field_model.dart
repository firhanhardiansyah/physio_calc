import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_field_model.freezed.dart';
part 'form_field_model.g.dart';

@freezed
class FormFieldModel with _$FormFieldModel {
  factory FormFieldModel({
    required int fieldId,
    required String fieldName,
    required String fieldLabel,
    required List<FormFieldScoreModel> fieldScores,
    required String fieldPointName,
    @Default('-') dynamic fieldPointValue,
    String? fieldImageAssets,
  }) = _FormFieldModel;

  factory FormFieldModel.fromJson(Map<String, dynamic> json) =>
      _$FormFieldModelFromJson(json);

  static List<FormFieldModel> listFromJson(list) =>
      List<FormFieldModel>.from(list.map((x) => FormFieldModel.fromJson(x)));
}

@freezed
class FormFieldScoreModel with _$FormFieldScoreModel {
  factory FormFieldScoreModel({
    int? scoreId,
    required String scoreName,
    required int scoreValue,
  }) = _FormFieldScoreModel;

  factory FormFieldScoreModel.fromJson(Map<String, dynamic> json) =>
      _$FormFieldScoreModelFromJson(json);
}

@freezed
class QuestionModel with _$QuestionModel {

  factory QuestionModel({
    required int id,
    required String questionName,
    @Default(0) int questionPoint,
    required List<FormFieldModel> fields,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);
  
  static List<QuestionModel> listFromJson(list) =>
      List<QuestionModel>.from(list.map((x) => QuestionModel.fromJson(x)));
}