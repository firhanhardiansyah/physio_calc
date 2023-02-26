// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_field_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FormFieldModel _$FormFieldModelFromJson(Map<String, dynamic> json) {
  return _FormFieldModel.fromJson(json);
}

/// @nodoc
mixin _$FormFieldModel {
  int get fieldId => throw _privateConstructorUsedError;
  String get fieldName => throw _privateConstructorUsedError;
  String get fieldLabel => throw _privateConstructorUsedError;
  List<FormFieldScoreModel> get fieldScores =>
      throw _privateConstructorUsedError;
  String get fieldPointName => throw _privateConstructorUsedError;
  dynamic get fieldPointValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormFieldModelCopyWith<FormFieldModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormFieldModelCopyWith<$Res> {
  factory $FormFieldModelCopyWith(
          FormFieldModel value, $Res Function(FormFieldModel) then) =
      _$FormFieldModelCopyWithImpl<$Res, FormFieldModel>;
  @useResult
  $Res call(
      {int fieldId,
      String fieldName,
      String fieldLabel,
      List<FormFieldScoreModel> fieldScores,
      String fieldPointName,
      dynamic fieldPointValue});
}

/// @nodoc
class _$FormFieldModelCopyWithImpl<$Res, $Val extends FormFieldModel>
    implements $FormFieldModelCopyWith<$Res> {
  _$FormFieldModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldId = null,
    Object? fieldName = null,
    Object? fieldLabel = null,
    Object? fieldScores = null,
    Object? fieldPointName = null,
    Object? fieldPointValue = freezed,
  }) {
    return _then(_value.copyWith(
      fieldId: null == fieldId
          ? _value.fieldId
          : fieldId // ignore: cast_nullable_to_non_nullable
              as int,
      fieldName: null == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String,
      fieldLabel: null == fieldLabel
          ? _value.fieldLabel
          : fieldLabel // ignore: cast_nullable_to_non_nullable
              as String,
      fieldScores: null == fieldScores
          ? _value.fieldScores
          : fieldScores // ignore: cast_nullable_to_non_nullable
              as List<FormFieldScoreModel>,
      fieldPointName: null == fieldPointName
          ? _value.fieldPointName
          : fieldPointName // ignore: cast_nullable_to_non_nullable
              as String,
      fieldPointValue: freezed == fieldPointValue
          ? _value.fieldPointValue
          : fieldPointValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FormFieldModelCopyWith<$Res>
    implements $FormFieldModelCopyWith<$Res> {
  factory _$$_FormFieldModelCopyWith(
          _$_FormFieldModel value, $Res Function(_$_FormFieldModel) then) =
      __$$_FormFieldModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int fieldId,
      String fieldName,
      String fieldLabel,
      List<FormFieldScoreModel> fieldScores,
      String fieldPointName,
      dynamic fieldPointValue});
}

/// @nodoc
class __$$_FormFieldModelCopyWithImpl<$Res>
    extends _$FormFieldModelCopyWithImpl<$Res, _$_FormFieldModel>
    implements _$$_FormFieldModelCopyWith<$Res> {
  __$$_FormFieldModelCopyWithImpl(
      _$_FormFieldModel _value, $Res Function(_$_FormFieldModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldId = null,
    Object? fieldName = null,
    Object? fieldLabel = null,
    Object? fieldScores = null,
    Object? fieldPointName = null,
    Object? fieldPointValue = freezed,
  }) {
    return _then(_$_FormFieldModel(
      fieldId: null == fieldId
          ? _value.fieldId
          : fieldId // ignore: cast_nullable_to_non_nullable
              as int,
      fieldName: null == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String,
      fieldLabel: null == fieldLabel
          ? _value.fieldLabel
          : fieldLabel // ignore: cast_nullable_to_non_nullable
              as String,
      fieldScores: null == fieldScores
          ? _value._fieldScores
          : fieldScores // ignore: cast_nullable_to_non_nullable
              as List<FormFieldScoreModel>,
      fieldPointName: null == fieldPointName
          ? _value.fieldPointName
          : fieldPointName // ignore: cast_nullable_to_non_nullable
              as String,
      fieldPointValue: freezed == fieldPointValue
          ? _value.fieldPointValue
          : fieldPointValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FormFieldModel implements _FormFieldModel {
  _$_FormFieldModel(
      {required this.fieldId,
      required this.fieldName,
      required this.fieldLabel,
      required final List<FormFieldScoreModel> fieldScores,
      required this.fieldPointName,
      this.fieldPointValue = '-'})
      : _fieldScores = fieldScores;

  factory _$_FormFieldModel.fromJson(Map<String, dynamic> json) =>
      _$$_FormFieldModelFromJson(json);

  @override
  final int fieldId;
  @override
  final String fieldName;
  @override
  final String fieldLabel;
  final List<FormFieldScoreModel> _fieldScores;
  @override
  List<FormFieldScoreModel> get fieldScores {
    if (_fieldScores is EqualUnmodifiableListView) return _fieldScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fieldScores);
  }

  @override
  final String fieldPointName;
  @override
  @JsonKey()
  final dynamic fieldPointValue;

  @override
  String toString() {
    return 'FormFieldModel(fieldId: $fieldId, fieldName: $fieldName, fieldLabel: $fieldLabel, fieldScores: $fieldScores, fieldPointName: $fieldPointName, fieldPointValue: $fieldPointValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormFieldModel &&
            (identical(other.fieldId, fieldId) || other.fieldId == fieldId) &&
            (identical(other.fieldName, fieldName) ||
                other.fieldName == fieldName) &&
            (identical(other.fieldLabel, fieldLabel) ||
                other.fieldLabel == fieldLabel) &&
            const DeepCollectionEquality()
                .equals(other._fieldScores, _fieldScores) &&
            (identical(other.fieldPointName, fieldPointName) ||
                other.fieldPointName == fieldPointName) &&
            const DeepCollectionEquality()
                .equals(other.fieldPointValue, fieldPointValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fieldId,
      fieldName,
      fieldLabel,
      const DeepCollectionEquality().hash(_fieldScores),
      fieldPointName,
      const DeepCollectionEquality().hash(fieldPointValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FormFieldModelCopyWith<_$_FormFieldModel> get copyWith =>
      __$$_FormFieldModelCopyWithImpl<_$_FormFieldModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FormFieldModelToJson(
      this,
    );
  }
}

abstract class _FormFieldModel implements FormFieldModel {
  factory _FormFieldModel(
      {required final int fieldId,
      required final String fieldName,
      required final String fieldLabel,
      required final List<FormFieldScoreModel> fieldScores,
      required final String fieldPointName,
      final dynamic fieldPointValue}) = _$_FormFieldModel;

  factory _FormFieldModel.fromJson(Map<String, dynamic> json) =
      _$_FormFieldModel.fromJson;

  @override
  int get fieldId;
  @override
  String get fieldName;
  @override
  String get fieldLabel;
  @override
  List<FormFieldScoreModel> get fieldScores;
  @override
  String get fieldPointName;
  @override
  dynamic get fieldPointValue;
  @override
  @JsonKey(ignore: true)
  _$$_FormFieldModelCopyWith<_$_FormFieldModel> get copyWith =>
      throw _privateConstructorUsedError;
}

FormFieldScoreModel _$FormFieldScoreModelFromJson(Map<String, dynamic> json) {
  return _FormFieldScoreModel.fromJson(json);
}

/// @nodoc
mixin _$FormFieldScoreModel {
  int? get scoreId => throw _privateConstructorUsedError;
  String get scoreName => throw _privateConstructorUsedError;
  int get scoreValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormFieldScoreModelCopyWith<FormFieldScoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormFieldScoreModelCopyWith<$Res> {
  factory $FormFieldScoreModelCopyWith(
          FormFieldScoreModel value, $Res Function(FormFieldScoreModel) then) =
      _$FormFieldScoreModelCopyWithImpl<$Res, FormFieldScoreModel>;
  @useResult
  $Res call({int? scoreId, String scoreName, int scoreValue});
}

/// @nodoc
class _$FormFieldScoreModelCopyWithImpl<$Res, $Val extends FormFieldScoreModel>
    implements $FormFieldScoreModelCopyWith<$Res> {
  _$FormFieldScoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scoreId = freezed,
    Object? scoreName = null,
    Object? scoreValue = null,
  }) {
    return _then(_value.copyWith(
      scoreId: freezed == scoreId
          ? _value.scoreId
          : scoreId // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$_FormFieldScoreModelCopyWith<$Res>
    implements $FormFieldScoreModelCopyWith<$Res> {
  factory _$$_FormFieldScoreModelCopyWith(_$_FormFieldScoreModel value,
          $Res Function(_$_FormFieldScoreModel) then) =
      __$$_FormFieldScoreModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? scoreId, String scoreName, int scoreValue});
}

/// @nodoc
class __$$_FormFieldScoreModelCopyWithImpl<$Res>
    extends _$FormFieldScoreModelCopyWithImpl<$Res, _$_FormFieldScoreModel>
    implements _$$_FormFieldScoreModelCopyWith<$Res> {
  __$$_FormFieldScoreModelCopyWithImpl(_$_FormFieldScoreModel _value,
      $Res Function(_$_FormFieldScoreModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scoreId = freezed,
    Object? scoreName = null,
    Object? scoreValue = null,
  }) {
    return _then(_$_FormFieldScoreModel(
      scoreId: freezed == scoreId
          ? _value.scoreId
          : scoreId // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$_FormFieldScoreModel implements _FormFieldScoreModel {
  _$_FormFieldScoreModel(
      {this.scoreId, required this.scoreName, required this.scoreValue});

  factory _$_FormFieldScoreModel.fromJson(Map<String, dynamic> json) =>
      _$$_FormFieldScoreModelFromJson(json);

  @override
  final int? scoreId;
  @override
  final String scoreName;
  @override
  final int scoreValue;

  @override
  String toString() {
    return 'FormFieldScoreModel(scoreId: $scoreId, scoreName: $scoreName, scoreValue: $scoreValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormFieldScoreModel &&
            (identical(other.scoreId, scoreId) || other.scoreId == scoreId) &&
            (identical(other.scoreName, scoreName) ||
                other.scoreName == scoreName) &&
            (identical(other.scoreValue, scoreValue) ||
                other.scoreValue == scoreValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, scoreId, scoreName, scoreValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FormFieldScoreModelCopyWith<_$_FormFieldScoreModel> get copyWith =>
      __$$_FormFieldScoreModelCopyWithImpl<_$_FormFieldScoreModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FormFieldScoreModelToJson(
      this,
    );
  }
}

abstract class _FormFieldScoreModel implements FormFieldScoreModel {
  factory _FormFieldScoreModel(
      {final int? scoreId,
      required final String scoreName,
      required final int scoreValue}) = _$_FormFieldScoreModel;

  factory _FormFieldScoreModel.fromJson(Map<String, dynamic> json) =
      _$_FormFieldScoreModel.fromJson;

  @override
  int? get scoreId;
  @override
  String get scoreName;
  @override
  int get scoreValue;
  @override
  @JsonKey(ignore: true)
  _$$_FormFieldScoreModelCopyWith<_$_FormFieldScoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}
