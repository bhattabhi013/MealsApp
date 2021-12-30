import 'package:flutter/material.dart';
import 'package:meals/Screens/filtersScreen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  // new widget for creating buildListTile
  Widget buildListTile(String title, IconData icon, VoidCallback tileTapped) {
    return ListTile(
      onTap: tileTapped,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      // onTap: ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.centerLeft,
            color: Colors.amber,
            child: Text(
              "Cooking up",
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
