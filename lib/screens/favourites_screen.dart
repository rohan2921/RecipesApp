import 'package:flutter/material.dart';
import 'package:recipies/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final _favourites;
  FavouritesScreen(this._favourites);
  @override
  Widget build(BuildContext context) {
    if(_favourites.isEmpty){
                return Center(
                child: Text('You have not addded any favourites yet.'),
      
    );
    }else{
      return ListView.builder(
          itemBuilder: (ctx, ind) {
            return MealItem(
                id: _favourites[ind].id,
                title: _favourites[ind].title,
                imageUrl: _favourites[ind].imageUrl,
                duration: _favourites[ind].duration,
                affd: _favourites[ind].affordability,
                comp: _favourites[ind].complexity,
                
                );                
          },
          itemCount: _favourites.length,
        );
    }
    
  }
}