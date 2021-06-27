import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/food.dart';
import '../controllers/food_controller.dart';
import '../controllers/unit_controller.dart';
import '../widgets/food_dialog.dart';

class FoodCategory extends StatelessWidget {
  final _catID;
  final FoodController foodController = Get.find<FoodController>();
  final UnitController unitController = Get.find<UnitController>();
  FoodCategory(this._catID);
  @override
  Widget build(BuildContext context) {
    final headline1 = Theme.of(context).textTheme.headline1;
    final formatter = new NumberFormat("#,###");
    return  Container(
        color: Colors.grey[700],
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 30),
        child: Obx(() {
          List<Food> _foods = foodController.foods
              .where((f) => f.categoryId == _catID)
              .toList();
          return GridView.builder(
            itemCount: _foods.length,
            itemBuilder: (context, index) {
              var fontColor=Colors.red;
              _foods[index].foodStatus==1?fontColor=Colors.teal:fontColor=Colors.red;
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          _foods[index].foodName,
                          style: TextStyle(color: fontColor,fontSize:25),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'ລາຄາ: ',
                            style: headline1,
                          ),
                          Text(
                            formatter.format(_foods[index].foodPrice),
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                          Text(
                            ' ກີບ',
                            style: headline1,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'ຫົວໜ່ວຍ: ',
                            style: headline1,
                          ),
                          Text(
                            unitController.units
                                .firstWhere((u) => u.id == _foods[index].unitId)
                                .unitName,
                            style: headline1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextButton(
                              child: Text(
                                'ແກ້ໄຂ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              onPressed: () => showDialog(
                                context: context, 
                                barrierDismissible: false,                               
                                builder: (BuildContext context) {
                                  return FoodDialog(_foods[index],true);                                  
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              mainAxisExtent: 165
            ),
          );
        }),
      
    );
  }
}
