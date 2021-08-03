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
  return UserData()
    ..inProgressList = (json['inProgressList'] as List<dynamic>)
        .map((e) => StartedMedia.fromJson(e as Map<String, dynamic>))
        .toList()
    ..consumedList = (json['consumedList'] as List<dynamic>)
        .map((e) => ConsumedMedia.fromJson(e as Map<String, dynamic>))
        .toList()
    ..wantedList = (json['wantedList'] as List<dynamic>)
        .map((e) => WantedMedia.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'inProgressList': instance.inProgressList.map((e) => e.toJson()).toList(),
      'consumedList': instance.consumedList.map((e) => e.toJson()).toList(),
      'wantedList': instance.wantedList.map((e) => e.toJson()).toList(),
    };
