import 'establishment_category.dart';
import 'location.dart';
import 'office_hour.dart';

class Establishment {
  int? id;
  String name;
  EstablishmentCategory category;
  OfficeHour officeHours;
  Location location;
  String email;
  List<String> phones;

  Establishment(this.id, this.name, this.category, this.officeHours,
      this.location, this.email, this.phones);
}
