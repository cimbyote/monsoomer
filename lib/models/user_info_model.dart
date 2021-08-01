import 'monster.dart';

class UserInfoModel
{
  final String uid;

  UserInfoModel({required this.uid});

}

class UserData{

  final String uid;
  final Monster monster;

  UserData({required this.uid, required this.monster,});
}