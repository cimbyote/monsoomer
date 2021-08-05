// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) {
  return Media(
    json['name'] as String,
    json['apiID'] as String,
    _$enumDecode(_$MediaStatusEnumMap, json['status']),
    _$enumDecode(_$MediaTypeEnumMap, json['type']),
    json['year'] as String,
    json['imageString'] as String,
    json['consumedDateTime'] as String?,
    json['startedDateTime'] as String?,
  )..addedDateTime = json['addedDateTime'] as String;
}

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'name': instance.name,
      'type': _$MediaTypeEnumMap[instance.type],
      'status': _$MediaStatusEnumMap[instance.status],
      'apiID': instance.apiID,
      'year': instance.year,
      'imageString': instance.imageString,
      'addedDateTime': instance.addedDateTime,
      'consumedDateTime': instance.consumedDateTime,
      'startedDateTime': instance.startedDateTime,
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

const _$MediaStatusEnumMap = {
  MediaStatus.Consumed: 'Consumed',
  MediaStatus.Wanted: 'Wanted',
  MediaStatus.Started: 'Started',
  MediaStatus.NULL: 'NULL',
};

const _$MediaTypeEnumMap = {
  MediaType.Movie: 'Movie',
  MediaType.TV: 'TV',
  MediaType.Game: 'Game',
  MediaType.NULL: 'NULL',
};
