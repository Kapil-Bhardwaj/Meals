import 'package:flutter/material.dart';
import 'package:meals/main.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabScreen extends StatefulWidget{
  const TabScreen({super.key});

  @override
  State<TabScreen> createState(){
    return _TabScreen();
  }
}

class _TabScreen extends State<TabScreen>{

  int _selectedPageIndex = 0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index ;
    });
  }

 @override
  Widget build(BuildContext context) {

    Widget activeScreen = const CategoryScreen();
    String activePageTitle = "categories" ;

    if(_selectedPageIndex == 1 ){
      activeScreen = MealsScreen( meals: []);
      activePageTitle = "Your Favorite";
    }

    return Scaffold(
      appBar: AppBar(
        title:   Text(activePageTitle),

      ),
      body: activeScreen,

      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
        ],
      ),
    );
  }
}
