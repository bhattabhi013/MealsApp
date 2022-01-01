import 'package:flutter/material.dart';
import 'package:meals/Screens/filtersScreen.dart';
import 'package:meals/Screens/meal_detail_screen.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/models/meal.dart';

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

  void _setFilters(Map<String, bool> filteredParams) {
    setState(() {
      _filters = filteredParams;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters!['gluten'] as bool && !meal.isGlutenFree) {
          return false;
        }
        if (_filters!['lactose'] as bool && !meal.isLactoseFree) {
          return false;
        }
        if (_filters!['vegan'] as bool && !meal.isVegan) {
          return false;
        }
        if (_filters!['vegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavourite(String mealId) {
    print(mealId);
    int? existingIndex =
        _favouriteMeals.indexWhere((meal) => mealId == meal.id);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool IsMealFavt(String mealId) {
    return _favouriteMeals.any((meal) => meal.id == mealId);
  }

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

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
        '/': (ctx) => TabsScreen(_favouriteMeals), // defeault home with /
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(toggleFavourite, IsMealFavt),
        FilterScreen.routeName: (ctx) => FilterScreen(
              saveFilters: _setFilters,
              filters: _filters,
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
