
import 'package:flutter/material.dart';
import 'package:recipies/widgets/drawer.dart';
import './categories_screen.dart';
import './favourites_screen.dart';
class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String,Object>> _pages=[
    {'page':CategoriesScreen(),'title':'Recipes'},
    {'page': FavouritesScreen(),'title':'Favourites'}
  ];
  int _ind=0;
  void _selectPage(int index){
      setState(() {
        _ind=index;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text(_pages[_ind]['title'])),
        drawer:DrawerWidget(),
        backgroundColor: Theme.of(context).primaryColor,
        body: _pages[_ind]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          unselectedItemColor: Color.fromARGB(0xFF, 0xE9, 0xEA, 0xEA),
          selectedItemColor: Color.fromARGB(0xFF,0xF9, 0x9B, 0x5D),
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: _ind,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor:Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Recipes')
            ),
            BottomNavigationBarItem(
              backgroundColor:Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favourites')
            )
          ],
        ),
      
      
    );
  }
}