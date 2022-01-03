import 'package:flutter/material.dart';

class OfficeHour {
  int? id;
  int dayOfWeek;
  TimeOfDay start;
  TimeOfDay end;

  OfficeHour(this.id, this.dayOfWeek, this.start, this.end);
}
