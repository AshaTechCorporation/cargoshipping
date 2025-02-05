import 'package:cargoshipping/All_product_categories/allproduct.dart';
import 'package:cargoshipping/account/accountPage.dart';
import 'package:cargoshipping/cart/cartPage.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/homePage.dart';
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
      print(selectedIndex);
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
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: PageStorage(bucket: bucket, child: currentPage),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isKeyboardVisible
          ? null
          : Transform.translate(
              offset: Offset(0, 22),
              child: GestureDetector(
                onTap: () {
                  onItemSelect(2);
                },
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: red1),
                  child: Center(
                    child: Image.asset(
                      'assets/icons/truck.png',
                      // width: 10,
                      height: 35,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              )),
      // : Transform.translate(
      //   offset: Offset(0, 22),
      //   child: FloatingActionButton.large(
      //     backgroundColor: red1,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(60),
      //     ),
      //     onPressed: () {
      //       onItemSelect(2);
      //     },
      //     elevation: 0.0,
      //     child: Image.asset(
      //       'assets/icons/truck.png',
      //       width: 45,
      //       height: 45,
      //     ),
      //   ),
      // ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  onItemSelect(0);
                },
                child: selectedIndex == 0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/Frame 61.png',
                            width: 24,
                            height: 27,
                          ),
                          Text(
                            'หน้าหลัก',
                            style: TextStyle(fontSize: 10, color: red1),
                          )
                        ],
                      )
                    : Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/greymain.png',
                              width: 30,
                              height: 30,
                            ),
                            Text(
                              'หน้าหลัก',
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                      ),
              ),
              SizedBox(
                width: 1,
              ),
              GestureDetector(
                onTap: () {
                  onItemSelect(1);
                },
                child: selectedIndex == 1
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/redgroup.png',
                            width: 30,
                            height: 30,
                          ),
                          Text(
                            'หมวดสินค้า',
                            style: TextStyle(fontSize: 10, color: red1),
                          )
                        ],
                      )
                    : Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/group.png',
                              width: 30,
                              height: 30,
                            ),
                            Text(
                              'หมวดสินค้า',
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                      ),
              ),
              SizedBox(
                width: 50,
              ),
              GestureDetector(
                  onTap: () {
                    onItemSelect(3);
                  },
                  child: selectedIndex == 3
                      ? Column(
                          children: [
                            Image.asset(
                              'assets/icons/redcart.png',
                              width: 30, // Adjust the width as needed
                              height: 30, // Adjust the height as needed
                            ),
                            // Text(
                            //   'รถเข็น',
                            //   style: TextStyle(color: red1),
                            // )
                          ],
                        )
                      : Column(
                          children: [
                            Image.asset(
                              'assets/icons/shipping.png',
                              width: 30, // Adjust the width as needed
                              height: 30, // Adjust the height as needed
                            ),
                            // Text(
                            //   'รถเข็น',
                            //   style: TextStyle(),
                            // )
                          ],
                        )),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                  onTap: () {
                    onItemSelect(3);
                  },
                  child: selectedIndex == 3
                      ? Column(
                          children: [
                            Image.asset(
                              'assets/icons/redcart.png',
                              width: 30, // Adjust the width as needed
                              height: 30, // Adjust the height as needed
                            ),
                            Text(
                              'รถเข็น',
                              style: TextStyle(color: red1, fontSize: 10),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            Image.asset(
                              'assets/icons/addtocart.png',
                              width: 30, // Adjust the width as needed
                              height: 30, // Adjust the height as needed
                            ),
                            Text(
                              'รถเข็น',
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        )),
              SizedBox(
                width: 35,
              ),
              GestureDetector(
                  onTap: () {
                    onItemSelect(4);
                  },
                  child: selectedIndex == 4
                      ? Column(
                          children: [
                            Image.asset(
                              'assets/icons/reduser.png',
                              width: 30, // Adjust the width as needed
                              height: 30, // Adjust the height as needed
                            ),
                            Text(
                              'บัญชี',
                              style: TextStyle(color: red1, fontSize: 10),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            Image.asset(
                              'assets/icons/user.png',
                              width: 30, // Adjust the width as needed
                              height: 30, // Adjust the height as needed
                            ),
                            Text(
                              'บัญชี',
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        )),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
