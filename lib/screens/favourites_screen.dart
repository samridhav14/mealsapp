import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
// this list will carry favorite
List<Meal>favoritemeals;
 FavoritesScreen(this.favoritemeals);
  @override
  Widget build(BuildContext context) {
    // there is no meal in fav section
     if (favoritemeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );

    }
    // if there meals in fav section
    else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoritemeals[index].id,
            title: favoritemeals[index].title,
            imageUrl: favoritemeals[index].imageUrl,
            duration: favoritemeals[index].duration,
            affordability: favoritemeals[index].affordability,
            complexity: favoritemeals[index].complexity,
          );
        },
        itemCount: favoritemeals.length,
      );
    }
  }
}