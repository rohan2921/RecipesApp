import 'package:flutter/material.dart';
import 'package:recipies/widgets/meal_item.dart';
import '../widgets/meal_item.dart';

import '../models/meals.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meal';
  final List<Meal> _availableMeals;
  CategoryMealScreen(this._availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  String title;
  List<Meal> ob;
  var _alreadyLoaded=false;
  
  @override
  void didChangeDependencies() {
    if(!_alreadyLoaded) {
    final routArgs =ModalRoute.of(context).settings.arguments as Map<String, String>;
     title = routArgs['title'];
     final String id = routArgs['id'];
     ob = widget._availableMeals.where((meal) {
           return meal.categories.contains(id);
      }).toList();
    _alreadyLoaded=true;
    }
    super.didChangeDependencies();
  }

  void _removeItem(String mealId){
    setState(() {
      ob.removeWhere((test)=> test.id==mealId);
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, ind) {
            return MealItem(
                id: ob[ind].id,
                title: ob[ind].title,
                imageUrl: ob[ind].imageUrl,
                duration: ob[ind].duration,
                affd: ob[ind].affordability,
                comp: ob[ind].complexity,
                removeItem: _removeItem,
                );                
          },
          itemCount: ob.length,
        )
        );
  }
}
