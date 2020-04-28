import 'package:flutter/material.dart';

class DaftarProduk extends StatefulWidget {
  final String id;
  final String name;
  final String imagePath;

  DaftarProduk({this.id, this.name, this.imagePath});

  @override
  _DaftarProdukState createState() => _DaftarProdukState();
}

class _DaftarProdukState extends State<DaftarProduk> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 200,
          width: 340,
          child: Image.asset(widget.imagePath),
        ),
        Positioned(
          left: 10,
          bottom: 0,
          child : Container(
            height: 60,
            width: 340,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black, Colors.black12
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter
              )
            ),
          ),
        ),
        Positioned(
          left: 10,
          bottom: 10,
          right: 10,
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      ),
                  ),
                  
                ],
              ),
            ],
          ),
        ), 
      ],
    );
  }
}