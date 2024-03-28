import 'package:flutter/material.dart';
import 'package:meals/Models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});
  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    if (meals.isEmpty == true) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: const Center(
            child: Text(
          "Noting to Display....",
          style: TextStyle(color: Colors.white),
        )),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) => MealItem(meal: meals[index])),
      );
    }
  }
}
