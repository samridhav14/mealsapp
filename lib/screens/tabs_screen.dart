import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import './favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // we can use a list of map if we want more customization for example diff app bar for different creens
  final List<Widget> _pages=[
      CategoriesScreen(),
      FavoritesScreen(),
  ];
   int _selectedPagedIndex=0;
  void _selectPage(int index){
      setState(() {
        _selectedPagedIndex=index;
      });
  }
  @override
  Widget build(BuildContext context) {
    // // if we want to add tabs at the top after app bar we use defaulttab controller
    // return DefaultTabController(
    //     length: 2,
    //    //  initialIndex: 0,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         title: Text('Meals'),
    //         bottom: TabBar(tabs: [
    //           //list of tabs to show
    //           Tab(
    //             // icon of the tab with its name
    //             icon: Icon(Icons.category),
    //             text: 'Categories',
    //           ),
    //           Tab(
    //             icon: Icon(Icons.favorite),
    //             text: 'Favorite',
    //           ),
    //         ]),
    //       ),
    //       // now this helps us to determine what element we need to show for every tab
    //       body: TabBarView(children: <Widget>[
    //         CategoriesScreen(),
    //         FavoritesScreen(),
    //       ]),
    //     ));
    // if we want add tabs at the bottom of the app
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      body: _pages[_selectedPagedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        // to change present and rest screen we can use selected index
        currentIndex: _selectedPagedIndex,
       // type: BottomNavigationBarType.shifting,
        items: [
          // there are two tabs we need to show
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.category),
            label: 'Categories',
            ),
          BottomNavigationBarItem(
             backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.favorite),
            label: 'Favorites',
            ),
        ]),
    );
  }
}
