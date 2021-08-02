// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) {
  return UserInfoModel(
    uid: json['uid'] as String,
  );
}

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return UserData(
    media: Media.fromJson(json['media'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'media': instance.media.toJson(),
    };
