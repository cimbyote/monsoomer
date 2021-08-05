import 'package:monsoomer/shared/constants.dart';

import 'media.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserInfoModel {
  final String uid;

  UserInfoModel({required this.uid});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserData {
  List<Media> startedList = [];
  List<Media> consumedList = [];
  List<Media> wantedList = [];

  UserData() {
    // addMediaToList(Media.started(
    //     name: 'Guardians',
    //     apiID: 'NULL',
    //     type: MediaType.Movie,
    //     imageString:
    //         'https://m.media-amazon.com/images/I/81OmkfFqvsL._AC_SY741_.jpg',
    //     startedDateTime: DateTime.now().toIso8601String(),
    //     addedDateTime: DateTime.now().toIso8601String()));
    //
    // addMediaToList(Media.consumed(
    //     name: 'Avengers 1',
    //     apiID: 'NULL',
    //     type: MediaType.Movie,
    //     imageString:
    //         'https://m.media-amazon.com/images/I/81OmkfFqvsL._AC_SY741_.jpg',
    //     consumedDateTime: DateTime.now().toIso8601String(),
    //     addedDateTime: DateTime.now().toIso8601String()));
    //
    //
    addMediaToList(Media.wanted(
        name: 'Ant-Man 1',
        apiID: 'NULL',
        type: MediaType.Movie,
        year: '2015',
        imageString:
            'https://m.media-amazon.com/images/I/81OmkfFqvsL._AC_SY741_.jpg',
        addedDateTime: DateTime.now().toIso8601String()));

  }

  void addMediaToList(Media newMedia) {
    if(newMedia.status == MediaStatus.Consumed)
      {
        consumedList.add(newMedia);
      }
    else if(newMedia.status == MediaStatus.Wanted)
    {
      wantedList.add(newMedia);
    }
    else if(newMedia.status == MediaStatus.Started)
    {
      startedList.add(newMedia);
    }
    else
      {
        print("Error adding item to list: status isn't set");
      }
  }

  void printConsumedLength() {
    print('LENGTH OF CONSUMED LIST IS: ' + consumedList.length.toString());
  }

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
