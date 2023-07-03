import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import './favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    // if we want to add tabs at the top after app bar we use defaulttab controller
    return DefaultTabController(
        length: 2,
       // initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Meals'),
            bottom: TabBar(tabs: [
              //list of tabs to show
              Tab(
                // icon of the tab with its name
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favorite',
              ),
            ]),
          ),
          // now this helps us to determine what element we need to show for every tab
          body: TabBarView(children: <Widget>[
            CategoriesScreen(),
            FavoritesScreen(),
          ]),
        ));
  }
}
