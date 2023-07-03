import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  // we are using bulder so that we do not need to copy code again 
  Widget buildListTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      // this will tell which screen to render
      onTap: () {
        // ...
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Options!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // calling method with title and icon type
          buildListTile(
            'Meals',
            Icons.restaurant_menu,
          ),
          buildListTile(
            'Filters',
            Icons.settings,
          ),
        ],
      ),
    );
  }
}
