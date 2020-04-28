import 'package:flutter/material.dart';
import '../widgets/pengajuan_card.dart';
import 'signin_page.dart';

class PengajuanPage extends StatefulWidget {
  @override
  _PengajuanPageState createState() => _PengajuanPageState();
}

class _PengajuanPageState extends State<PengajuanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Pengajuan", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        ),
          body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.vertical,
          children: <Widget>[
           PengajuanCard(),
           PengajuanCard(),
           PengajuanCard(),
           PengajuanCard(),
           PengajuanCard(),
           PengajuanCard(),
           PengajuanCard(),
          ],
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