import 'package:flutter/material.dart';

class AddNewTableItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.all(10),
        child: Text('Add'),
      ),
    );
  }
}
