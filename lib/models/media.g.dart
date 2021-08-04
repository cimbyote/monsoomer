// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) {
  return Media(
    json['name'] as String,
    _$enumDecode(_$MediaTypeEnumMap, json['type']),
    json['imageString'] as String,
  )..addedDateTime =
      const CustomDateTimeConverter().fromJson(json['addedDateTime'] as String);
}

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'name': instance.name,
      'type': _$MediaTypeEnumMap[instance.type],
      'addedDateTime':
          const CustomDateTimeConverter().toJson(instance.addedDateTime),
      'imageString': instance.imageString,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$MediaTypeEnumMap = {
  MediaType.Movie: 'Movie',
  MediaType.TV: 'TV',
  MediaType.Game: 'Game',
  MediaType.NULL: 'NULL',
};

ConsumedMedia _$ConsumedMediaFromJson(Map<String, dynamic> json) {
  return ConsumedMedia(
    json['name'] as String,
    _$enumDecode(_$MediaTypeEnumMap, json['type']),
    json['imageString'] as String,
    const CustomDateTimeConverter()
        .fromJson(json['consumedDateTime'] as String),
  )..addedDateTime =
      const CustomDateTimeConverter().fromJson(json['addedDateTime'] as String);
}

Map<String, dynamic> _$ConsumedMediaToJson(ConsumedMedia instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$MediaTypeEnumMap[instance.type],
      'addedDateTime':
          const CustomDateTimeConverter().toJson(instance.addedDateTime),
      'imageString': instance.imageString,
      'consumedDateTime':
          const CustomDateTimeConverter().toJson(instance.consumedDateTime),
    };

StartedMedia _$StartedMediaFromJson(Map<String, dynamic> json) {
  return StartedMedia(
    json['name'] as String,
    _$enumDecode(_$MediaTypeEnumMap, json['type']),
    json['imageString'] as String,
    const CustomDateTimeConverter().fromJson(json['startedDateTime'] as String),
  )..addedDateTime =
      const CustomDateTimeConverter().fromJson(json['addedDateTime'] as String);
}

Map<String, dynamic> _$StartedMediaToJson(StartedMedia instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$MediaTypeEnumMap[instance.type],
      'addedDateTime':
          const CustomDateTimeConverter().toJson(instance.addedDateTime),
      'imageString': instance.imageString,
      'startedDateTime':
          const CustomDateTimeConverter().toJson(instance.startedDateTime),
    };

WantedMedia _$WantedMediaFromJson(Map<String, dynamic> json) {
  return WantedMedia(
    json['name'] as String,
    _$enumDecode(_$MediaTypeEnumMap, json['type']),
    json['imageString'] as String,
  )..addedDateTime =
      const CustomDateTimeConverter().fromJson(json['addedDateTime'] as String);
}

Map<String, dynamic> _$WantedMediaToJson(WantedMedia instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$MediaTypeEnumMap[instance.type],
      'addedDateTime':
          const CustomDateTimeConverter().toJson(instance.addedDateTime),
      'imageString': instance.imageString,
    };
