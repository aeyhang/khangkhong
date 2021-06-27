import 'package:get/get.dart';
import '../models/unit.dart';
import '../services/unit_service.dart';

class UnitController extends GetxController {
  var units=<Unit>[].obs;
  // var selectedUnit=''.obs;
  var selectedUnit=Unit(id:0, unitName:'none').obs;
  
  void setUnit(Unit unit)=>selectedUnit.value=unit;

  // void setUnit(String unit){
  //   selectedUnit.value=unit;
  // }
  @override
  void onInit() {
    // print('printing from table controller class');flu
    super.onInit();
    fetchUnits();
  }

  
  void fetchUnits() async {
    units.value = await UnitService.getCategories();
    update();
  }
}
