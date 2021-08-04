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
    // inProgressList.add(StartedMedia('Guardians', MediaType.Movie, 'https://m.media-amazon.com/images/I/81OmkfFqvsL._AC_SY741_.jpg', DateTime.now()));
    //
    // consumedList.add(ConsumedMedia('Avengers 1', MediaType.Movie, 'https://m.media-amazon.com/images/I/81OmkfFqvsL._AC_SY741_.jpg', DateTime.now()));
    // consumedList.add(ConsumedMedia('Avengers 2', MediaType.Movie, 'https://m.media-amazon.com/images/I/81OmkfFqvsL._AC_SY741_.jpg', DateTime.now()));
    // consumedList.add(ConsumedMedia('Avengers 3', MediaType.Movie, 'https://m.media-amazon.com/images/I/81OmkfFqvsL._AC_SY741_.jpg', DateTime.now()));
    //
    // wantedList.add(WantedMedia('Ant-Man 1', MediaType.Movie, 'https://m.media-amazon.com/images/I/81OmkfFqvsL._AC_SY741_.jpg', ));
    // wantedList.add(WantedMedia('Ant-Man 2', MediaType.Movie, 'https://m.media-amazon.com/images/I/81OmkfFqvsL._AC_SY741_.jpg', ));
  }

  void addThing(ConsumedMedia newMedia)
  {
    consumedList.add(newMedia);
  }

  void printConsumedLength()
  {
    print('LENGTH OF CONSUMED LIST IS: '+consumedList.length.toString());
  }

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}