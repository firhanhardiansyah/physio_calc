import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_model.freezed.dart';
part 'feature_model.g.dart';

@freezed
class FeatureModel with _$FeatureModel {
  factory FeatureModel(
      {required int id,
      required String name,
      required String route,
      required bool actived
      }) = _FeatureModel;

  factory FeatureModel.fromJson(Map<String, dynamic> json) =>
      _$FeatureModelFromJson(json);
}
