import 'package:flutter/material.dart';

import '../../models/meal.dart';
import '../drawer/side_drawer.dart';
import '../favorites/favories_screen.dart';
import '../categories/category_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  final void Function(String) toggleFavorite;
  const TabsScreen(this.favoriteMeals, this.toggleFavorite, {Key? key})
      : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Widget> _pages;
  int _selectedPage = 0;

  @override
  void initState() {
    _pages = [
      const CategoryScreen(),
      FavoritesScreen(widget.favoriteMeals, widget.toggleFavorite),
    ];
    super.initState();
  }

  void _onTabChange(int idx) {
    setState(() {
      _selectedPage = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TastyMeals')),
      drawer: const SideDrawer(),
      body: _pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabChange,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondaryVariant,
        currentIndex: _selectedPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border_rounded),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
