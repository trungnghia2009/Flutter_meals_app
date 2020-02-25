import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';
import '../main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  static const String routeName = 'tabs_screen';
  final List<Meal> favoriteMeals;
  TabsScreen({this.favoriteMeals});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _screens;

  int _selectedIndex = 0;

  Object _selectedBody(int index) {
    return _screens[index]['body'];
  }

  Object _selectedTitle(int index) {
    return _screens[index]['title'];
  }

  @override
  void initState() {
    super.initState();
    _screens = [
      {'body': CategoriesScreen(), 'title': 'Meals'},
      {
        'body': FavoritesScreen(favoriteMeals: widget.favoriteMeals),
        'title': 'Favorites'
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_selectedTitle(_selectedIndex)),
      ),
      body: _selectedBody(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedIndex,
        onTap: (int) {
          setState(() {
            _selectedIndex = int;
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
