import 'package:brewmaster_helper/brewmaster_helper_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var client = BrewMasterHelperClient();

  test("测试获取分类", () async {
    var categories = await client.getCategories();
    expect(categories.length, 32);

    var mains = await client.getMainCategories();
    expect(mains.length, 6);

    var hops = await client.getSubcategories(1);
    expect(hops.length, 7);

    var subs = await client.getSubcategories();
    expect(subs.length, 32 - 6);
  });

  test("测试获取原料", () async {
    var ingredients = await client.getAllIngredients();
    expect(ingredients.length, 246);

    var ingredientsWithFlavors = await client.getAllIngredients(1);
    expect(ingredientsWithFlavors.length, 246);
  });
}
