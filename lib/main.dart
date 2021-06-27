import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/foods_screen.dart';
import './screens/add_table_screen.dart';
import './screens/tables_screen.dart';
import './screens/home_screen.dart';
import './screens/sale_screen.dart';

import './controllers/food_controller.dart';
import './controllers/unit_controller.dart';
import './controllers/global_controller.dart';
import './controllers/customer_controller.dart';

void main() {
  Get.put(FoodController());
  Get.put(UnitController());
  Get.put(GlobalController());
  Get.put(CustomerController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.teal[900],
        accentColor: Colors.teal[700],
        fontFamily: 'PhetsarathOT',
        textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.teal[900],
              fontSize: 20,
              fontWeight: FontWeight.bold),
          headline2: TextStyle(color: Colors.teal[900], fontSize: 30),
          headline3: TextStyle(color: Colors.teal, fontSize: 30),
        ),
      ),
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: AddTableScreen.routeName, page: () => AddTableScreen()),
        GetPage(name: TablesScreen.routeName, page: () => TablesScreen()),
        GetPage(name: FoodsScreen.routeName, page: () => FoodsScreen()),
        GetPage(name: SaleScreen.routeName, page: () => SaleScreen()),
      ],
      initialRoute: '/',
      home: HomeScreen(),
    );
  }
}
