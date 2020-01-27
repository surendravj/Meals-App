import 'package:flutter/material.dart';
import 'package:meals/screens/cat_screen.dart';
import 'package:meals/screens/favourite_screen.dart';
import 'package:meals/widgets/main_drawer.dart';
import '../models/mealModel.dart';

// code for top bottom naviaror

// class TabScreen extends StatefulWidget {
//   @override
//   _TabScreenState createState() => _TabScreenState();
// }

// class _TabScreenState extends State<TabScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meals'),
//           bottom: TabBar(
//             tabs: <Widget>[
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Categories',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'Favourite',
//               )
//             ],
//           ),
//         ),body: TabBarView(
//           children: <Widget>[
//             Cat(),
//             FavouriteScreen()
//           ],
//         ),
//       ),
//     );
//   }
// }

// code for bottom navigator

class TabScreen extends StatefulWidget {
  final List<Meal> fMeals;
  TabScreen(this.fMeals);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': Cat(), 'title': 'Categories'},
      {'page': FavouriteScreen(widget.fMeals), 'title': 'Favourites'}
    ];
    super.initState();
  }

  void selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedIndex]['title'])),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedIndex,
        onTap: selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('favorites'),
          )
        ],
      ),
    );
  }
}
