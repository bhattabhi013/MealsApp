import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals/Screens/favourites.dart';
import 'package:meals/Widgets/drawer.dart';
import 'package:meals/models/meal.dart';

import 'categories.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.favourites);
  final List<Meal> favourites;
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Widget> _pages;
  int _SelectedPageIndex = 0;
  _selectPage(int index) {
    setState(() {
      _SelectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      CategoryList(),
      FavouritesSceen(widget.favourites),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meals"),
      ),
      drawer: const MainDrawer(),
      body: _pages[_SelectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _SelectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: "Categories"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outline,
            ),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
