import 'package:flutter/material.dart';
import 'package:meals/screens/cat_meals_screen.dart';
class CatItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CatItem(this.id,this.title, this.color);

  void openScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CatMeals.routeName,arguments:{'id':id,'title':title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => openScreen(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [color.withOpacity(0.7), color],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight),
              borderRadius: BorderRadius.circular(15)),
        ));
  }
}
