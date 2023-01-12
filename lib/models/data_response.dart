import 'package:brewmaster_helper/models/category.dart';
import 'package:brewmaster_helper/models/ingredient.dart';

import 'commons.dart';

class DataResponse<D> {
  late int code;
  late String message;
  D? data;

  DataResponse(this.code, this.message, this.data);

  DataResponse.fromJson(JsonDynamicMap json) {
    code = json["code"] as int;
    message = json["message"] as String;
    data = null;
  }
}

class CategoryListResponse extends DataResponse<List<Category>> {
  CategoryListResponse(super.code, super.message, super.data);

  CategoryListResponse.fromJson(JsonDynamicMap json) : super.fromJson(json) {
    data = [];
    var dataJsonList = json["data"];
    if (dataJsonList is List<dynamic>) {
      for (var dataJson in dataJsonList) {
        if (dataJson is JsonDynamicMap) {
          var category = Category.fromJson(dataJson);
          data!.add(category);
        }
      }
    }
  }
}

class IngredientListResponse extends DataResponse<List<Ingredient>> {
  IngredientListResponse(super.code, super.message, super.data);

  IngredientListResponse.fromJson(JsonDynamicMap json) : super.fromJson(json) {
    data = [];
    var dataJsonList = json["data"];
    if (dataJsonList is List<dynamic>) {
      for (var dataJson in dataJsonList) {
        if (dataJson is JsonDynamicMap) {
          var ingredient = Ingredient.fromJson(dataJson);
          data!.add(ingredient);
        }
      }
    }
  }
}
