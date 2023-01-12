import 'package:brewmaster_helper/models/commons.dart';

class Category {
  late int id;
  late String name;

  Category(this.id, this.name);

  Category.fromJson(JsonDynamicMap json) {
    id = json["id"] as int;
    name = json["name"] as String;
  }

  @override
  String toString() => "No.$id $name";
}
