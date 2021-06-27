import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/category.dart';
import '../models/food.dart';
import '../controllers/food_controller.dart';
import '../controllers/unit_controller.dart';
import '../controllers/category_controller.dart';
import '../widgets/food_category.dart';
import '../widgets/food_dialog.dart';

class FoodsScreen extends StatelessWidget {
  static const routeName = '/foods_screen';

  final foodController = Get.find<FoodController>();
  final unitController = Get.find<UnitController>();
  final catController = Get.find<CategoryController>();
  void _showFoodDialog(BuildContext context, Food food, bool isEditMode) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return FoodDialog(food, isEditMode);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: catController.categories.length,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Obx(
              () =>
                  Text('ອາຫານທັງຫມົດມີ ${foodController.foods.length} ລາຍການ'),
            ),
          ),
          actions: [
            Row(
              children: [
                TextButton(
                    onPressed: () => _showFoodDialog(
                        context, foodController.getFood(), false),
                    child: Text('ເພີ່ມອາຫານໃຫມ່',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ))),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () =>
                      _showFoodDialog(context, foodController.getFood(), false),
                  icon: Icon(Icons.add),
                ),
                SizedBox(
                  width: 30,
                )
              ],
            )
          ],
          bottom: TabBar(
            tabs: [
              ...catController.categories.map((c) {
                return FittedBox(
                  child: Tab(
                    child: Row(
                      children: [
                        Text(c.catName),
                        SizedBox(
                          width: 10,
                        ),
                        Obx(
                          () {
                            final count = foodController.foods
                                .where((f) => f.categoryId == c.id)
                                .length;

                            return Text('($count)');
                          },
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
        body: Obx(
          () => TabBarView(
            children: [
              ...catController.categories
                  .map((c) => FoodCategory(c.id))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
