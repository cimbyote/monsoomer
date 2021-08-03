import 'package:json_annotation/json_annotation.dart';
import 'package:monsoomer/utilities/dateTime_serializer.dart';


part 'media.g.dart';

@JsonSerializable(explicitToJson: true)
class Media
{
  final String name;
  final String type;
  late String imageString;

  Media(this.name, this.type)
  {
    this.imageString = 'https://m.media-amazon.com/images/I/81OmkfFqvsL._AC_SY741_.jpg';
  }

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ConsumedMedia extends Media
{
  @CustomDateTimeConverter()
  late DateTime addedDateTime;

  @CustomDateTimeConverter()
  late DateTime consumedDateTime;

  ConsumedMedia(String name, String type, DateTime consumedDateTime)
      : super(name, type)
  {
    addedDateTime = DateTime.now();
    this.consumedDateTime = consumedDateTime;
  }

  factory ConsumedMedia.fromJson(Map<String, dynamic> json) => _$ConsumedMediaFromJson(json);
  Map<String, dynamic> toJson() => _$ConsumedMediaToJson(this);

}
@JsonSerializable(explicitToJson: true)
class WantedMedia extends Media
{
  @CustomDateTimeConverter()
  late DateTime addedDateTime;

  WantedMedia(String name, String type)
      : super(name, type)
  {
    addedDateTime = DateTime.now();
  }

  factory WantedMedia.fromJson(Map<String, dynamic> json) => _$WantedMediaFromJson(json);
  Map<String, dynamic> toJson() => _$WantedMediaToJson(this);
}
