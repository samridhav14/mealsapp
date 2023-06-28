import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // we are using grid view to put items side by side in a list
    // slivers are scrolable area on screens this with Crossaxis extent work on the app to store as many items we need to show here 200 show how many pixel it would take for every element
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: <Widget>[
        
      ],
    );
  }
}
