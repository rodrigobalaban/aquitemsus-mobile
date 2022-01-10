import 'package:json_annotation/json_annotation.dart';

part 'establishment_category.g.dart';

@JsonSerializable()
class EstablishmentCategory {
  int? id;
  String name;

  EstablishmentCategory(this.id, this.name);

  factory EstablishmentCategory.fromJson(Map<String, dynamic> json) =>
      _$EstablishmentCategoryFromJson(json);
}
