// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/Meal-Detail";
  const MealDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Detail"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SectionTitle(
            title: 'Ingredients',
          ),
          CardView(
            list: selectedMeal.ingredients,
          ),
          SectionTitle(
            title: 'Steps',
          ),
          CardView(
            list: selectedMeal.steps,
          ),
        ],
      ),
    );
  }
}

class CardView extends StatelessWidget {
  const CardView({required this.list});
  final list;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: Border.all(
          color: Colors.amber,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.maxFinite,
      child: ListView.builder(
        itemBuilder: (context, i) => Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: CircleAvatar(
                    radius: 10.0,
                    child: Text('${i + 1}'),
                  ),
                ),
                Text(
                  list[i],
                ),
              ],
            ),
          ),
        ),
        itemCount: list.length,
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final title;
  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
