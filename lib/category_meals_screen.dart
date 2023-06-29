import 'package:flutter/material.dart';

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
    return
    Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body:  Center(
      child: Text("The Recipies For The Category"),
    ),
    )
    ;
  }
}