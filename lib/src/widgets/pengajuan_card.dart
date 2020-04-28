

import 'package:flutter/material.dart';

class PengajuanCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Container(
            height: 75,
            width: 45,
            decoration: BoxDecoration(
              border: Border.all(width:2, color: Color(0xFFD3D3D3)),
              borderRadius: BorderRadius.circular(10),
            ),
            child:Column(
              children: <Widget>[
                InkWell(
                  onTap: (){},
                  child: Icon(Icons.keyboard_arrow_up, color: Color(0xFFD3D3D3),),
                  ),
                Text("0", style: TextStyle(fontSize: 18),),
                InkWell(
                  onTap: (){},
                  child: Icon(Icons.keyboard_arrow_down, color: Color(0xFFD3D3D3),),
                ),
              ],
            ),
            ),
            SizedBox(width: 20,),
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage ("assets/images/masker_medis.jpg"),
                  fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                    ),
                  ],              
                ),
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Masker Medis", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5,),
                  
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: (){},
              child: Icon(Icons.cancel, color: Colors.red),
              ),
        ],
        ),
      ),      
    );
  }
}