import 'package:cargoshipping/All_product_categories/allproduct.dart';
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
        currentPage = Allproduct();
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
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemSelect,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/Frame 61.png',
                width: 24, // Adjust the width as needed
                height: 27, // Adjust the height as needed
              ),
              label: 'หน้าหลัก'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/group.png',
                width: 29, // Adjust the width as needed
                height: 30, // Adjust the height as needed
              ),
              label: 'หมวดสินค้า'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/truck.png',
                width: 31, // Adjust the width as needed
                height: 48, // Adjust the height as needed
              ),
              label: 'ติดตามสถานะ'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/shipping.png',
                width: 30, // Adjust the width as needed
                height: 30, // Adjust the height as needed
              ),
              label: 'รถเข็น'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/user.png',
                width: 27, // Adjust the width as needed
                height: 27, // Adjust the height as needed
              ),
              label: 'บัญชี'),
        ],
      ),
    );
  }
}
