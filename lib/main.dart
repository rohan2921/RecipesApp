import 'package:flutter/material.dart';
import './models/meals.dart';
import './dummy_data.dart';
import 'package:recipies/screens/tabs_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail.dart';
import './screens/filters_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Map<String,bool> _filters={
      'gluton': false,
      'lactose':false,
      'vegan':false,
      'vegetarian':false,
    };
    List<Meal> _availableMeals=DUMMY_MEALS;
    void _setFilters(Map<String,bool> newFilters){
      setState(() {
        _filters=newFilters;
        _availableMeals=DUMMY_MEALS.where((meal){
            if(_filters['gluton'] && !meal.isGlutenFree){
                return false;
            } 
            if(_filters['lactose'] && !meal.isLactoseFree) {
              return false;
            }
            if(_filters['vegan'] && !meal.isVegan) {
            return false;

            }
            if(_filters['vegetarian'] && !meal.isVegetarian) {
              return false;
            }
            return true;
        }).toList();
      });
    }
      
    return MaterialApp(
      title: 'Recipies',
      theme: ThemeData(
        primaryColor: Color.fromARGB(0xFF,0x4,0x28,0x40),
        accentColor: Color.fromARGB(0xFF,0xF9,0x9B,0x5B),
        canvasColor: Color.fromARGB(0xFF,0x76,0x82,0x7B),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1:TextStyle(color:Color.fromARGB(0xFF,0x76,0x82,0x7B)),
          body2:TextStyle(color: Color.fromARGB(0xFF,0xF9,0x9B,0x5D)),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            color:Color.fromARGB(0xFF,0xE9,0xEA,0xEA),
          )
        ),
        
        
      ),
    
    
      home: TabsScreen(),
      routes: {
        CategoryMealScreen.routeName: (ctx)=>CategoryMealScreen(_availableMeals),
        MealDetails.routeName:(ctx)=>MealDetails(),
        FilterClass.routeName:(ctx)=>FilterClass(_setFilters,_filters),
      },
      onUnknownRoute: (settings){
          return MaterialPageRoute(builder: (ctx)=>CategoryMealScreen(_availableMeals));
      },
    );
  }
}
