import 'package:flutter/material.dart';
import './models/category.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem(this.title, this.color, {super.key});
  @override
  Widget build(BuildContext context) {
    // we need to render a card we can directly return it or we can make our own custom thing
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(title),
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
    );
  }
}
