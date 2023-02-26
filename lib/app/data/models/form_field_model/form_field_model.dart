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
