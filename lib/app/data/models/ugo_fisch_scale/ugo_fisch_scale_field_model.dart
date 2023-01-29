import 'package:freezed_annotation/freezed_annotation.dart';

part 'ugo_fisch_scale_field_model.freezed.dart';
part 'ugo_fisch_scale_field_model.g.dart';

@freezed
class UgoFischScaleFieldModel with _$UgoFischScaleFieldModel {

  factory UgoFischScaleFieldModel({
    required String name,
    required String label,
    required String pointName,
    @Default('-') dynamic pointValue,
  }) = _UgoFischScaleFieldModel;

  factory UgoFischScaleFieldModel.fromJson(Map<String, dynamic> json) => _$UgoFischScaleFieldModelFromJson(json);
}