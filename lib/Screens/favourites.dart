import 'package:flutter/material.dart';
import 'package:meals/Widgets/meal_item.dart';
import 'package:meals/models/meal.dart';

class FavouritesSceen extends StatelessWidget {
  const FavouritesSceen(this.favourites);
  final List<Meal> favourites;

  @override
  Widget build(BuildContext context) {
    if (favourites.isEmpty) {
      return const Center(
        child: Text("No favourites"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, i) {
          return MealItem(
              id: favourites[i].id,
              title: favourites[i].title,
              imageUrl: favourites[i].imageUrl,
              duration: favourites[i].duration,
              complexity: favourites[i].complexity,
              affordability: favourites[i].affordability);
        },
        itemCount: favourites.length,
      );
    }
  }
}
