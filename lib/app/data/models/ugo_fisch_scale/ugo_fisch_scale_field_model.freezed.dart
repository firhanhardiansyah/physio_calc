// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ugo_fisch_scale_field_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UgoFischScaleFieldModel _$UgoFischScaleFieldModelFromJson(
    Map<String, dynamic> json) {
  return _UgoFischScaleFieldModel.fromJson(json);
}

/// @nodoc
mixin _$UgoFischScaleFieldModel {
  String get name => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get pointName => throw _privateConstructorUsedError;
  dynamic get pointValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UgoFischScaleFieldModelCopyWith<UgoFischScaleFieldModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UgoFischScaleFieldModelCopyWith<$Res> {
  factory $UgoFischScaleFieldModelCopyWith(UgoFischScaleFieldModel value,
          $Res Function(UgoFischScaleFieldModel) then) =
      _$UgoFischScaleFieldModelCopyWithImpl<$Res, UgoFischScaleFieldModel>;
  @useResult
  $Res call({String name, String label, String pointName, dynamic pointValue});
}

/// @nodoc
class _$UgoFischScaleFieldModelCopyWithImpl<$Res,
        $Val extends UgoFischScaleFieldModel>
    implements $UgoFischScaleFieldModelCopyWith<$Res> {
  _$UgoFischScaleFieldModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? label = null,
    Object? pointName = null,
    Object? pointValue = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_UgoFischScaleFieldModelCopyWith<$Res>
    implements $UgoFischScaleFieldModelCopyWith<$Res> {
  factory _$$_UgoFischScaleFieldModelCopyWith(_$_UgoFischScaleFieldModel value,
          $Res Function(_$_UgoFischScaleFieldModel) then) =
      __$$_UgoFischScaleFieldModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String label, String pointName, dynamic pointValue});
}

/// @nodoc
class __$$_UgoFischScaleFieldModelCopyWithImpl<$Res>
    extends _$UgoFischScaleFieldModelCopyWithImpl<$Res,
        _$_UgoFischScaleFieldModel>
    implements _$$_UgoFischScaleFieldModelCopyWith<$Res> {
  __$$_UgoFischScaleFieldModelCopyWithImpl(_$_UgoFischScaleFieldModel _value,
      $Res Function(_$_UgoFischScaleFieldModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? label = null,
    Object? pointName = null,
    Object? pointValue = freezed,
  }) {
    return _then(_$_UgoFischScaleFieldModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_UgoFischScaleFieldModel implements _UgoFischScaleFieldModel {
  _$_UgoFischScaleFieldModel(
      {required this.name,
      required this.label,
      required this.pointName,
      this.pointValue = '-'});

  factory _$_UgoFischScaleFieldModel.fromJson(Map<String, dynamic> json) =>
      _$$_UgoFischScaleFieldModelFromJson(json);

  @override
  final String name;
  @override
  final String label;
  @override
  final String pointName;
  @override
  @JsonKey()
  final dynamic pointValue;

  @override
  String toString() {
    return 'UgoFischScaleFieldModel(name: $name, label: $label, pointName: $pointName, pointValue: $pointValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UgoFischScaleFieldModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.pointName, pointName) ||
                other.pointName == pointName) &&
            const DeepCollectionEquality()
                .equals(other.pointValue, pointValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, label, pointName,
      const DeepCollectionEquality().hash(pointValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UgoFischScaleFieldModelCopyWith<_$_UgoFischScaleFieldModel>
      get copyWith =>
          __$$_UgoFischScaleFieldModelCopyWithImpl<_$_UgoFischScaleFieldModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UgoFischScaleFieldModelToJson(
      this,
    );
  }
}

abstract class _UgoFischScaleFieldModel implements UgoFischScaleFieldModel {
  factory _UgoFischScaleFieldModel(
      {required final String name,
      required final String label,
      required final String pointName,
      final dynamic pointValue}) = _$_UgoFischScaleFieldModel;

  factory _UgoFischScaleFieldModel.fromJson(Map<String, dynamic> json) =
      _$_UgoFischScaleFieldModel.fromJson;

  @override
  String get name;
  @override
  String get label;
  @override
  String get pointName;
  @override
  dynamic get pointValue;
  @override
  @JsonKey(ignore: true)
  _$$_UgoFischScaleFieldModelCopyWith<_$_UgoFischScaleFieldModel>
      get copyWith => throw _privateConstructorUsedError;
}
