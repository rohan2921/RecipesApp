import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';
class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  CategoryItem(this.id,this.title, this.color);
  void _selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName,arguments: {'title':title,'id':id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> _selectCategory(context),
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
