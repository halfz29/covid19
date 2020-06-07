
import 'package:covid19/src/scoped-model/main_model.dart';
import 'package:covid19/src/scoped-model/produk_model.dart';
import 'package:covid19/src/widgets/daftar_produk.dart';
import 'package:covid19/src/widgets/produk_category.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../widgets/home_top_info.dart';
import '../widgets/produk_category.dart';
import '../widgets/search_field.dart';
import '../widgets/daftar_produk.dart';
import '../models/produk_model.dart';

class HomePage extends StatefulWidget {
  // final ProdukModel produkModel;
  // HomePage(this.produkModel);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

//List<Produk> _produks = produks;
@override
void initState(){
  // widget.produkModel.fetchProduks();
  super.initState();
}

  final textStyle = TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: ListView(
      padding: EdgeInsets.only(top: 20, right: 20),
      children: <Widget>[
        HomeTopInfo(),
        ProdukCategory(),
        SearchField(),
        SizedBox(height: 20),
        ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
            model.fetchProduks();
            List<Produk> produks=model.produks;
            // return Column(
            //   children: model.produks.map((Produk produk){
            //     return _buildProdukItems(
            //       produk.name.toString(),
            //     );
            //   }
            //   )
            // );
          },
          ),
        //DaftarProduk(),
        // Column(
        //   children: widget.produkModel.produks.map(_buildProdukItems).toList(),
        // ), 
      ],
    ), 
    );
  }


Widget _buildProdukItems(Produk produk){
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    child: DaftarProduk(
      id: produk.id,
      name: produk.name,
      imagePath: produk.imagePath,
    ),
    );
}
}