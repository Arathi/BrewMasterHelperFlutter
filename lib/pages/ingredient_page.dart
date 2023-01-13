import 'package:brewmaster_helper/models/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprintf/sprintf.dart';

import '../models/ingredient.dart';
import '../brewmaster_helper_client.dart';
import '../pages/base_page.dart';

class IngredientPageController extends BasePageController {
  static IngredientPageController get to => Get.find();
  final _client = BrewMasterHelperClient();
  final _ingredientMap = <int, Ingredient>{};
  final _categoryNames = <int, String>{};

  // var selectedIndex = 0.obs;
  final filtered = <Ingredient>[].obs;
  var selected = Rx<Ingredient?>(null);

  // Ingredient? get selected {
  //   if (ingredientMap.containsKey(selectedIndex)) {
  //     return ingredientMap[selectedIndex].obs;
  //   }
  //   return null;
  // }

  IngredientPageController() {
    var future = loadCategories();
    future.then((value) {
      print("加载分类数据${value}条");
    });

    future = loadIngredients();
    future.then((value) {
      print("加载原料数据${value}条");
      applyFilters();
    });
  }

  Future<int> loadIngredients() async {
    _ingredientMap.clear();
    var results = await _client.getAllIngredients(1);
    for (var ingredient in results) {
      _ingredientMap[ingredient.id] = ingredient;
    }
    return _ingredientMap.length;
  }

  Future<int> loadCategories() async {
    _categoryNames.clear();
    var results = await _client.getCategories();
    for (var category in results) {
      _categoryNames[category.id] = category.name;
    }
    return _categoryNames.length;
  }

  void applyFilters() {
    print("开始过滤");
    filtered.clear();
    for (var entry in _ingredientMap.entries) {
      filtered.add(entry.value);
    }
    print("过滤完成，得到数据${filtered.length}条");
  }

  void changeSelectedIndex(int id) {
    print("已选择原料ID设置为$id");
    // selectedIndex.value = id;
    if (_ingredientMap.containsKey(id)) {
      selected.value = _ingredientMap[id];
      print("已选择原料：${selected.value}");
    } else {
      selected.value = null;
    }
  }

  String getCategoryName(Ingredient ingredient) {
    return "${_categoryNames[ingredient.mainCategoryId]}/${_categoryNames[ingredient.subcategoryId]}";
  }
}

class IngredientPage extends BasePage<IngredientPageController> {
  Widget buildFilters(
    BuildContext context,
    IngredientPageController controller,
  ) {
    return const Text("过滤器");
  }

  Widget buildIngredientList(
    BuildContext context,
    IngredientPageController controller,
  ) {
    var rows = <Widget>[];
    for (var ingredient in controller.filtered) {
      rows.add(
        GestureDetector(
          child: Text(
            ingredient.toString(),
          ),
          onTap: () => controller.changeSelectedIndex(ingredient.id),
        ),
      );
    }
    return ListView(
      children: rows,
    );
  }

  Widget buildIngredientInfo(
    BuildContext context,
    IngredientPageController controller,
  ) {
    if (controller.selected.value == null) {
      return const Text("未选择原料");
    }

    final ingredient = controller.selected.value!;

    var fields = <Widget>[];
    fields.add(Text(
      ingredient.toString(),
      style: TextStyle(
        fontSize: 18,
      ),
    ));
    fields.add(
      SizedBox(
        height: 8,
      ),
    );

    fields.add(
      Row(
        children: [
          const SizedBox(
            width: 100,
            child: Text(
              "分类",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(controller.getCategoryName(ingredient)),
        ],
      ),
    );

    // 酒花
    if (ingredient.mainCategoryId == Category.Hops) {
      fields.add(
        Row(
          children: [
            const SizedBox(
              width: 100,
              child: Text(
                "α-酸含量",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(sprintf("%.01f%%", [ingredient.alphaAcidContent! * 100])),
          ],
        ),
      );
      fields.add(
        Row(
          children: [
            const SizedBox(
              width: 100,
              child: Text(
                "原产地",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(ingredient.origin!),
          ],
        ),
      );
    }

    // 酵母
    if (ingredient.mainCategoryId == Category.Yeasts) {
      fields.add(
        Row(
          children: [
            const SizedBox(
              width: 100,
              child: Text(
                "发酵度",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(sprintf("%.01f%%", [ingredient.attenuation! * 100])),
          ],
        ),
      );
      fields.add(
        Row(
          children: [
            const SizedBox(
              width: 100,
              child: Text(
                "酵母菌种",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(ingredient.yeastSpecies!),
          ],
        ),
      );
      fields.add(
        Row(
          children: [
            const SizedBox(
              width: 100,
              child: Text(
                "理想温度",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
                "${ingredient.optimalTemperatureLow}-${ingredient.optimalTemperatureHigh}℃"),
          ],
        ),
      );
      fields.add(
        Row(
          children: [
            const SizedBox(
              width: 100,
              child: Text(
                "酒精耐受度",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(sprintf("%.01f%%", [ingredient.alcoholTolerance! * 100])),
          ],
        ),
      );
    }

    if (ingredient.efficiency != null) {
      fields.add(
        Row(
          children: [
            const SizedBox(
              width: 100,
              child: Text(
                "效率",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(sprintf("%.01f%%", [ingredient.efficiency! * 100])),
          ],
        ),
      );
    }

    if (ingredient.colorInfluence != null) {
      fields.add(
        Row(
          children: [
            const SizedBox(
              width: 100,
              child: Text(
                "颜色影响",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(sprintf("%.01f SRM", [ingredient.colorInfluence])),
          ],
        ),
      );
    }

    if (ingredient.proteinAddition != null) {
      fields.add(
        Row(
          children: [
            const SizedBox(
              width: 100,
              child: Text(
                "蛋白质添加物",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(ingredient.proteinAddition!),
          ],
        ),
      );
    }

    fields.add(
      const SizedBox(
        width: 100,
        child: Text(
          "标准风味",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    var flavors = StringBuffer();
    for (var flavor in ingredient.standardFlavors) {
      if (flavors.length > 0) {
        flavors.write("  ");
      }
      flavors.write(flavor.tagText);
    }
    fields.add(
      Text(flavors.toString()),
    );

    fields.add(
      const SizedBox(
        width: 100,
        child: Text(
          "风味描述",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    flavors = StringBuffer();
    for (var flavor in ingredient.flavorNotes) {
      if (flavors.length > 0) {
        flavors.write("  ");
      }
      flavors.write(flavor.tagText);
    }
    fields.add(
      Text(flavors.toString()),
    );

    return Container(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        color: Color.fromARGB(255, 255, 241, 197),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: fields,
        ));
  }

  Widget buildBody(BuildContext context, IngredientPageController controller) {
    return Column(
      children: [
        Expanded(
          child: buildIngredientList(
            context,
            controller,
          ),
          flex: 7,
        ),
        Expanded(
          child: Obx(() => buildIngredientInfo(
                context,
                controller,
              )),
          flex: 3,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final IngredientPageController controller = Get.find();
    return Scaffold(
      body: buildBody(context, controller),
      bottomNavigationBar: Obx(() => buildNavigationBar(context)),
    );
  }
}
