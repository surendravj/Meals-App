import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';

class Filter extends StatefulWidget {
  static const routeName = '/filters';
  final Function setFilter;
  final Map<String, bool> currentFilters;
  Filter(this.setFilter, this.currentFilters);
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool _isGlutenFree = false;
  bool _isLactosFree = false;
  bool _isVegan = false;
  bool _isVeg = false;
  @override
  void initState() {
    _isGlutenFree = widget.currentFilters['isgluten'];
    _isLactosFree = widget.currentFilters['islactos'];
    _isVegan = widget.currentFilters['isvegan'];
    _isVeg = widget.currentFilters['isveg'];
    super.initState();
  }

  Widget getSwitchTile(
      String title, bool booleanValue, String desc, Function eventHandler) {
    return SwitchListTile(
      title: Text(title),
      value: booleanValue,
      subtitle: Text(desc),
      onChanged: eventHandler,
    );
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
                var selectedFilters = {
                  'isgluten': _isGlutenFree,
                  'islactos': _isLactosFree,
                  'isvegan': _isVegan,
                  'isveg': _isVeg
                };
                widget.setFilter(selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Customize your meals here',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              )),
          Expanded(
              child: ListView(
            children: <Widget>[
              getSwitchTile(
                  'Gluten-Free', _isGlutenFree, 'To enable gluten-free meals',
                  (newValue) {
                setState(() {
                  _isGlutenFree = newValue;
                });
              }),
              getSwitchTile(
                  'Lactos-Free', _isLactosFree, 'To enable Lactos-free meals',
                  (newValue) {
                setState(() {
                  _isLactosFree = newValue;
                });
              }),
              getSwitchTile('Veggies', _isVegan, 'To enable vegan meals',
                  (newValue) {
                setState(() {
                  _isVegan = newValue;
                });
              }),
              getSwitchTile('isveg', _isVeg, 'To enable Non veg meals',
                  (newValue) {
                setState(() {
                  _isVeg = newValue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
