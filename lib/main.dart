import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/categoryitem.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        '/' : (ctx)=>CategoriesScreen(),
        //'/categories-meals' : (ctx)=>CategoryMealsScreen() ,
        // simpllar way for writing
        CategoryItem.routeName: (ctx)=>CategoryMealsScreen() ,
      },
    );
  }
}























// no need of this we are rendering categories screen

// class MyHomePage extends StatefulWidget {
//     @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('DeliMeals'),
//       ),
//       body: Center(
//         child: Text('Navigation Time!'),
//       ),
//     );
//   }
// }
