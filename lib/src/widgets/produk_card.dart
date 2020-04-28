import 'package:flutter/material.dart';

class ProdukCard extends StatelessWidget {
  final String categoryName;
  final String imagePath;

  ProdukCard({this.categoryName, this.imagePath});

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: <Widget>[
              Image(
                image: AssetImage(imagePath),
                height: 65,
                width: 65,
              ),
              SizedBox(width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(categoryName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}