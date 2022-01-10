import 'package:json_annotation/json_annotation.dart';

import 'establishment_category.dart';
import 'location.dart';
import 'office_hour.dart';

part 'establishment.g.dart';

@JsonSerializable()
class Establishment {
  int? id;
  String name;
  EstablishmentCategory category;
  List<OfficeHour> officeHours;
  Location location;
  String? email;
  List<String> phones;

  Establishment(this.id, this.name, this.category, this.officeHours,
      this.location, this.email, this.phones);

  factory Establishment.fromJson(Map<String, dynamic> json) =>
      _$EstablishmentFromJson(json);
}
