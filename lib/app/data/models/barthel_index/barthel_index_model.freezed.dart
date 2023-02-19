// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'barthel_index_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BarthelIndexModel _$BarthelIndexModelFromJson(Map<String, dynamic> json) {
  return _BarthelIndexModel.fromJson(json);
}

/// @nodoc
mixin _$BarthelIndexModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  List<BarthelIndexScoreModel> get score => throw _privateConstructorUsedError;
  String get pointName => throw _privateConstructorUsedError;
  dynamic get pointValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BarthelIndexModelCopyWith<BarthelIndexModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarthelIndexModelCopyWith<$Res> {
  factory $BarthelIndexModelCopyWith(
          BarthelIndexModel value, $Res Function(BarthelIndexModel) then) =
      _$BarthelIndexModelCopyWithImpl<$Res, BarthelIndexModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String label,
      List<BarthelIndexScoreModel> score,
      String pointName,
      dynamic pointValue});
}

/// @nodoc
class _$BarthelIndexModelCopyWithImpl<$Res, $Val extends BarthelIndexModel>
    implements $BarthelIndexModelCopyWith<$Res> {
  _$BarthelIndexModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? label = null,
    Object? score = null,
    Object? pointName = null,
    Object? pointValue = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as List<BarthelIndexScoreModel>,
      pointName: null == pointName
          ? _value.pointName
          : pointName // ignore: cast_nullable_to_non_nullable
              as String,
      pointValue: freezed == pointValue
          ? _value.pointValue
          : pointValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BarthelIndexModelCopyWith<$Res>
    implements $BarthelIndexModelCopyWith<$Res> {
  factory _$$_BarthelIndexModelCopyWith(_$_BarthelIndexModel value,
          $Res Function(_$_BarthelIndexModel) then) =
      __$$_BarthelIndexModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String label,
      List<BarthelIndexScoreModel> score,
      String pointName,
      dynamic pointValue});
}

/// @nodoc
class __$$_BarthelIndexModelCopyWithImpl<$Res>
    extends _$BarthelIndexModelCopyWithImpl<$Res, _$_BarthelIndexModel>
    implements _$$_BarthelIndexModelCopyWith<$Res> {
  __$$_BarthelIndexModelCopyWithImpl(
      _$_BarthelIndexModel _value, $Res Function(_$_BarthelIndexModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? label = null,
    Object? score = null,
    Object? pointName = null,
    Object? pointValue = freezed,
  }) {
    return _then(_$_BarthelIndexModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value._score
          : score // ignore: cast_nullable_to_non_nullable
              as List<BarthelIndexScoreModel>,
      pointName: null == pointName
          ? _value.pointName
          : pointName // ignore: cast_nullable_to_non_nullable
              as String,
      pointValue: freezed == pointValue
          ? _value.pointValue
          : pointValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BarthelIndexModel implements _BarthelIndexModel {
  _$_BarthelIndexModel(
      {required this.id,
      required this.name,
      required this.label,
      required final List<BarthelIndexScoreModel> score,
      required this.pointName,
      this.pointValue = '-'})
      : _score = score;

  factory _$_BarthelIndexModel.fromJson(Map<String, dynamic> json) =>
      _$$_BarthelIndexModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String label;
  final List<BarthelIndexScoreModel> _score;
  @override
  List<BarthelIndexScoreModel> get score {
    if (_score is EqualUnmodifiableListView) return _score;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_score);
  }

  @override
  final String pointName;
  @override
  @JsonKey()
  final dynamic pointValue;

  @override
  String toString() {
    return 'BarthelIndexModel(id: $id, name: $name, label: $label, score: $score, pointName: $pointName, pointValue: $pointValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BarthelIndexModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(other._score, _score) &&
            (identical(other.pointName, pointName) ||
                other.pointName == pointName) &&
            const DeepCollectionEquality()
                .equals(other.pointValue, pointValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      label,
      const DeepCollectionEquality().hash(_score),
      pointName,
      const DeepCollectionEquality().hash(pointValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BarthelIndexModelCopyWith<_$_BarthelIndexModel> get copyWith =>
      __$$_BarthelIndexModelCopyWithImpl<_$_BarthelIndexModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BarthelIndexModelToJson(
      this,
    );
  }
}

abstract class _BarthelIndexModel implements BarthelIndexModel {
  factory _BarthelIndexModel(
      {required final int id,
      required final String name,
      required final String label,
      required final List<BarthelIndexScoreModel> score,
      required final String pointName,
      final dynamic pointValue}) = _$_BarthelIndexModel;

  factory _BarthelIndexModel.fromJson(Map<String, dynamic> json) =
      _$_BarthelIndexModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get label;
  @override
  List<BarthelIndexScoreModel> get score;
  @override
  String get pointName;
  @override
  dynamic get pointValue;
  @override
  @JsonKey(ignore: true)
  _$$_BarthelIndexModelCopyWith<_$_BarthelIndexModel> get copyWith =>
      throw _privateConstructorUsedError;
}

BarthelIndexScoreModel _$BarthelIndexScoreModelFromJson(
    Map<String, dynamic> json) {
  return _BarthelIndexScoreModel.fromJson(json);
}

/// @nodoc
mixin _$BarthelIndexScoreModel {
  String get scoreName => throw _privateConstructorUsedError;
  int get scoreValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BarthelIndexScoreModelCopyWith<BarthelIndexScoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarthelIndexScoreModelCopyWith<$Res> {
  factory $BarthelIndexScoreModelCopyWith(BarthelIndexScoreModel value,
          $Res Function(BarthelIndexScoreModel) then) =
      _$BarthelIndexScoreModelCopyWithImpl<$Res, BarthelIndexScoreModel>;
  @useResult
  $Res call({String scoreName, int scoreValue});
}

/// @nodoc
class _$BarthelIndexScoreModelCopyWithImpl<$Res,
        $Val extends BarthelIndexScoreModel>
    implements $BarthelIndexScoreModelCopyWith<$Res> {
  _$BarthelIndexScoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scoreName = null,
    Object? scoreValue = null,
  }) {
    return _then(_value.copyWith(
      scoreName: null == scoreName
          ? _value.scoreName
          : scoreName // ignore: cast_nullable_to_non_nullable
              as String,
      scoreValue: null == scoreValue
          ? _value.scoreValue
          : scoreValue // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BarthelIndexScoreModelCopyWith<$Res>
    implements $BarthelIndexScoreModelCopyWith<$Res> {
  factory _$$_BarthelIndexScoreModelCopyWith(_$_BarthelIndexScoreModel value,
          $Res Function(_$_BarthelIndexScoreModel) then) =
      __$$_BarthelIndexScoreModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String scoreName, int scoreValue});
}

/// @nodoc
class __$$_BarthelIndexScoreModelCopyWithImpl<$Res>
    extends _$BarthelIndexScoreModelCopyWithImpl<$Res,
        _$_BarthelIndexScoreModel>
    implements _$$_BarthelIndexScoreModelCopyWith<$Res> {
  __$$_BarthelIndexScoreModelCopyWithImpl(_$_BarthelIndexScoreModel _value,
      $Res Function(_$_BarthelIndexScoreModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scoreName = null,
    Object? scoreValue = null,
  }) {
    return _then(_$_BarthelIndexScoreModel(
      scoreName: null == scoreName
          ? _value.scoreName
          : scoreName // ignore: cast_nullable_to_non_nullable
              as String,
      scoreValue: null == scoreValue
          ? _value.scoreValue
          : scoreValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BarthelIndexScoreModel implements _BarthelIndexScoreModel {
  _$_BarthelIndexScoreModel(
      {required this.scoreName, required this.scoreValue});

  factory _$_BarthelIndexScoreModel.fromJson(Map<String, dynamic> json) =>
      _$$_BarthelIndexScoreModelFromJson(json);

  @override
  final String scoreName;
  @override
  final int scoreValue;

  @override
  String toString() {
    return 'BarthelIndexScoreModel(scoreName: $scoreName, scoreValue: $scoreValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BarthelIndexScoreModel &&
            (identical(other.scoreName, scoreName) ||
                other.scoreName == scoreName) &&
            (identical(other.scoreValue, scoreValue) ||
                other.scoreValue == scoreValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, scoreName, scoreValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BarthelIndexScoreModelCopyWith<_$_BarthelIndexScoreModel> get copyWith =>
      __$$_BarthelIndexScoreModelCopyWithImpl<_$_BarthelIndexScoreModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BarthelIndexScoreModelToJson(
      this,
    );
  }
}

abstract class _BarthelIndexScoreModel implements BarthelIndexScoreModel {
  factory _BarthelIndexScoreModel(
      {required final String scoreName,
      required final int scoreValue}) = _$_BarthelIndexScoreModel;

  factory _BarthelIndexScoreModel.fromJson(Map<String, dynamic> json) =
      _$_BarthelIndexScoreModel.fromJson;

  @override
  String get scoreName;
  @override
  int get scoreValue;
  @override
  @JsonKey(ignore: true)
  _$$_BarthelIndexScoreModelCopyWith<_$_BarthelIndexScoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}
