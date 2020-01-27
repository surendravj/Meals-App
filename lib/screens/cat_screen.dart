import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/cat_item.dart';

class Cat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(20),
        children: DUMMY
            .map((data) => CatItem(data.id, data.title, data.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20));
  }
}
