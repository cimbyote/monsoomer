import 'package:json_annotation/json_annotation.dart';
import 'package:monsoomer/utilities/dateTime_serializer.dart';
import 'package:monsoomer/shared/constants.dart';

part 'media.g.dart';

@JsonSerializable(explicitToJson: true)
class Media {
  final String name;
  final MediaType type;
  MediaStatus status;
  final String apiID;
  final String year;
  late String imageString;

  late String addedDateTime;
  late String? consumedDateTime = 'NULL';
  late String? startedDateTime = 'NULL';

  Media(this.name, this.apiID, this.status, this.type, this.year,
      this.imageString, this.consumedDateTime, this.startedDateTime) {
    this.addedDateTime = DateTime.now().toIso8601String();
  }

  Media.consumed(
      {required this.name,
      required this.type,
      required this.apiID,
      required this.year,
      required this.imageString,
      this.consumedDateTime,
      this.status = MediaStatus.Consumed,
      required this.addedDateTime});

  Media.wanted(
      {required this.name,
      required this.type,
      required this.apiID,
      required this.year,
      required this.imageString,
      this.status = MediaStatus.Wanted,
      required this.addedDateTime});

  Media.started(
      {required this.name,
      required this.type,
      required this.apiID,
      required this.year,
      required this.imageString,
      this.startedDateTime,
      this.status = MediaStatus.Started,
      required this.addedDateTime});

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);
}

enum MediaStatus { Consumed, Wanted, Started, NULL }

enum MediaType { Movie, TV, Game, NULL }

String getMediaTypeString(MediaType inType) {
  if (inType == MediaType.Movie) {
    return "Movie";
  } else if (inType == MediaType.TV) {
    return "Show";
  } else if (inType == MediaType.Game) {
    return "Game";
  } else if (inType == MediaType.NULL) {
    return "ERROR: Null type";
  } else {
    return 'meh';
  }
}
