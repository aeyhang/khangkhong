import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/category_controller.dart';
import '../models/category.dart';

class CategoryDropdown extends StatelessWidget {
  final _catController=Get.find<CategoryController>();
  List<Category> _categories=[];
  final int _catID;
  final double _width;
  CategoryDropdown(this._catID,this._width);
  @override
  Widget build(BuildContext context) {
    _categories=_catController.categories;
    return _buildDropDownCategory(_catID,context);
  }
    Widget _buildDropDownCategory(int catID, BuildContext context) {
    final headline1 = Theme.of(context).textTheme.headline1;
    print(catID.toString());
    var _selectedCat = _categories.firstWhere((c) => c.id == catID);
    _catController.selectedCat(_selectedCat);
    return Container(
      padding: const EdgeInsets.all(3.0),
      width: _width,
      height: 65,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: FittedBox(
          child: Obx(
            () => DropdownButton<Category>(
              value: _catController.selectedCat.value,
              items: _categories.map((c) {
                return DropdownMenuItem<Category>(
                  child: Text(
                    c.catName,
                    textAlign: TextAlign.center,
                    style: headline1,
                  ),
                  value: c,
                );
              }).toList(),
              onChanged: (Category? newValue) {
                _catController.setSelected(newValue!);
              },
            ),
          ),
        ),
      ),
    );
  }
  
}