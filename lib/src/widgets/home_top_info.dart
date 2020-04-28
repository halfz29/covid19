import 'package:flutter/material.dart';

class HomeTopInfo extends StatelessWidget{

  final textStyle = TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold);
  
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Pengajuan Produk", style: textStyle),
              Text("Bantuan COVID 19", style: textStyle,)
            ],
          ),
          Icon(Icons.notifications, size: 30.0, color: Theme.of(context).primaryColor,),
        ],
      ),
    );
  }
}