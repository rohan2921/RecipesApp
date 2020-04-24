import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class FilterClass extends StatefulWidget {
  static const routeName='/filter-class';
  final Function _setFilters;
  final Map<String,bool> _previousValues;
  FilterClass(this._setFilters,this._previousValues);
  @override
  _FilterClassState createState() => _FilterClassState();
}

class _FilterClassState extends State<FilterClass> {
  var _glutenFree=false;
  var _vegetarian=false;
  var _vegan=false;
  var _lactoseFree=false;
  @override
  initState(){
    _glutenFree=widget._previousValues['gluton'];
    _lactoseFree=widget._previousValues['lactose'];
    _vegan=widget._previousValues['vegan'];
    _vegetarian=widget._previousValues['vegetarian'];

    super.initState();
  }

  Widget _buildSwitchList(String title,var curVal,String str,Function updateValue){
     return SwitchListTile(
                title:Text(title),
                value: curVal,
                subtitle: Text(str),
                onChanged: updateValue,
              );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title:Text('Filter'),
      actions: <Widget>[
          IconButton(
            icon:Icon(Icons.save),
            onPressed:(){
              final Map<String,bool> filters={
                  'gluton': _glutenFree,
                  'lactose':_lactoseFree,
                  'vegan':_vegan,
                  'vegetarian':_vegetarian,
                  };
              widget._setFilters(filters);
            }
          )
          
      ],  
      ),
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
             _buildSwitchList('Lactose-Free', _lactoseFree,'It Includes only Lactose free food',
             (value){
                  setState(() {
                    _lactoseFree=value;
                  });
                },
             ),
             
             _buildSwitchList('Vegetarian-Free', _vegetarian,'I includes only Vegetarian food',
             (value){
                  setState(() {
                    _vegetarian=value;
                  });
                },
             ),
             
             _buildSwitchList('Vegan-Free', _vegan,'It includes only Non-veg',
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