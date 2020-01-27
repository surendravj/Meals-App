import 'package:flutter/Material.dart';
import '../models/mealModel.dart';
import '../widgets/meal.item.dart';

class FavouriteScreen extends StatefulWidget {
  final List<Meal> fMeals;
  FavouriteScreen(this.fMeals);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.fMeals.isEmpty) {
      return Center(
        child: Text('No favorites yet'),
      );
    } else {
      return Container(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              widget.fMeals[index].id,
              widget.fMeals[index].title,
              widget.fMeals[index].imageUrl,
              widget.fMeals[index].duration,
              widget.fMeals[index].complexity,
              widget.fMeals[index].affordability);
        },
        itemCount: widget.fMeals.length,
      ));
    }
  }
}
