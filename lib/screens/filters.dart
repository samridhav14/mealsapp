import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters-screen';
    final Function saveFilters;
    final Map<String,bool> currentFilters;

  // here current filters will help us to get back what filters were active previously and
  // save filters help us to send changed data to main dart
     FilterScreen(this.currentFilters, this.saveFilters);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _GlutenFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;
  bool _LactoseFree = false;
  @override
  void initState() {
    super.initState();
    _GlutenFree=widget.currentFilters['gluten'];
    _Vegan=widget.currentFilters['vegan'];
    _Vegetarian=widget.currentFilters['vegetarian'];
    _LactoseFree=widget.currentFilters['lactose'];
  }
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
           actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _GlutenFree,
                'lactose':_LactoseFree,
                'vegan': _Vegan,
                'vegetarian': _Vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
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
