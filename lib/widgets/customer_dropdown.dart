import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../models/customer.dart';
import '../controllers/customer_controller.dart';

class CustomerDropdown extends StatelessWidget {
  final _customerController=Get.find<CustomerController>();
  List<Customer>_customers=[];
  @override
  Widget build(BuildContext context) {
    _customers=_customerController.customers;
    return _buildDropDownCustomer( context);
  }
  
  Widget _buildDropDownCustomer( BuildContext context) {
    final headline1 = Theme.of(context).textTheme.headline1;
    var _selectedCustomer = _customers.first;
    _customerController.setSelected(_selectedCustomer);
    return Container(
      padding: const EdgeInsets.all(3.0),
      width: 200,
      height: 65,
      child: Center(
        child: FittedBox(
          child: Obx(
            () => DropdownButton<Customer>(
              value: _customerController.selectedCustomer.value,
              items: _customers.map((c) {
                return DropdownMenuItem<Customer>(
                  child: Text(
                    c.customerName,
                    textAlign: TextAlign.center,
                    style: headline1,
                  ),
                  value: c,
                );
              }).toList(),
              onChanged: (Customer? newValue) {
                _customerController.setSelected(newValue!);
              },
            ),
          ),
        ),
      ),
    );
  }
}