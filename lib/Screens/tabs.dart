import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals/Screens/favourites.dart';
import 'package:meals/Widgets/drawer.dart';

import 'categories.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [CategoryList(), FavouritesSceen()];
  int _SelectedPageIndex = 0;
  _selectPage(int index) {
    setState(() {
      _SelectedPageIndex = index;
    });
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
