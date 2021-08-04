import 'package:json_annotation/json_annotation.dart';
import 'package:monsoomer/utilities/dateTime_serializer.dart';
import 'package:monsoomer/shared/constants.dart';

part 'media.g.dart';

enum MediaType { Movie, TV, Game, NULL }

String getMediaTypeString(MediaType inType) {
  if (inType == MediaType.Movie) {
    return "Movie";
  } else if (inType == MediaType.TV) {
    return "Show";
  } else if (inType == MediaType.Game) {
    return "Game";
  }

  else if (inType == MediaType.NULL) {
    return "ERROR: Null type";
  } else {
    return 'meh';
  }
}



@JsonSerializable(explicitToJson: true)
class Media
{
  final String name;
  final MediaType type;

  @CustomDateTimeConverter()
  late DateTime addedDateTime;

  late String imageString;

  Media(this.name, this.type, this.imageString)
  {
    this.addedDateTime = DateTime.now();
  }

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ConsumedMedia extends Media
{

  @CustomDateTimeConverter()
  late DateTime consumedDateTime;

  ConsumedMedia(String name, MediaType type, String imageString, DateTime consumedDateTime)
      : super(name, type, imageString)
  {
    this.consumedDateTime = consumedDateTime;
  }

  factory ConsumedMedia.fromJson(Map<String, dynamic> json) => _$ConsumedMediaFromJson(json);
  Map<String, dynamic> toJson() => _$ConsumedMediaToJson(this);

}

@JsonSerializable(explicitToJson: true)
class StartedMedia extends Media
{
  @CustomDateTimeConverter()
  late DateTime startedDateTime;

  StartedMedia(String name, MediaType type, String imageString, DateTime startedDateTime)
      : super(name, type, imageString)
  {
    this.startedDateTime = startedDateTime;
  }

  factory StartedMedia.fromJson(Map<String, dynamic> json) => _$StartedMediaFromJson(json);
  Map<String, dynamic> toJson() => _$StartedMediaToJson(this);

}


@JsonSerializable(explicitToJson: true)
class WantedMedia extends Media
{

  WantedMedia(String name, MediaType type, String imageString, )
      : super(name, type, imageString)
  {
    //meh
  }

  factory WantedMedia.fromJson(Map<String, dynamic> json) => _$WantedMediaFromJson(json);
  Map<String, dynamic> toJson() => _$WantedMediaToJson(this);
}
