import 'package:flutter/material.dart';
import '../screens/meal_detail.dart';
import '../models/meals.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Affordability affd;
  final Complexity comp;

  final str = String.fromCharCode(8377);
  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.affd,
    @required this.comp,
   
  });
  String get getComplexity{
      if(Complexity.Simple==comp){
        return 'Simple';
      }else if(Complexity.Challenging==comp){
        return 'Challenfing';
      }else{
        return 'Hard';
      }
  }
  String get getAffordability{
    if(Affordability.Affordable==affd){
        return 'Affordabe';
      }else if(Affordability.Pricey==affd){
        return 'Costly';
      }else{
        return 'Very Costly';
      }

  }
  void _getDetails(BuildContext context){
    Navigator.of(context).pushNamed(MealDetails.routeName,arguments: id);
  }
  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: ()=>_getDetails(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 380,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(Icons.schedule),
                    SizedBox(width: 4,),
                    Text('$duration mins')
                  ],),
                  SizedBox(width: 4,),
                  Row(children: <Widget>[
                    Icon(Icons.work),
                    SizedBox(width: 4,),
                    Text('$getComplexity')
                  ],) ,
                  SizedBox(width: 4,),
                  Row(children: <Widget>[
                    
                    Text('$str $getAffordability')
                  ],)                                 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
