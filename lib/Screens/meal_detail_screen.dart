import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/Meal-Detail";
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Detail"),
      ),
    );
  }
}
