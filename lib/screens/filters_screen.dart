import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class FilterClass extends StatefulWidget {
  static const routeName='/filter-class';

  @override
  _FilterClassState createState() => _FilterClassState();
}

class _FilterClassState extends State<FilterClass> {
  var _glutenFree=false;
  var _vegetarian=false;
  var _vegan=false;
  var _lactoseFree=false;

  Widget _buildSwitchList(String title,var type,String str,Function updateValue){
     return SwitchListTile(
                title:Text('Glutten-Free'),
                value: type,
                subtitle: Text(str),
                onChanged: updateValue,
              );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Filter')),
      drawer: DrawerWidget(),
      backgroundColor: Theme.of(context).primaryColor,
     body: Column(
      children: <Widget>[
        Container(
          padding:EdgeInsets.all(10),
          child: Text(
            'Adjust Your Meal Selection',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Expanded(
          child:ListView(
            children: <Widget>[
             _buildSwitchList('Glutten-Free', _glutenFree,'It Includes only Glutte free food',
             (value){
                  setState(() {
                    _glutenFree=value;
                  });
                },
             ),
             _buildSwitchList('Glutten-Free', _lactoseFree,'It Includes only Lactose free food',
             (value){
                  setState(() {
                    _lactoseFree=value;
                  });
                },
             ),
             
             _buildSwitchList('Glutten-Free', _vegetarian,'I includes only Vegetarian food',
             (value){
                  setState(() {
                    _vegetarian=value;
                  });
                },
             ),
             
             _buildSwitchList('Glutten-Free', _vegan,'It includes only Non-veg',
             (value){
                  setState(() {
                    _vegan=value;
                  });
                },
             ),
             

            ],
          ) 
        ),
        ],
      ),
          
    );
  }
}