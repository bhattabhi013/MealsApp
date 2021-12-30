// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:meals/Screens/filtersScreen.dart';
import 'package:meals/Screens/meal_detail_screen.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/models/meal.dart';

import '../Screens/categories.dart';
import '../Screens/category_meals_screen.dart';
import 'Screens/tabs.dart';

void main() {
  runApp(MealsApp());
}

class MealsApp extends StatefulWidget {
  @override
  State<MealsApp> createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void _setFilters(Map<String, bool> filterParams) {
    setState(() {
      _filters = filterParams;
      // _availableMeals = DUMMY_MEALS.where((meal) {

      // });
    });
  }

  List<Meal> _availableMeals = DUMMY_MEALS;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delight Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // accentColor: : Colors.green
      ),
      // home: CategoryList(),
      routes: {
        '/': (ctx) => TabsScreen(), // defeault home with /
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(
              onPressed: _setFilters,
            ),
      },
      // onGenerateRoute: (settings) {
      //   if (settings.name == '/meal-detail') {
      //     return MaterialPageRoute(
      //         builder: (_) => MealDetailScreen()); // Pass it to BarPage.
      //   }
      //   return MaterialPageRoute(
      //       builder: (_) =>
      //           CategoryMealsScreen()); // Let `onUnknownRoute` handle this behavior.
      // },

      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              Scaffold(body: Center(child: Text('Not Found'))),
        );
      },
    );
  }
}
