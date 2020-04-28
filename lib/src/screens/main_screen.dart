import 'package:covid19/src/pages/profile_page.dart';
import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/pengajuan_page.dart';
import '../pages/profile_page.dart';
import 'package:covid19/src/scoped-model/produk_model.dart';
import 'package:covid19/src/scoped-model/main_model.dart';

class MainScreen extends StatefulWidget {

  final MainModel model;
  
  MainScreen({this.model});


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

int currentTabIndex=0;

List<Widget> pages;
Widget currentPage;

HomePage homePage;
PengajuanPage pengajuanPage;
ProfilePage profilePage;

@override
  void initState() {
   widget.model.fetchProduks();
    //widget.produkModel.fetchProduks();
    homePage = HomePage();
    pengajuanPage = PengajuanPage();
    profilePage = ProfilePage();
    
    pages = [homePage, pengajuanPage, profilePage];

    super.initState();
    currentPage = homePage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            title: Text("HOME"),
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_mall),
            title: Text("PENGAJUAN") 
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text("MY ACCOUNT"), 
            ),
        ],
        ),
        body: currentPage,
    );
  }
}