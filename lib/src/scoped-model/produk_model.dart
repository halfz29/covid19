import 'package:covid19/src/models/produk_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProdukModel extends Model{
  List<Produk> _produks = [];

  List<Produk> get produks{
    return List.from(_produks);
  }

  void addProduk(Produk produk) async{
    // _produks.add(produk);
    final Map<String, dynamic> produkData = {
      "name": produk.name,
    };
    final http.Response response = await http.post("https://bantuancovid19-3c8ad.firebaseio.com/produks.json", 
    body: json.encode(produkData));

    final Map<String, dynamic> responeData = json.decode(response.body);

    // print(responeData["name"]);
    Produk produkWithID = Produk(
    id: responeData["name"],
    name: produk.name,
    );

  }
  void fetchProduks(){
   http
       .get("https://bantuancovid19-3c8ad.firebaseio.com/produks.json")
       .then((http.Response response){
    //print("Fetching data: ${response.body}");
    final Map<String, dynamic> fetchedData = json.decode(response.body);
    print(fetchedData);

    final List<Produk> produkItems = [];

    fetchedData.forEach((String id, dynamic produkData){
      Produk produkItem = Produk(
        id: id,
        name: produkData["name"],
      );
      produkItems.add(produkItem);
    });

    _produks=produkItems;
    print(_produks);

    // final List<Produk> fetchedProdukItems = [];
    // fetchedData.forEach((data){
    //   Produk produk = Produk(
    //     id: data["id"],
    //     name: data["name"],
    //     imagePath: data["image_path"],
    //   );

    //   //print("Produk Name: ${data['name']}");
    //   fetchedProdukItems.add(produk);
    // });
    // _produks= fetchedProdukItems;
    //print(fetchedProdukItems[0].name);
    });
    
  }
}

