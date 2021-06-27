import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/global_var.dart';
import '../controllers/global_controller.dart';

class StatusDropdown extends StatelessWidget {
  final _globalController = Get.find<GlobalController>();
  final Status _status;
  StatusDropdown(this._status);
  @override
  Widget build(BuildContext context) {
    return _buildDropDownStatus(context);
  }

  Widget _buildDropDownStatus(BuildContext context) {
    final headline1 = Theme.of(context).textTheme.headline1;
    var _selectedStatus = _status;
    print(_status.toString());
    _globalController.setStatus(_selectedStatus);
    return Container(
      padding: const EdgeInsets.all(3.0),
      width: 200,
      height: 65,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: FittedBox(
          child: Obx(
            () => DropdownButton<Status>(
              value: _globalController.status.value,
              items: Status.values.map((s) {
                return DropdownMenuItem<Status>(
                  value: s,
                  child: Text(
                    s ==Status.enable?'ພ້ອມໃຊ້ງານ':'ບໍ່ພ້ອມໃຊ້ງານ',
                    style: headline1,
                  ),
                );
              }).toList(),
              onChanged: (Status? newValue) {
                print(newValue);
                _globalController.setStatus(newValue!);
              },
            ),
          ),
        ),
      ),
    );
  }
}
