import 'package:flutter/material.dart';
import './dummy_data.dart';
class CategoryMealsScreen extends StatelessWidget {
    // final String categoryId;
    // final String categoryTitle;
    // // to get information about what recipie to show
    // CategoryMealsScreen({
    //   @required this.categoryId,
    //   @required this.categoryTitle
    // });
  @override
  Widget build(BuildContext context) {
    final routeArgs =ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryId=routeArgs['id'];
    final categoryTitle=routeArgs['title'];
    // extracting the categories with given id from meals
    final categoryMeals=DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    return
    Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx,index){
   return Text(categoryMeals[index].title);
      },itemCount: categoryMeals.length,)
    )
    ;
  }
}