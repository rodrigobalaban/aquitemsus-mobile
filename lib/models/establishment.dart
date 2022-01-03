import 'establishment-category.dart';
import 'location.dart';
import 'office-hour.dart';

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
