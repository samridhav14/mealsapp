import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key key}) : super(key: key);
  static const routeName = '/filters-screen';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _GlutenFree = false;
  var _Vegan = false;
  var _Vegetarian = false;
  var _LactoseFree = true;
  // using builder to decrease size of the code
  Widget _builder(
      String title, String subtitle, bool currentvalue, Function updateValue) {
        // using expanded so that we can use list view easily
   return Expanded(
        child: ListView(
      children: <Widget>[
        SwitchListTile(
          title: Text(title),
          value: currentvalue,
          subtitle: Text(subtitle),
          onChanged: updateValue,
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your Meals',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
               _builder(
              'Gluten-Free',
              'Only include Gluten-free meals',
              _GlutenFree,
              (newValue) {
                setState(() {
                  _GlutenFree = newValue;
                });
              },
            ),
            _builder(
              'Vegan',
              'Only include Vegan meals',
              _Vegan,
              (newValue) {
                setState(() {
                  _Vegan= newValue;
                });
              },
            ),
            _builder(
              'Vegitarian',
              'Only include Vegitarian meals',
              _Vegetarian,
              (newValue) {
                setState(() {
                  _Vegetarian = newValue;
                });
              },
            ),
            _builder(
              'Lactose-Free',
              'Only include Lactose-free meals',
              _LactoseFree,
              (newValue) {
                setState(() {
                  _LactoseFree = newValue;
                });
              },
            ),
         
          ],
        ));
  }
}
