import 'package:flutter/material.dart';
import 'package:meals/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget tiles(String text, IconData icon, Function eventHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.black,
            fontSize: 23,
            fontFamily: 'RobotoCondensed'),
      ),
      onTap:eventHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: Theme.of(context).accentColor,
            height: 150,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            child: Text(
              'Cooking ! Free',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          tiles('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          tiles('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(Filter.routeName);
          }),
        ],
      ),
    );
  }
}
