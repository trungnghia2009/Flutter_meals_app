import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String image;
  CategoryItem({
    @required this.id,
    @required this.title,
    @required this.color,
    @required this.image,
  });

  void _selectCategory(BuildContext context) {
    // TODO: pushNamed method can pass arguments to destination screen
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
            // TODO: learn new about LinearGradient
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  color: Colors.black54,
                ),
                height: 30,
                width: 150,
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Widget build(BuildContext context) {
//  return InkWell(
//    onTap: () {
//      _selectCategory(context);
//    },
//    splashColor: Theme.of(context).primaryColor,
//    borderRadius: BorderRadius.circular(15),
//    child: Container(
//      padding: EdgeInsets.all(15),
//      decoration: BoxDecoration(
//        // TODO: learn new about LinearGradient
//          gradient: LinearGradient(
//            colors: [color.withOpacity(0.7), color],
//            begin: Alignment.topLeft,
//            end: Alignment.bottomRight,
//          ),
//          borderRadius: BorderRadius.circular(15)),
//      child: Text(
//        title,
//        style: Theme.of(context).textTheme.title,
//      ),
//    ),
//  );
//}
