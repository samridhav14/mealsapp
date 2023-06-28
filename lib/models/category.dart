// how a category looks like
import 'package:flutter/material.dart';

class Category{
    final String id;
    final String title;
    final Color color;
    // here the constructor is constant because once a category created can not be changed
   const Category({required this.id,
    required this.title,
    this.color=Colors.orange}
    );
}