import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/food_controller.dart';
import '../controllers/unit_controller.dart';
import '../controllers/global_controller.dart';
import '../models/category.dart';
import '../models/food.dart';
import '../models/unit.dart';
import '../models/global_var.dart';
import '../controllers/category_controller.dart';
import '../widgets/category_dropdown.dart';
import '../widgets/unit_dropdown.dart';
import '../widgets/status_dropdown.dart';

class FoodDialog extends StatelessWidget {
  static const routeName = '/food_dialog';
  final bool isEditMode;
  Food _food;
  var _status = Status.disable;
  FoodDialog(this._food, this.isEditMode);
  final _catController = Get.find<CategoryController>();
  final _foodController = Get.find<FoodController>();
  final _unitController = Get.find<UnitController>();
  final _statusController = Get.find<GlobalController>();
  final formatter = new NumberFormat("#,###");

  var _idCtl = TextEditingController();
  var _foodNameCtl = TextEditingController();
  var _foodPriceCtl = TextEditingController();
  List<Category> _categories = [];
  List<Unit> _units = [];
  Widget _buildDataField(
      {required String title,
      required BuildContext context,
      required double width,
      required TextEditingController controller}) {
    final headline1 = Theme.of(context).textTheme.headline1;
    final headline2 = Theme.of(context).textTheme.headline2;
    final headline3 = Theme.of(context).textTheme.headline3;
    return Container(
      child: Row(
        children: [
          Text(
            title,
            style: headline1,
          ),
          Container(
            width: width,
            child: TextField(
              textAlign: TextAlign.center,
              style: headline1,
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _saveFoodData() {
    final _unitID = _unitController.selectedUnit.value.id;
    final _catID = _catController.selectedCat.value.id;
    final _status = _statusController.status;
    if (_foodNameCtl.text.isEmpty || _foodPriceCtl.text.isEmpty) {
      print('invalid');
      return;
    }
    final enteredPrice;
    try {
      enteredPrice = double.parse(_foodPriceCtl.text.replaceAll(',', ''));
    } catch (e) {
      return;
    }
    if (enteredPrice <= 0) {
      return;
    }
    final food = Food(
        id: _food.id,
        foodName: _foodNameCtl.text,
        unitId: _unitID,
        categoryId: _catID,
        foodPrice: _foodPriceCtl.text.isEmpty ? 0.0 : enteredPrice,
        foodStatus: _status.value == Status.enable ? 1 : 0,
        updateStock: 0);
    _foodController.setFood(food);
    isEditMode ? _foodController.updateFood() : _foodController.addFood();
  }

  void _showData() {
    _idCtl.text = _food.id.toString();
    _foodNameCtl.text = _food.foodName;
    _foodPriceCtl.text = formatter.format(_food.foodPrice);
  }

  @override
  Widget build(BuildContext context) {
    if (isEditMode) {
      _showData();
    }
    print(_food.foodName);
    _food.foodStatus == 1 ? _status = Status.enable : _status = Status.disable;
    _categories = _catController.categories;
    _units = _unitController.units;
    return AlertDialog(
      actions: [
        Container(
          padding: EdgeInsets.all(20),
          height: 400,
          width: 1000,
          child: Column(
            children: [
              Text(
                'ຂໍ້ມູນອາຫານ',
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  Visibility(
                    visible: false,
                    child: _buildDataField(
                        title: 'ລະຫັດ: ',
                        controller: _idCtl,
                        context: context,
                        width: 100),
                  ),
                  _buildDataField(
                      title: 'ຊື່ອາຫານ: ',
                      controller: _foodNameCtl,
                      context: context,
                      width: 600),
                  SizedBox(
                    width: 20,
                  ),
                  _buildDataField(
                      title: 'ລາຄາ: ',
                      controller: _foodPriceCtl,
                      context: context,
                      width: 200),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'ປະເພດອາຫານ: ',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        CategoryDropdown(_food.categoryId, 230),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'ຫົວໜ່ວຍ: ',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        UnitDropdown(_food.unitId),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'ຫົວໜ່ວຍ: ',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        StatusDropdown(_status),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text('ຍົກເລີກ'),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      _saveFoodData();
                      Get.back();
                    },
                    child: const Text('ບັນທຶກ'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
