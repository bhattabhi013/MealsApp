import 'package:flutter/material.dart';

class RecipeRowItem extends StatelessWidget {
  final property;
  final iconName;
  const RecipeRowItem({required this.property, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(iconName),
          const SizedBox(
            width: 6,
          ),
          Text("$property"),
        ],
      ),
    );
  }
}
