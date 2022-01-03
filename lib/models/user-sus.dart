import 'location.dart';
import 'user.dart';

class UserSUS extends User {
  Location location;

  UserSUS(id, name, email, password, this.location)
      : super(id, name, email, password);
}
