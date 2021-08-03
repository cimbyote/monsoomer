import 'package:monsoomer/shared/constants.dart';

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

  List<StartedMedia> inProgressList = [];
  List<ConsumedMedia> consumedList = [];
  List<WantedMedia> wantedList = [];

  UserData()
  {
    inProgressList.add(StartedMedia('Guardians', MediaType.Movie, DateTime.now()));

    consumedList.add(ConsumedMedia('Avengers 1', MediaType.Movie, DateTime.now()));
    consumedList.add(ConsumedMedia('Avengers 2', MediaType.Movie, DateTime.now()));
    consumedList.add(ConsumedMedia('Avengers 3', MediaType.Movie, DateTime.now()));

    wantedList.add(WantedMedia('Ant-Man 1', MediaType.Movie));
    wantedList.add(WantedMedia('Ant-Man 2', MediaType.Movie));
  }

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}