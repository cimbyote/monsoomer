import 'media.dart';
import 'package:json_annotation/json_annotation.dart';


part 'user_info_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserInfoModel
{
  final String uid;

  UserInfoModel({required this.uid});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => _$UserInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);

}

@JsonSerializable(explicitToJson: true)
class UserData{

  final Media media;

  UserData({required this.media,});

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}