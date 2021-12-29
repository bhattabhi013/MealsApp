import 'package:flutter/material.dart';
import 'package:meals/Screens/meal_detail_screen.dart';
import 'package:meals/models/meal.dart';

import 'recipeRowItem.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.id});

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: id);
  }

  String get ComplexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
    }
  }

  String get AffordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    color: Colors.black54,
                    width: 300,
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RecipeRowItem(
                    property: duration,
                    iconName: Icons.schedule,
                  ),
                  RecipeRowItem(
                    property: ComplexityText,
                    iconName: Icons.work,
                  ),
                  RecipeRowItem(
                    property: AffordabilityText,
                    iconName: Icons.money,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
