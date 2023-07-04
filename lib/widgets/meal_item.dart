import 'package:flutter/material.dart';
import '../screens/meal_detail.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;
  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.removeItem,
  });
  // getter for extracting values from enums
  String get ComplexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get AffordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  void seclectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
      // here then executes when we pop back from meal detail skill 
      //if we poped back through back button then result will be null and we need not to do anything otherwise 
      //if we deleted it a meal id will come and we need to delete the details
    ).then((result){
        if(result!=null){
          removeItem(result);
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => seclectMeal(context),
      // we will display a card for each meal for that we are changing the shape of card in rectangular border with border radius as 15
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        // to add some shadow effect
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                // to give rounded corner to image we are just setting for top below will be some text
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  // setting image in the clip box perfectly
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // text to display over top
                // we are using positioned to set the position of the text on the image
                Positioned(
                  bottom: 20,
                  left: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      // text is too long it should be wrapped in container
                      softWrap: true,
                      // we haave added softWrap so overflow should not be there still for safety
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('$duration min'),
                    ]),
                    Row(children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(ComplexityText),
                    ]),
                    Row(children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(AffordabilityText),
                    ]),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
