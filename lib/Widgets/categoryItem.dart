// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../Screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem({required this.title, required this.color, required this.id});

  void selectCategory(BuildContext ctx) {
    // routing logic 1 : without centered routes and using class const.
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(builder: (_) {
    //     return CategoryMealsScreen(title: title , id: id);
    //   })
    // );
    // routing logic 2 : wit cenetered routes in main.dart
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Card(
          child: Text(title),
        ),
      ),
    );
  }
}
