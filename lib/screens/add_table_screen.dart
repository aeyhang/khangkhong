import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTableScreen extends StatelessWidget {
  static const routeName = '/add_table';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 25,
              ),
              onPressed: () => Get.back(),
              
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          width: 600,
          height: 800,
          color: Theme.of(context).primaryColor,
          child:
              TextButton(onPressed: () => Get.back(), child: Text('Go Back')),
        ),
      ),
    );
  }
}
