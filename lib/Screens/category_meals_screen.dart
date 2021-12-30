import 'package:flutter/material.dart';
import 'package:meals/Widgets/meal_item.dart';
import 'package:meals/models/meal.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String id;
  // final String title;
  static const routeName = '/categories';
  final List<Meal> availableMeals;
  const CategoryMealsScreen(this.availableMeals);
  // const CategoryMealsScreen({required this.id, required this.title}); // required for routing logic 1

  @override
  Widget build(BuildContext context) {
    // routing logic 2: it receives the passed arguments
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String id = routeArgs['id'].toString();
    final String title = routeArgs['title'].toString();
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipes"),
      ),
      body: ListView.builder(
        itemBuilder: (context, i) {
          return MealItem(
              id: categoryMeals[i].id,
              title: categoryMeals[i].title,
              imageUrl: categoryMeals[i].imageUrl,
              duration: categoryMeals[i].duration,
              complexity: categoryMeals[i].complexity,
              affordability: categoryMeals[i].affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
