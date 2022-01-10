// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'establishment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Establishment _$EstablishmentFromJson(Map<String, dynamic> json) =>
    Establishment(
      json['id'] as int?,
      json['name'] as String,
      EstablishmentCategory.fromJson(json['category'] as Map<String, dynamic>),
      (json['officeHours'] as List<dynamic>)
          .map((e) => OfficeHour.fromJson(e as Map<String, dynamic>))
          .toList(),
      Location.fromJson(json['location'] as Map<String, dynamic>),
      json['email'] as String?,
      (json['phones'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$EstablishmentToJson(Establishment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'officeHours': instance.officeHours,
      'location': instance.location,
      'email': instance.email,
      'phones': instance.phones,
    };
