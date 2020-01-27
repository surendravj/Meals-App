import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/mealdetails';
  final Function toggleFavorites;
  final Function checkFavourite;
  MealDetails(this.toggleFavorites, this.checkFavourite);
  Widget heading(BuildContext ctx, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Text(text, style: Theme.of(ctx).textTheme.title),
    );
  }

  Widget contentHolder(Widget child) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: Border.all(color: Colors.grey)),
        margin: EdgeInsets.all(15),
        width: 300,
        height: 150,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            heading(context, 'Ingredinats'),
            contentHolder(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(selectedMeal.ingredients[index])),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            heading(context, 'Steps'),
            contentHolder(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                          backgroundColor: Theme.of(context).accentColor,
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(checkFavourite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavorites(mealId),
      ),
    );
  }
}
