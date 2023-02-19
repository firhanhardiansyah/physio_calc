// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barthel_index_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BarthelIndexModel _$$_BarthelIndexModelFromJson(Map<String, dynamic> json) =>
    _$_BarthelIndexModel(
      id: json['id'] as int,
      name: json['name'] as String,
      label: json['label'] as String,
      score: (json['score'] as List<dynamic>)
          .map(
              (e) => BarthelIndexScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pointName: json['pointName'] as String,
      pointValue: json['pointValue'] ?? '-',
    );

Map<String, dynamic> _$$_BarthelIndexModelToJson(
        _$_BarthelIndexModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'label': instance.label,
      'score': instance.score,
      'pointName': instance.pointName,
      'pointValue': instance.pointValue,
    };

_$_BarthelIndexScoreModel _$$_BarthelIndexScoreModelFromJson(
        Map<String, dynamic> json) =>
    _$_BarthelIndexScoreModel(
      scoreName: json['scoreName'] as String,
      scoreValue: json['scoreValue'] as int,
    );

Map<String, dynamic> _$$_BarthelIndexScoreModelToJson(
        _$_BarthelIndexScoreModel instance) =>
    <String, dynamic>{
      'scoreName': instance.scoreName,
      'scoreValue': instance.scoreValue,
    };
