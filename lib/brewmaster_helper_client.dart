import 'package:brewmaster_helper/models/category.dart';
import 'package:brewmaster_helper/models/data_response.dart';
import 'package:brewmaster_helper/models/ingredient.dart';
import 'package:dio/dio.dart';

import 'models/commons.dart';

class BrewMasterHelperClient {
  late String baseUrl;
  late Dio _dio;

  BrewMasterHelperClient({
    this.baseUrl = "http://127.0.0.1:30111",
  }) {
    _dio = Dio();
  }

  //#region
  Future<List<Category>> getCategories() async {
    var results = <Category>[];
    var url = "$baseUrl/api/category";
    var resp = await _dio.get(url);
    if (resp.data is JsonDynamicMap) {
      var dataResp = CategoryListResponse.fromJson(resp.data);
      if (dataResp.data != null) {
        results.addAll(dataResp.data!);
      }
    }
    return results;
  }

  Future<List<Category>> getMainCategories() async {
    var results = <Category>[];
    var url = "$baseUrl/api/category/main-categories";
    var resp = await _dio.get(url);
    if (resp.data is JsonDynamicMap) {
      var dataResp = CategoryListResponse.fromJson(resp.data);
      if (dataResp.data != null) {
        results.addAll(dataResp.data!);
      }
    }
    return results;
  }

  Future<List<Category>> getSubcategories([int prefix = 0]) async {
    var results = <Category>[];
    var url = "$baseUrl/api/category/subcategories";
    if (prefix >= 1 && prefix <= 6) {
      url += "/$prefix";
    }

    var resp = await _dio.get(url);
    if (resp.data is JsonDynamicMap) {
      var dataResp = CategoryListResponse.fromJson(resp.data);
      if (dataResp.data != null) {
        results.addAll(dataResp.data!);
      }
    }
    return results;
  }
  //#endregion

  Future<List<Ingredient>> getAllIngredients([int withFlavors = 0]) async {
    var results = <Ingredient>[];
    var url = "$baseUrl/api/ingredient";
    if (withFlavors > 0) {
      url += "?withFlavors=1";
    }

    var resp = await _dio.get(url);
    if (resp.data is JsonDynamicMap) {
      var dataResp = IngredientListResponse.fromJson(resp.data);
      if (dataResp.data != null) {
        results.addAll(dataResp.data!);
      }
    }
    return results;
  }
}
