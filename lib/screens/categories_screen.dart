import 'package:flutter/material.dart';
import '../widgets/categoryitem.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // we are using grid view to put items side by side in a list
    // slivers are scrolable area on screens this with Crossaxis extent work on the app to store as many items we need to show here 200 show how many pixel it would take for every element
    return Scaffold(
      // here we have rwmoved the scafold becaus tabs screen will provide it
      // appBar: AppBar(
      //   title:  Text('DeliMeals'),
      // ),
      body:     GridView(
        padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      // mapping dummy categories to categoryitem and which will return the container we want
      children: DUMMY_CATEGORIES.map((catData)=>CategoryItem(catData.id ,catData.title, catData.color)).toList(),
    )
    );
  }
}
