import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';


class FilterScreen extends StatelessWidget {
  const FilterScreen({Key key}) : super(key: key);
static const routeName='/filters-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: 
        Text('filter'),
      ),
    );
  }
}