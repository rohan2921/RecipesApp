import 'package:flutter/material.dart';
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
        CategoryMealScreen.routeName: (ctx)=>CategoryMealScreen(),
        MealDetails.routeName:(ctx)=>MealDetails(),
        FilterClass.routeName:(ctx)=>FilterClass(),
      },
      onUnknownRoute: (settings){
          return MaterialPageRoute(builder: (ctx)=>CategoryMealScreen());
      },
    );
  }
}
