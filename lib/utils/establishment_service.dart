import 'dart:convert';
import 'package:aquitemsus/models/establishment.dart';
import 'package:aquitemsus/models/establishment_category.dart';
import 'package:flutter/services.dart';

class EstablishmentService {
  EstablishmentService();

  Future<List<Establishment>> getEstablishmentsNearby() async {
    var responseBody =
        await rootBundle.loadString('assets/data/establishments-nearby.json');
    return _parseEstablishments(responseBody);
  }

  List<Establishment> _parseEstablishments(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<Establishment>((json) => Establishment.fromJson(json))
        .toList();
  }

  String getIconPathByCategory(EstablishmentCategory category) {
    var path = 'assets/icons/map/';

    switch (category.id) {
      case 2:
        path += 'farmacia.png';
        break;
      default:
        path += 'unidade-basica-saude.png';
        break;
    }

    return path;
  }
}
