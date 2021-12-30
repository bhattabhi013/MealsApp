import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "filters";
  final Function onPressed;

  const FilterScreen({required this.onPressed});
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget buildSwitchListTile(
      String title, String description, bool currentValue, Function updateVal) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: (newVal) => updateVal(newVal));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites"),
        actions: <Widget>[
          IconButton(
              onPressed: () => widget.onPressed, icon: Icon(Icons.filter)),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              "Adjust meal selection.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                    "Gluten free",
                    "For gluten free recipes",
                    _glutenFree,
                    (newVal) => {
                          setState(() {
                            _glutenFree = newVal;
                          })
                        }),
                buildSwitchListTile(
                    "Vegetarian",
                    "For Vegetarian recipes",
                    _vegetarian,
                    (newVal) => {
                          setState(() {
                            _vegetarian = newVal;
                          })
                        }),
                buildSwitchListTile(
                    "Lactose free",
                    "For lactose free recipes",
                    _lactoseFree,
                    (newVal) => {
                          setState(() {
                            _lactoseFree = newVal;
                          })
                        }),
                buildSwitchListTile(
                    "Vegan",
                    "For Vegan recipes",
                    _vegan,
                    (newVal) => {
                          setState(() {
                            _vegan = newVal;
                          })
                        }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
