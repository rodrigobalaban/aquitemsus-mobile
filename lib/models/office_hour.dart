import 'package:json_annotation/json_annotation.dart';

part 'office_hour.g.dart';

@JsonSerializable()
class OfficeHour {
  int? id;
  int dayOfWeek;
  String start;
  String end;

  OfficeHour(this.id, this.dayOfWeek, this.start, this.end);

  factory OfficeHour.fromJson(Map<String, dynamic> json) =>
      _$OfficeHourFromJson(json);
}
