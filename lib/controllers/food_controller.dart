import 'package:get/get.dart';
import '../models/food.dart';
import '../services/food_service.dart';

class FoodController extends GetxController {
  var foods=<Food>[].obs;
  var _food=Food(id: 0,foodName: 'none',unitId: 1,categoryId: 1,foodPrice: 0.0,foodStatus: 0,updateStock: 0).obs;
  void setFood(Food food)
  {
    this._food.value=food;
  }
  Food getFood()=>_food.value;
  @override
  void onInit() {
    // print('printing from table controller class');flu
    fetchFood();
    super.onInit();
  }
  Future<String>addFood()async{
    final result=await FoodService.postFood(_food.value);
    fetchFood();
    return result;
  }
 Future<String> updateFood() async{
   final result=await FoodService.updateFood(_food.value);
   fetchFood();
   return result;
 }
  
  void fetchFood() async {
    foods.value = await FoodService.getFoods();
    update();
  }
}
