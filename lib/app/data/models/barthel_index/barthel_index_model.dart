import 'package:freezed_annotation/freezed_annotation.dart';

part 'barthel_index_model.freezed.dart';
part 'barthel_index_model.g.dart';

@freezed
class BarthelIndexModel with _$BarthelIndexModel {
  factory BarthelIndexModel({
    required int id,
    required String name,
    required String label,
    required List<BarthelIndexScoreModel> score,
    required String pointName,
    @Default('-') dynamic pointValue,
  }) = _BarthelIndexModel;

  factory BarthelIndexModel.fromJson(Map<String, dynamic> json) =>
      _$BarthelIndexModelFromJson(json);
}

@freezed
class BarthelIndexScoreModel with _$BarthelIndexScoreModel {
  factory BarthelIndexScoreModel({
    required String scoreName,
    required int scoreValue,
  }) = _BarthelIndexScoreModel;

  factory BarthelIndexScoreModel.fromJson(Map<String, dynamic> json) =>
      _$BarthelIndexScoreModelFromJson(json);
}
