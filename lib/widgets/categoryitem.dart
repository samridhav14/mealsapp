import 'package:flutter/material.dart';
import '../models/category.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem(this.id, this.title, this.color);
   static const routeName='categories-meals';
  void selectCategory(BuildContext ctx) {
    // navigator used to change page or pages
    // material page route work as wrapper for builder builder set what widget to build
    Navigator.of(ctx).pushNamed(
      CategoryItem.routeName, arguments: {'id':id,'title':title}
     // MaterialPageRoute(builder: (_) {
    //   return CategoryMealsScreen(
    //     categoryId: id,
    //     categoryTitle: title,
    //   );
    // })
    );
  }

  @override
  Widget build(BuildContext context) {
    // we need to render a card we can directly return it or we can make our own custom thing
    // we can use gesture detector to use tap or double tap but inkwell is basically gesture detector with ripple effect
    return InkWell(
      onTap: () => selectCategory(context),
      // ripple effect
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        // here we can simply give it a background color but to get more customization we are using box decoration here
        decoration: BoxDecoration(
          gradient: LinearGradient(
              // here we have a list of colors with diff opacity
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft),
          // here we are coustomizing the border here we cant use const
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
