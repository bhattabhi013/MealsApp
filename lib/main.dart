import 'package:flutter/material.dart';
import 'package:meals/Screens/meal_detail_screen.dart';

import '../Screens/categories.dart';
import '../Screens/category_meals_screen.dart';

void main() {
  runApp(MealsApp());
}

class MealsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // accentColor: : Colors.green
      ),
      home: CategoryList(),
      routes: {
        // '/' : (ctx) => CategoryList(), // defeault home with /
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals App'),
      ),
      body: Center(),
    );
  }
}
