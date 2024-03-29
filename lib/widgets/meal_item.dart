import 'package:flutter/material.dart';
import 'package:meals/Models/meal.dart';
import 'package:meals/screens/meals_details.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals/screens/meals_details.dart';

import '../screens/meals.dart';
class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});
  final Meal meal;
  String get complexity {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordability {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  void _onSelectMeal(BuildContext context, String title){
    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (ctx)=> MealsDetailScreen(meal: meal)
    //
    // ));
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => MealsDetailScreen(meal: meal),
        ));}

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          _onSelectMeal(context,meal.title);
          },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                              label: "${meal.duration.toString()} min",
                              icon: Icons.schedule),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(label: complexity, icon: Icons.work),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                              label: affordability, icon: Icons.attach_money),
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
