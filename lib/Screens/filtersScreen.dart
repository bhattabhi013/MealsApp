import 'package:flutter/material.dart';
import 'package:meals/Widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "filters";
  final Function saveFilters;
  final Map<String, bool> filters;
  const FilterScreen({required this.saveFilters, required this.filters});
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'] as bool;
    _vegetarian = widget.filters['vegetarian'] as bool;
    _vegan = widget.filters['vegan'] as bool;
    _lactoseFree = widget.filters['lactose'] as bool;
    super.initState();
  }

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
        title: const Text("Filters"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: const Icon(Icons.filter)),
        ],
      ),
      drawer: const MainDrawer(),
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
