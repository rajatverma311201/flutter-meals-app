import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:meals_app/models/meal.dart';

class MealItemTraitList extends StatelessWidget {
  const MealItemTraitList({
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MealItemTrait(
          icon: Icons.schedule,
          label: '${meal.duration} min',
        ),
        const SizedBox(width: 12),
        MealItemTrait(
          icon: Icons.work,
          label: complexityText,
        ),
        const SizedBox(width: 12),
        MealItemTrait(
          icon: Icons.attach_money,
          label: affordabilityText,
        ),
      ],
    );
  }
}
