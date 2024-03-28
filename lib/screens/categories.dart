import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/Models/meal.dart';
// ignore: unused_import
import 'package:meals/Models/category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  void _onSelectCategory(BuildContext context, Category category) {
   List<Meal> filteredMeals =  dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick your Category"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // ...availableCategories.map((category) => CategoryGridItem(category: category)).toList(),
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: (){
                _onSelectCategory(context, category);
                },
            )
        ],
      ),
    );
  }
}
