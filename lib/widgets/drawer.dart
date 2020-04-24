import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class DrawerWidget extends StatelessWidget {
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
              child: Text('Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    color: Theme.of(context).primaryColor,
                  ))),
          SizedBox(height: 4),
          ListTile(
            leading: Icon(
              Icons.restaurant_menu,
              
              size: 30,
              color: Color.fromARGB(0xFF,0xF9, 0x9B, 0x5D),
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.title,
            ),
            onTap: (){
                  Navigator.of(context).pushReplacementNamed('/');
              },
          ),
          ListTile(
            leading: Icon(
              Icons.filter,
              size: 30,
              color: Color.fromARGB(0xFF,0xF9, 0x9B, 0x5D),
              
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.title,
              
            ),
            onTap: (){
                  Navigator.of(context).pushReplacementNamed(FilterClass.routeName);
              },
          )
        ],
      ),
    );
  }
}
