import 'dart:convert';

import 'package:covid19/src/api/pengajuan/list_delete_api.dart';
import 'package:covid19/src/api/pengajuan/list_pengajuan_api.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../widgets/pengajuan_card.dart';
import 'signin_page.dart';

RefreshController _scrollController =  RefreshController(initialRefresh: false);

List listpengajuan=[];

class PengajuanPage extends StatefulWidget {
  @override
  _PengajuanPageState createState() => _PengajuanPageState();
}

class _PengajuanPageState extends State<PengajuanPage> {

  void getapipengajuan()async{
    listpengajuan.clear();
    print('masuk k get api');
      ApiListPesanan.apilistpesanan().then((rst) async {
          // var jsn = json.decode(response.body);
          var resultdt = json.decode(rst);
          // print('lihat result apipengajuan $resultdt');
          final messages = resultdt['messages'];
          final status = resultdt['status'];
          final result = resultdt['result'];

           if(status==true){ 
              if(mounted){
               
                setState(() {
                  listpengajuan.addAll(result);


                });
              }
            
          }else{
            setState(() {
             if(mounted){
                if(mounted){
                

                }

              }
            });
           }
 
        });
    
    }

    void deleteproduk(idproduk)async{
    print('masuk k get api id produk $idproduk');
      ApiListDelete.apilistdelete(idproduk).then((rst) async {
          // var jsn = json.decode(response.body);
          var resultdt = json.decode(rst);
          print('lihat result apipengajuan $resultdt');
          final messages = resultdt['messages'];
          final status = resultdt['status'];
          final result = resultdt['result'];

           if(status==true){ 
              if(mounted){
               
                setState(() {
                 getapipengajuan();


                });
              }
            
          }else{
            setState(() {
             if(mounted){
                if(mounted){
                

                }

              }
            });
           }
 
        });
    
    }


@override
  void initState(){
    // listpengajuan.clear();
    getapipengajuan();
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Widget _cardList(id,nama,gambar){
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
              child: Image.network(gambar),
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(nama, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5,),
                  
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: (){
                  deleteproduk(id);
                },
              child: Icon(Icons.cancel, color: Colors.red),
              ),
        ],
        ),
      ),      
    );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Pengajuan", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        ),
        body:Container(
          child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: WaterDropHeader(
            
          ),
          footer: CustomFooter(
          builder: (BuildContext context,LoadStatus mode){
            Widget body ;
            if(mode==LoadStatus.idle){
              body =  Container();
            }
            else if(mode==LoadStatus.loading){
              body =  Container(
                      height:20,
                      width: 20,
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.red)),
                    
                    
                  
                );
            }
            else if(mode == LoadStatus.failed){
              body = Text("Load Failed!Click retry!");
            }
            else{
              body = Container(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.red)),
              );
            }
            // return shimerdt;
            return Container(
              height:20,
              child: Align(
                alignment: Alignment.topCenter,
                child:body),
            );
          },
        ),
          controller: _scrollController,
          onRefresh: null,
          onLoading: null,
          child:CustomScrollView(
              slivers: <Widget>[

                SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      var id =listpengajuan[index]['id_produk'] ?? 0;
                      var nama =listpengajuan[index]['nama'] ?? '-';
                      var gambar =listpengajuan[index]['gambar'] ?? 'https://image.shutterstock.com/image-vector/no-image-available-sign-absence-260nw-373243873.jpg';
                     return _cardList(id,nama,gambar);
                    },
                    childCount: listpengajuan.length,
                )
              )
            ]
          )
            
          //   ListView(
          //   padding: EdgeInsets.symmetric(horizontal: 10),
          //   scrollDirection: Axis.vertical,
          //   children: <Widget>[
          //    PengajuanCard(),
          //    PengajuanCard(),
          //    PengajuanCard(),
          //    PengajuanCard(),
          //    PengajuanCard(),
          //    PengajuanCard(),
          //    PengajuanCard(),
          //   ],
          // ),
          ),
        ),
        bottomNavigationBar:  _buildTotalContainer(),
    );
  }
  Widget _buildTotalContainer(){
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      

      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignInPage()));
            },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  "Kirim ke Tim SATGAS COVID-19",
                  style: TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    ),
                ),
                ),
            ),
          ),
        ],  
      ),
      );
  }
}