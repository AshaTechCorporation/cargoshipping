import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/track/correctimportpage.dart';
import 'package:cargoshipping/track/transportpage.dart';
import 'package:flutter/material.dart';
import 'package:cargoshipping/track/allhistorypage.dart';
import 'package:cargoshipping/track/palceanorderpage.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late PageController _pageController;

  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(length: 4, vsync: this);
  //   _tabController?.addListener(() {
  //     setState(() {
  //       selectedIndex = _tabController!.index;
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   _tabController?.dispose();
  //   super.dispose();
  // }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ตรวจสอบว่า _tabController ไม่เป็น null
    // if (_tabController == null) {
    //   return Scaffold(
    //     backgroundColor: background,
    //     body: Center(child: CircularProgressIndicator()),
    //   );
    // }

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'ติดตามสถานะ',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        toolbarHeight: size.height * 0.1,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(90.0),
          child: Column(
            children: [
              Container(
                width: size.width * 0.95,
                height: size.height * 0.04,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: greyuserinfo, width: 0.5)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'ค้นหาเลข Tracking, Order, Container ',
                          hintStyle: TextStyle(
                              fontSize: 13,
                              color: greyuserinfo,
                              fontWeight: FontWeight.bold),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              bottom: size.height * 0.018,
                              left: size.width * 0.03),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: size.height * 0.037,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: red1,
                          ),
                          child: Center(
                            child: Text(
                              'ค้นหา',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.01),
                  child: Row(
                    children: [
                      buildTabItem(0, 'ฝากส่ง'),
                      buildTabItem(1, 'ขนส่ง'),
                      buildTabItem(2, 'นำเข้าถูกต้อง'),
                      Container(
                        height: size.height * 0.03,
                        width: size.width * 0.0015,
                        color: greyuserinfo,
                      ),
                      buildTabItem(3, 'ประวัติทั้งหมด'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: [
          Palceanorderpage(),
          Transporttrackpage(),
          Correctimporttrackpage(),
          Allhistorypage(),
        ],
      ),
    );
  }

  Widget buildTabItem(int index, String title) {
    final size = MediaQuery.of(context).size;
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
         _pageController.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.height * 0.01),
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.008),
        decoration: BoxDecoration(
          color: isSelected ? red1 : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: greymess),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : headingtext,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
