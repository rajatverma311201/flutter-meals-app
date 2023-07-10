import 'package:flutter/widgets.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key, required this.favoriteMeals});

  final List<Meal> favoriteMeals;
  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      // lowerBound: 0,
      // upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.reverse();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: MealsScreen(
        meals: widget.favoriteMeals,
      ),
      builder: (ctx, child) => SlideTransition(
        position: _animationController.drive(
          Tween(
            begin: const Offset(1, 0),
            end: const Offset(0, 0),
          ),
        ),
        child: child,
      ),
    );
  }
}
