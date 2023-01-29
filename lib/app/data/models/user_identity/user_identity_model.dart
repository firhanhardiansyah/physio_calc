import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_identity_model.freezed.dart';
part 'user_identity_model.g.dart';

@freezed
class UserIdentityModel with _$UserIdentityModel {

  factory UserIdentityModel({
    int? id,
    String? fullname,
    int? age,
    String? inspectionDate
  }) = _UserIdentityModel;

  factory UserIdentityModel.fromJson(Map<String, dynamic> json) => _$UserIdentityModelFromJson(json);
}