import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item_trait_list.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:meals_app/models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectMeal,
  });

  final Meal meal;
  final Function(Meal meal) onSelectMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            MealItemInfo(
                meal: meal,
                complexityText: complexityText,
                affordabilityText: affordabilityText)
          ],
        ),
      ),
    );
  }
}

class MealItemInfo extends StatelessWidget {
  const MealItemInfo({
    super.key,
    required this.meal,
    required this.complexityText,
    required this.affordabilityText,
  });

  final Meal meal;
  final String complexityText;
  final String affordabilityText;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.black54,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
        child: Column(
          children: [
            Text(
              meal.title,
              maxLines: 2,
              textAlign: TextAlign.center,
              softWrap: true,
              overflow: TextOverflow.ellipsis, // Very long text ...
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            MealItemTraitList(
              meal: meal,
              complexityText: complexityText,
              affordabilityText: affordabilityText,
            ),
          ],
        ),
      ),
    );
  }
}
