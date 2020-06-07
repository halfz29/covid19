// http://www.mocky.io/v2/5ed75ae33200007e592746e8

import 'package:http/http.dart' show Client;
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';

Client client = Client();




class ApiListDelete {

 static Future<String> apilistdelete(idproduk) async {
   
 
    var url="http://hafidzunalim.com/API/delete_produk.php";
   
    Map data = {
        "id" :idproduk
        
      };
     var bodyPost = json.encode(data);
  
    // print('lihat body dan parse  $url ');
    final response = await client.post(
      "$url",
       headers: {"Content-Type":"application/json"},
       body:bodyPost
    );
   final statusCode = response.statusCode;
   print('lihat status code api delete $statusCode');
    if (statusCode==200) {
        var jsn = json.decode(response.body);
          
            var message = jsn["message"];
            var result = jsn["result"];
            print('lihat result delete message $message');
               Map datarespon = {
                  "status":true,
                  "messages":message,
                  "result":result
                };
                var respons = json.encode(datarespon);
             
            return respons;
    } else {
          var jsn = json.decode(response.body);
            var message = jsn["message"];
            // // print("respont api messages  $message");
              Map datarespon = {
                  "status":false,
                  "messages":message
                };
                var respons = json.encode(response.body);
            
            return respons;
    }

  }


}