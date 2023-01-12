import 'commons.dart';

class Flavor {
  late int id;
  late String name;
  late int value;

  Flavor(this.id, this.name, this.value);

  Flavor.fromJson(JsonDynamicMap json) {
    id = json["id"] as int;
    name = json["name"] as String;
    value = json["value"] as int;
  }

  @override
  String toString() => "No.$id $name-$value";
}
