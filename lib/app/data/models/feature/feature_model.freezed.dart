// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeatureModel _$FeatureModelFromJson(Map<String, dynamic> json) {
  return _FeatureModel.fromJson(json);
}

/// @nodoc
mixin _$FeatureModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get route => throw _privateConstructorUsedError;
  bool get actived => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeatureModelCopyWith<FeatureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureModelCopyWith<$Res> {
  factory $FeatureModelCopyWith(
          FeatureModel value, $Res Function(FeatureModel) then) =
      _$FeatureModelCopyWithImpl<$Res, FeatureModel>;
  @useResult
  $Res call({int id, String name, String route, bool actived});
}

/// @nodoc
class _$FeatureModelCopyWithImpl<$Res, $Val extends FeatureModel>
    implements $FeatureModelCopyWith<$Res> {
  _$FeatureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? route = null,
    Object? actived = null,
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
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      actived: null == actived
          ? _value.actived
          : actived // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FeatureModelCopyWith<$Res>
    implements $FeatureModelCopyWith<$Res> {
  factory _$$_FeatureModelCopyWith(
          _$_FeatureModel value, $Res Function(_$_FeatureModel) then) =
      __$$_FeatureModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String route, bool actived});
}

/// @nodoc
class __$$_FeatureModelCopyWithImpl<$Res>
    extends _$FeatureModelCopyWithImpl<$Res, _$_FeatureModel>
    implements _$$_FeatureModelCopyWith<$Res> {
  __$$_FeatureModelCopyWithImpl(
      _$_FeatureModel _value, $Res Function(_$_FeatureModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? route = null,
    Object? actived = null,
  }) {
    return _then(_$_FeatureModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      actived: null == actived
          ? _value.actived
          : actived // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FeatureModel implements _FeatureModel {
  _$_FeatureModel(
      {required this.id,
      required this.name,
      required this.route,
      required this.actived});

  factory _$_FeatureModel.fromJson(Map<String, dynamic> json) =>
      _$$_FeatureModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String route;
  @override
  final bool actived;

  @override
  String toString() {
    return 'FeatureModel(id: $id, name: $name, route: $route, actived: $actived)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeatureModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.actived, actived) || other.actived == actived));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, route, actived);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeatureModelCopyWith<_$_FeatureModel> get copyWith =>
      __$$_FeatureModelCopyWithImpl<_$_FeatureModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeatureModelToJson(
      this,
    );
  }
}

abstract class _FeatureModel implements FeatureModel {
  factory _FeatureModel(
      {required final int id,
      required final String name,
      required final String route,
      required final bool actived}) = _$_FeatureModel;

  factory _FeatureModel.fromJson(Map<String, dynamic> json) =
      _$_FeatureModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get route;
  @override
  bool get actived;
  @override
  @JsonKey(ignore: true)
  _$$_FeatureModelCopyWith<_$_FeatureModel> get copyWith =>
      throw _privateConstructorUsedError;
}
