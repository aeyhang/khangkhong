import 'package:get/get.dart';

import '../models/global_var.dart';

class GlobalController extends GetxController {
  var status = Status.enable.obs;
  var statusText = ''.obs;
  
  String get getStatusText{
    this.status.value==Status.enable?statusText.value='ພ້ອມໃຊ້ງານ':statusText.value='ບໍ່ພ້ອມໃຊ້ງານ';
    return this.statusText.value;
  }
  void setStatus(Status status) {
    this.status.value = status;
  }
}
