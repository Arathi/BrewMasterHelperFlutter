import 'flavor.dart';
import 'commons.dart';

class Ingredient {
  late int id;
  late String name;

  double? alphaAcidContent;
  String? origin;

  double? attenuation;
  String? yeastSpecies;
  int? optimalTemperatureLow;
  int? optimalTemperatureHigh;
  double? alcoholTolerance;

  double? efficiency;
  double? colorInfluence;
  String? proteinAddition;

  List<Flavor> standardFlavors = [];
  List<Flavor> flavorNotes = [];

  Ingredient(
    this.id,
    this.name, {
    this.alphaAcidContent,
    this.origin,
    this.attenuation,
    this.yeastSpecies,
    this.optimalTemperatureLow,
    this.optimalTemperatureHigh,
    this.alcoholTolerance,
    this.efficiency,
    this.colorInfluence,
    this.proteinAddition,
  });

  Ingredient.fromJson(JsonDynamicMap json) {
    id = json["id"] as int;
    name = json["name"] as String;

    if (json.containsKey("alpha_acid_content")) {
      alphaAcidContent = json["alpha_acid_content"] as double;
    }
    if (json.containsKey("origin")) {
      origin = json["origin"] as String;
    }

    if (json.containsKey("attenuation")) {
      attenuation = json["attenuation"] as double;
    }
    if (json.containsKey("yeastSpecies")) {
      yeastSpecies = json["yeastSpecies"] as String;
    }
    if (json.containsKey("optimal_temperature_low")) {
      optimalTemperatureLow = json["optimal_temperature_low"] as int;
    }
    if (json.containsKey("optimal_temperature_high")) {
      optimalTemperatureHigh = json["optimal_temperature_high"] as int;
    }
    if (json.containsKey("alcohol_tolerance")) {
      alcoholTolerance = json["alcohol_tolerance"] as double;
    }

    if (json.containsKey("efficiency")) {
      efficiency = json["efficiency"] as double;
    }
    if (json.containsKey("color_influence")) {
      colorInfluence = json["color_influence"] as double;
    }
    if (json.containsKey("protein_addition")) {
      proteinAddition = json["protein_addition"] as String;
    }

    var list = json["standard_flavors"];
    if (list is List<dynamic>) {
      standardFlavors.clear();
      for (var flavorJson in list) {
        if (flavorJson is JsonDynamicMap) {
          Flavor flavor = Flavor.fromJson(flavorJson);
          standardFlavors.add(flavor);
        }
      }
    }

    list = json["flavor_notes"];
    if (list is List<dynamic>) {
      flavorNotes.clear();
      for (var flavorJson in list) {
        if (flavorJson is JsonDynamicMap) {
          Flavor flavor = Flavor.fromJson(flavorJson);
          flavorNotes.add(flavor);
        }
      }
    }
  }

  @override
  String toString() => "No.$id $name";
}
