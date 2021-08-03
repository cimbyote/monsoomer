// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) {
  return Media(
    name: json['name'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
    };

ConsumedMedia _$ConsumedMediaFromJson(Map<String, dynamic> json) {
  return ConsumedMedia(
    json['name'] as String,
    json['type'] as String,
    const CustomDateTimeConverter()
        .fromJson(json['consumedDateTime'] as String),
  )..addedDateTime =
      const CustomDateTimeConverter().fromJson(json['addedDateTime'] as String);
}

Map<String, dynamic> _$ConsumedMediaToJson(ConsumedMedia instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'addedDateTime':
          const CustomDateTimeConverter().toJson(instance.addedDateTime),
      'consumedDateTime':
          const CustomDateTimeConverter().toJson(instance.consumedDateTime),
    };

WantedMedia _$WantedMediaFromJson(Map<String, dynamic> json) {
  return WantedMedia(
    json['name'] as String,
    json['type'] as String,
  )..addedDateTime =
      const CustomDateTimeConverter().fromJson(json['addedDateTime'] as String);
}

Map<String, dynamic> _$WantedMediaToJson(WantedMedia instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'addedDateTime':
          const CustomDateTimeConverter().toJson(instance.addedDateTime),
    };
