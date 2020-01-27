import 'package:flutter/material.dart';
import '../widgets/meal.item.dart';
import '../models/mealModel.dart';

class CatMeals extends StatefulWidget {
  static const routeName = '/category';
  final List<Meal> availablemeals;
  CatMeals(this.availablemeals);

  @override
  _CatMealsState createState() => _CatMealsState();
}

class _CatMealsState extends State<CatMeals> {

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = args['id'];
    final cattitle = args['title'];
    final meals = widget.availablemeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(cattitle),
        ),
        body: Container(
            child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                meals[index].id,
                meals[index].title,
                meals[index].imageUrl,
                meals[index].duration,
                meals[index].complexity,
                meals[index].affordability);
          },
          itemCount: meals.length,
        )));
  }
}
