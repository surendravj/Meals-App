import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/screens/cat_meals_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tab_screen.dart';
import './screens/cat_meals_screen.dart';
import './models/mealModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> meals = DUMMY_MEALS;
  List<Meal> _fMeals = [];
  Map<String, bool> _filters = {
    'isgluten': false,
    'islactos': false,
    'isvegan': false,
    'isveg': false
  };

  void _setFilter(Map<String, bool> data) {
    setState(() {
      _filters = data;
      meals = DUMMY_MEALS.where((meal) {
        if (_filters['isgluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['islactos'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['isvegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['isveg'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorites(String id) {
    final existingMeal = _fMeals.indexWhere((meal) => meal.id == id);
    if (existingMeal >= 0) {
      setState(() {
        _fMeals.removeAt(existingMeal);
      });
    } else {
      setState(() {
        _fMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
      });
    }
  }

  bool checkFavourite(String id) {
    return _fMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(23, 24, 21, 1)),
              body2: TextStyle(
                color: Color.fromRGBO(25, 21, 23, 1),
              ),
              title: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.bold))),
      routes: {
        '/': (ctx) => TabScreen(_fMeals),
        CatMeals.routeName: (ctx) => CatMeals(meals),
        MealDetails.routeName: (ctx) =>
            MealDetails(toggleFavorites, checkFavourite),
        Filter.routeName: (ctx) => Filter(_setFilter, _filters)
      },
    );
  }
}
