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
    inProgressList.add(StartedMedia('Guardians', 'Movie', DateTime.now()));

    consumedList.add(ConsumedMedia('Avengers 1', 'Movie', DateTime.now()));
    consumedList.add(ConsumedMedia('Avengers 2', 'Movie', DateTime.now()));
    consumedList.add(ConsumedMedia('Avengers 3', 'Movie', DateTime.now()));

    wantedList.add(WantedMedia('Ant-Man 1', 'Movie'));
    wantedList.add(WantedMedia('Ant-Man 2', 'Movie'));
  }

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}