import 'package:covid19/src/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:covid19/src/models/produk_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:covid19/src/scoped-model/main_model.dart';
import 'dart:io';

class AddProdukItem extends StatefulWidget {
  AddProdukItem({Key key}) : super(key:key);
  
  @override
  _AddProdukItemState createState() => _AddProdukItemState();

}

class _AddProdukItemState extends State<AddProdukItem> {

  String name;

  GlobalKey<FormState> _produkItemFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Button(btnText: "Add Produk Item"),
          body: SingleChildScrollView(
              child: Container(
              padding: EdgeInsets.symmetric(vertical: 60, horizontal:16),
              // width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              child: Form(
                key: _produkItemFormKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      width: MediaQuery.of(context).size.width,
                      height: 170,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("assets/images/noimage.png"), 
                          ),
                        ),
                    ),
                    _buildTextFormField("Produk Name"),
                    SizedBox(height: 100,
                    ),
                    ScopedModelDescendant(
                      builder:
                      (BuildContext context, Widget child, MainModel model){
                        return GestureDetector(
                      onTap: (){
                        if(_produkItemFormKey.currentState.validate()){
                          _produkItemFormKey.currentState.save();

                          // print("The Produk Name: $name");
                          final Produk produk=Produk(
                            name: name,
                          );
                          model.addProduk(produk);
                        }
                      },
                      child: Button(btnText: "Add Produk Item"),
                      );
                    },
                    ),
                  ],
                ),
              ),
      ),
          ),
    );
  }
  Widget _buildTextFormField(String hint,{int maxLine=1}){
    return TextFormField(
      decoration: InputDecoration(hintText: "$hint"),
      validator: (String value){
        // var errorMsg = "";
        if(value.isEmpty && hint == "Produk Name"){
          return "The Produk Name is Required";
        }
        // return errorMsg;
      },

        onChanged: (String value){
          if(hint == "Produk Name"){
            name = value;
          }
        },
      );
  }
}