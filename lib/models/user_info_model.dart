import 'media_model.dart';

class UserInfoModel
{
  final String uid;

  UserInfoModel({required this.uid});

}

class UserData{

  final String uid;
  final Media media;

  UserData({required this.uid, required this.media,});
}