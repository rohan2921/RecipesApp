import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetails extends StatelessWidget {

  final Function _favourites;
  final Function _isMealFavourite;
  MealDetails(this._favourites,this._isMealFavourite);

  static const routeName = '/meal-details';
  Widget _buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        color: Colors.white,
      ),
      height: 200,
      width: 225,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final ob = DUMMY_MEALS.firstWhere((val) => val.id == id);
    return Scaffold(
        appBar: AppBar(title: Text('${ob.title}')),
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 300,
                width: double.infinity,
                child: Image.network(
                  ob.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                child: Text('Ingredients',
                    style: Theme.of(context).textTheme.title),
              ),
              SizedBox(height: 4),
              _buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, ind) => Card(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Text(ob.ingredients[ind])),
                  ),
                  itemCount: ob.ingredients.length,
                ),
              ),
              SizedBox(height: 4),
              Container(
                child: Text('Steps', style: Theme.of(context).textTheme.title),
              ),
              SizedBox(height: 4),
              _buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, ind) => Card(
                    color: Theme.of(context).primaryColor,
                    child: ListTile(
                      
                      leading: CircleAvatar(child: Text('${ind + 1}'),
                      backgroundColor: Theme.of(context).accentColor,),
                      title: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          child: Text(ob.steps[ind]), ),
                    ),
                  ),
                  itemCount: ob.steps.length,
                ),
                
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
                    child: Icon(
                      _isMealFavourite(id)? Icons.star:Icons.star_border,
                    ),
                    onPressed: ()=>_favourites(id),
                   ),
        );    
        
  }
}
