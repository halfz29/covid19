import 'package:covid19/src/admin/pages/add_produk_item.dart';
import 'package:covid19/src/scoped-model/main_model.dart';
import 'package:flutter/material.dart';
import 'package:covid19/src/scoped-model/produk_model.dart';
import 'screens/main_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class App extends StatelessWidget {

  final MainModel mainModel = MainModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: mainModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Pengajuan Bantuan COVID 19",
        theme: ThemeData(primaryColor: Colors.blueAccent),
         home: MainScreen(model: mainModel),
        // home: AddProdukItem(),
      ),
    );
  }
}
