// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office_hour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfficeHour _$OfficeHourFromJson(Map<String, dynamic> json) => OfficeHour(
      json['id'] as int?,
      json['dayOfWeek'] as int,
      json['start'] as String,
      json['end'] as String,
    );

Map<String, dynamic> _$OfficeHourToJson(OfficeHour instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dayOfWeek': instance.dayOfWeek,
      'start': instance.start,
      'end': instance.end,
    };
