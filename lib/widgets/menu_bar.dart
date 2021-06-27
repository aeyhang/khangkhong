import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../screens/tables_screen.dart';
import '../screens/foods_screen.dart';

class MenuBar extends StatelessWidget {
  Widget _buildSideMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    Color color = Theme.of(context).primaryColor;
    return InkWell(
      onTap: onTap,      
      child: Card(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 50,
            child: Row(
              children: [
                Container(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      'assets/images/table.png',
                      fit: BoxFit.contain,
                    )),
                    SizedBox(width: 20,),
                Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      height: double.infinity,
      width: 250,
      child: Column(children: [
        _buildSideMenuItem(context, Icons.desktop_mac_sharp, 'ຫນ້າຫລັກ', () {}),
        _buildSideMenuItem(context, Icons.ac_unit_outlined, 'Home', () {}),
        _buildSideMenuItem(context, Icons.desktop_mac_sharp, 'Home', () {}),
        _buildSideMenuItem(context, Icons.desktop_mac_sharp, 'Home', () {}),
        _buildSideMenuItem(context, Icons.desktop_mac_sharp, 'Home', () {}),
        SizedBox(
          height: 10,
        ),
        Text(
          'ຈັດການ',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        _buildSideMenuItem(context, Icons.desktop_mac_sharp, 'ໂຕະ', ()=>Get.toNamed(TablesScreen.routeName)),
        _buildSideMenuItem(context, Icons.ac_unit_outlined, 'ສິນຄ້າ', () =>Get.toNamed(FoodsScreen.routeName)),
        _buildSideMenuItem(context, Icons.desktop_mac_sharp, 'ປະເພດສິຄ້າ', () {}),
        _buildSideMenuItem(context, Icons.desktop_mac_sharp, 'Home', () {}),
        _buildSideMenuItem(context, Icons.desktop_mac_sharp, 'Home', () {}),
      ]),
    );
  }
}
