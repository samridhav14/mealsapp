import 'package:flutter/material.dart';
import '../screens/filters.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail.dart';
import './widgets/categoryitem.dart';
import 'dummy_data.dart';
import 'models/meal.dart';
import 'screens/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // initiallizing all the default values of all bool check
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  // total meals initially
  List<Meal> _availableMeals = DUMMY_MEALS;
  // meals after applying any filter
   List<Meal> _favoriteMeals = [];

   // this function will update the bool values according to which we will filtter our meals
   void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
       // all the filtter conditions applied
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.pink,secondary: Colors.amber),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyMedium: TextStyle(
            color: Color.fromRGBO(20    , 51, 51, 1),
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily:'RobotoCondensed',
          ) 
        ),
      ),
      // here home is the first widget class that will appear we are setting it to category screen because we want that to get rendered first
     // home:  CategoriesScreen(),
      routes: {
        // setting category screen as initial route
        '/' : (ctx)=>TabsScreen(),
        //'/categories-meals' : (ctx)=>CategoryMealsScreen() ,
        // simpllar way for writing
        CategoryItem.routeName: (ctx)=>CategoryMealsScreen(_availableMeals) ,
        MealDetailScreen.routeName: (ctx)=>MealDetailScreen() ,
        FilterScreen.routeName: (ctx)=>FilterScreen( _filters,_setFilters),
      },
      // speacial things given by flutter this is basically used when a condition appears where we genrate a route which is not present in routes table
      // onGenerateRoute: (settings){
      //   return MaterialPageRoute(builder: (ctx)=>CategoriesScreen());
      // },
      // this is used as a backup if some unknown route is there show some default screen this is a good practise to add it
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx)=>CategoriesScreen());
      // },
    );
  }
}
























