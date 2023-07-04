import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
// we need to make it a statefull widget because we need to delete some meal
class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);
  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}
 // final String categoryId;
  // final String categoryTitle;
  // // to get information about what recipie to show
  // CategoryMealsScreen({
  //   @required this.categoryId,
  //   @required this.categoryTitle
  // });
String categoryTitle='';
List<Meal> displayMeals=[];
var _loadedInitData=false;
class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  void _removeMeal(String mealId){
    setState(() {
      displayMeals.removeWhere((meal) => mealId==meal.id,);
    });

  }
  // it runs whenever dependancies of this state change
// so it overwrite the removal part we need to control it 
// we used did change dependency init cant use context
 @override
  void didChangeDependencies() {
    super.didChangeDependencies();
        if(!_loadedInitData)
       {final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
        categoryTitle = routeArgs['title'];
    // extracting the categories with given id from meals
    // earlier we were extracting from all dummy data now we will use only the desiered data from available meal
   displayMeals=widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _loadedInitData=true;}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: displayMeals[index].id,
                title: displayMeals[index].title,
                imageUrl: displayMeals[index].imageUrl,
                duration: displayMeals[index].duration,
                complexity: displayMeals[index].complexity,
                affordability: displayMeals[index].affordability,
                removeItem: _removeMeal,
                );
          },
          itemCount: displayMeals.length,
        ));
  }
}
