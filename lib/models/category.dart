import 'package:brewmaster_helper/models/commons.dart';

class Category {
  late int id;
  late String name;

  static const Hops = 1;
  static const Extracts = 2;
  static const Yeasts = 3;
  static const Grains = 4;
  static const Steepables = 5;
  static const Others = 6;

  Category(this.id, this.name);

  Category.fromJson(JsonDynamicMap json) {
    id = json["id"] as int;
    name = json["name"] as String;
  }

  @override
  String toString() => "No.$id $name";
}
