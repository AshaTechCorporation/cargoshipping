import 'package:cargoshipping/account/accountPage.dart';
import 'package:cargoshipping/cart/cartPage.dart';
import 'package:cargoshipping/home/homePage.dart';
import 'package:cargoshipping/message/messagePage.dart';
import 'package:cargoshipping/track/trackPage.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentPage = HomePage();

  void onItemSelect(int index) {
    setState(() {
      selectedIndex = index;
      if (selectedIndex == 0) {
        currentPage = HomePage();
      } else if (selectedIndex == 1) {
        currentPage = MessagePage();
      } else if (selectedIndex == 2) {
        currentPage = TrackPage();
      } else if (selectedIndex == 3) {
        currentPage = CartPage();
      } else if (selectedIndex == 4) {
        currentPage = AccountPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: PageStorage(bucket: bucket, child: currentPage),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemSelect,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_work,
                size: 30,
              ),
              label: 'หน้าหลัก'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.sms,
                size: 30,
              ),
              label: 'ข้อความ'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_shipping,
                size: 30,
              ),
              label: 'ติดตามสถานะ'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
              ),
              label: 'รถเข็น'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: 'บัญชี'),
        ],
      ),
    );
  }
}
