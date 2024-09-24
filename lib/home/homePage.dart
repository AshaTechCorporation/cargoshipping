import 'dart:developer';
import 'package:cargoshipping/Itempage/itempage.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/detailproduct.dart';
import 'package:cargoshipping/home/importproductlistpage.dart';
import 'package:cargoshipping/home/services/homeApi.dart';
import 'package:cargoshipping/home/widgets/OurItem.dart';
import 'package:cargoshipping/home/widgets/OurServicesWidget.dart';
import 'package:cargoshipping/home/widgets/Servicedetail.dart';
import 'package:cargoshipping/home/widgets/carimportrate.dart';
import 'package:cargoshipping/home/widgets/correctimportpage.dart';
import 'package:cargoshipping/home/widgets/importrate.dart';
import 'package:cargoshipping/home/widgets/importwidget.dart';
import 'package:cargoshipping/home/widgets/paperless.dart';
import 'package:cargoshipping/home/widgets/payment.dart';
import 'package:cargoshipping/home/widgets/searchshowpage.dart';
import 'package:cargoshipping/home/widgets/shippingcalpage.dart';
import 'package:cargoshipping/home/widgets/shippingimportrate.dart';
import 'package:cargoshipping/home/widgets/tegmallpage.dart';
import 'package:cargoshipping/models/categories.dart';
import 'package:cargoshipping/widgets/LoadingDialog.dart';
import 'package:cargoshipping/home/widgets/ProductCategories.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Categories> categories = [];
  final ScrollController _scrollController = ScrollController();
  double appBarOpacity = 0.0;
  Color searchBarColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getlistCategories(name: items[0]);
    });
    // เพิ่ม Listener เพื่อตรวจจับการเลื่อน
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      double newOpacity =
          (offset / 150).clamp(0.0, 1.0); // ปรับค่า 150 ตามต้องการ

      if (newOpacity != appBarOpacity) {
        setState(() {
          appBarOpacity = newOpacity;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  //ดึงข้อมูล api Category
  Future<void> getlistCategories({required String name}) async {
    try {
      LoadingDialog.open(context);
      final _categories = await HomeApi.getCategories(name: name);
      if (!mounted) return;

      setState(() {
        categories = _categories;
      });
      inspect(categories);
      LoadingDialog.close(context);
    } on Exception catch (e) {
      if (!mounted) return;
      LoadingDialog.close(context);
      print(e);
    }
  }

  final List<String> items = [
    'taobao',
    '1688',
  ];
  String selectedValue = 'taobao';
  // Country? _selectedCountry;
  String selectedLanguage = 'ไทย';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.072),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          child: AppBar(
            backgroundColor: Colors.red.withOpacity(appBarOpacity),
            elevation: appBarOpacity > 0.5 ? 4.0 : 0.0,
            title: Padding(
              padding: EdgeInsets.only(top: size.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: size.height * 0.045,
                    width: size.width * 0.83,
                    padding: EdgeInsets.all(size.height * 0.005),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey, width: size.width * 0.001),
                      borderRadius: BorderRadius.circular(15),
                      color: Color.lerp(
                          Colors.transparent, Colors.white, appBarOpacity),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width * 0.33,
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'ค้นหาสินค้า',
                                hintStyle: TextStyle(),
                                contentPadding: EdgeInsets.only(
                                    left: size.width * 0.02,
                                    bottom: size.height * 0.01),
                              ),
                            ),
                          ),
                          Image.asset('assets/icons/cam.png'),
                          SizedBox(
                            height: size.height * 0.05,
                            width: size.width * 0.225,
                            child: DropdownButtonHideUnderline(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.01),
                                  child: DropdownButton2<String>(
                                    isExpanded: true,
                                    hint: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'เลือกสินค้า',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: red1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    items: items
                                        .map((String item) =>
                                            DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: TextStyle(
                                                    fontSize: 14, color: red1),
                                              ),
                                            ))
                                        .toList(),
                                    value: selectedValue,
                                    onChanged: (String? value) {
                                      setState(() {
                                        selectedValue = value!;
                                      });
                                      getlistCategories(name: selectedValue);
                                    },
                                    buttonStyleData: ButtonStyleData(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.02),
                                      width: size.width * 0.1,
                                    ),
                                    menuItemStyleData: MenuItemStyleData(
                                      height: size.height * 0.1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.001,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Searchshowpage()));
                            },
                            child: Container(
                              height: size.height * 0.05,
                              width: size.width * 0.164,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: red1,
                              ),
                              child: Center(
                                child: Text(
                                  'ค้นหา',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.003),
                    child: GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(
                            details.globalPosition.dx,
                            details.globalPosition.dy + 25,
                            MediaQuery.of(context).size.width -
                                details.globalPosition.dx -
                                10,
                            0,
                          ),
                          items: <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: 'ไทย',
                              child: SizedBox(
                                width: size.width * 0.099,
                                child: Row(
                                  children: [
                                    // Image.asset('assets/icons/thai.png',
                                    //     height: 20),
                                    SizedBox(width: size.width * 0.01),
                                    Text(
                                      'ไทย',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: 'English',
                              child: Row(
                                children: [
                                  // Image.asset('assets/icons/usa.png', height: 20), ธงสหรัฐ
                                  // SizedBox(width: size.width * 0.01),
                                  Text(
                                    'English',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: '汉语',
                              child: Row(
                                children: [
                                  // Image.asset('assets/icons/china.png', height: 20), ธงจีน
                                  // SizedBox(width: size.width * 0.01),
                                  Text(
                                    '汉语',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          elevation: 8.0,
                        ).then((value) {
                          if (value != null) {
                            setState(() {
                              selectedLanguage = value;
                            });
                          }
                        });
                      },
                      child: Image.asset('assets/icons/thai.png',
                          height: size.height * 0.032),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.2,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/messageimages.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * (-30 / 800),
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ...List.generate(
                            importwidget.length,
                            (index) => Importwidget(
                              size: size,
                              title: importwidget[index]['name'],
                              imagePath: importwidget[index]['images'],
                              id: importwidget[index]['id'],
                              press: () {
                                if (index == 0) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Paperless(),
                                    ),
                                  );
                                }
                                if (index == 1) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Tegmallpage(),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.06,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  child: Text(
                    'บริการของเรา',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(titleData.length, (index) {
                return SizedBox(
                  width: size.width * 0.21,
                  child: OurServicesWidget(
                    size: size,
                    title: titleData[index],
                    press: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Servicedetail(
                              title: titleData[index],
                            ),
                          ),
                        );
                      }
                      if (index == 1) {}
                      if (index == 6) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShippingCalculatorPage(),
                          ),
                        );
                      }
                      if (index == 7) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Importrate(),
                          ),
                        );
                      }
                    },
                    imagespath: Imgservice[index],
                  ),
                );
              }),
            ),
            Padding(
              padding: EdgeInsets.all(size.height * 0.021),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'อัตราเงินประจำวันที่...',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: headingtext),
                      ),
                      SizedBox(
                        width: size.width * 0.04,
                      ),
                      Text(
                        '22 สิงหาคม 2567',
                        style: TextStyle(
                            color: red1,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  Row(
                    children: List.generate(
                        payment.length,
                        (index) => Payment(
                              size: size,
                              press: () {},
                              imagespath: payment[index],
                            )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '*อัตราเงินอาจมีการเปลี่ยนแปลง บริษัทขอสงวนสิทธิ์ในการไม่แจ้งให้ทราบล่วงหน้า',
                      style: TextStyle(
                          fontSize: 10,
                          color: headingtext,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * 0.1,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Color(0xfffed2cb),
                    Color(0xfffb4a30),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'รหัสผู้นำเข้า: ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '${importcard[0]['Importercode']}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'ส่งทางรถ: ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '${importcard[0]['Sendbycar']}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'ส่งทางเรือ: ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '${importcard[0]['Sendbyboat']}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              width: size.width * 0.93,
              height: size.height * 0.42,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ที่อยู่รับพัสดุ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: headingtext,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  SizedBox(
                    height: size.height * 0.19,
                    width: size.width * 0.93,
                    // color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: 'คลังกวางโจว :',
                                style: TextStyle(
                                    color: red1,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                                children: <TextSpan>[
                              TextSpan(
                                text:
                                    ' TEG CARGO仓 广东省广州市白云区唐阁上村中街28号3栋105A仓 邮编510450',
                                style:
                                    TextStyle(color: headingtext, fontSize: 15),
                              )
                            ])),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        RichText(
                            text: TextSpan(
                                text: 'เบอร์โทรศัพท์ :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                                children: <TextSpan>[
                              TextSpan(
                                text: ' 18520290139啊苏',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15),
                              )
                            ])),
                        SizedBox(
                          height: size.height * 0.018,
                        ),
                        Center(
                          child: SizedBox(
                            height: size.height * 0.042,
                            width: size.width * 0.3,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: red1,
                                  side: BorderSide(
                                      color: red1, width: size.width * 0.004),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13))),
                              onPressed: () {
                                Clipboard.setData(
                                  ClipboardData(
                                      text: 'ที่อยู่ที่ต้องการคัดลอก'),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('คัดลอกที่อยู่เรียบร้อยแล้ว')),
                                );
                              },
                              child: Text(
                                'คัดลอกที่อยู่',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    height: size.height * 0.19,
                    width: size.width * 0.93,
                    // color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: 'คลังอี้อู :',
                                style: TextStyle(
                                    color: red1,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                                children: <TextSpan>[
                              TextSpan(
                                text:
                                    ' TEG CARGO仓 浙江省义乌市稠城街道江北下朱货运市场一栋231-232号 邮编322023',
                                style:
                                    TextStyle(color: headingtext, fontSize: 15),
                              )
                            ])),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        RichText(
                            text: TextSpan(
                                text: 'เบอร์โทรศัพท์ :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                                children: <TextSpan>[
                              TextSpan(
                                text: ' 18520290139',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15),
                              )
                            ])),
                        SizedBox(
                          height: size.height * 0.018,
                        ),
                        Center(
                          child: SizedBox(
                            height: size.height * 0.042,
                            width: size.width * 0.3,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: red1,
                                  side: BorderSide(
                                      color: red1, width: size.width * 0.004),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13))),
                              onPressed: () {
                                Clipboard.setData(
                                  ClipboardData(
                                      text: 'ที่อยู่ที่ต้องการคัดลอก'),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('คัดลอกที่อยู่เรียบร้อยแล้ว')),
                                );
                              },
                              child: Text(
                                'คัดลอกที่อยู่',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Carimportratewidget(size: size),
            SizedBox(
              height: size.height * 0.01,
            ),
            Shippingimportratewidget(size: size),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Image.asset('assets/images/16.png'),
                  Positioned(
                      top: size.height * 0.12,
                      left: size.width * 0.05,
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'ประเภท ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'C',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.37,
                          ),
                          Text(
                            '00',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.18,
                          ),
                          Text(
                            '00',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )),
                      Positioned(
                        top: size.height * 0.155,
                        left: size.width * 0.05,
                        child: Row(
                        children: [
                          Text('สินค้ามาตราฐาน',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black
                          ),)
                        ],
                      )),
                      Positioned(
                      top: size.height * 0.185,
                      left: size.width * 0.05,
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'ประเภท ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'D',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.37,
                          ),
                          Text(
                            '00',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.18,
                          ),
                          Text(
                            '00',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )),
                      Positioned(
                        top: size.height * 0.22,
                        left: size.width * 0.05,
                        child: Row(
                        children: [
                          Text('สินค้ามาตราฐาน',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black
                          ),)
                        ],
                      )),
                      Positioned(
                      top: size.height * 0.06,
                      left: size.width * 0.05,
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'ประเภท ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'A',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.37,
                          ),
                          Text(
                            '00',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.18,
                          ),
                          Text(
                            '00',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )),
                      Positioned(
                        top: size.height * 0.095,
                        left: size.width * 0.05,
                        child: Row(
                        children: [
                          Text('สินค้าทั่วไป',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black
                          ),)
                        ],
                      )),
                      Positioned(
                      top: size.height * 0.258,
                      left: size.width * 0.05,
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'ประเภท ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'B',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.37,
                          ),
                          Text(
                            '00',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.18,
                          ),
                          Text(
                            '00',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )),
                      Positioned(
                        top: size.height * 0.29,
                        left: size.width * 0.05,
                        child: Row(
                        children: [
                          Text('สินค้าอื่นๆ',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black
                          ),)
                        ],
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02, horizontal: size.width * 0.035),
              child: Row(
                children: [
                  Text(
                    'หมวดหมู่สินค้า',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(),
                  Text(
                    'หมวดหมู่ทั้งหมด',
                    style: TextStyle(
                        fontSize: 12, color: red1, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            // categories.isEmpty
            //     ? SizedBox()
            //     : Wrap(
            //         spacing: 10,
            //         runSpacing: 10,
            //         children: List.generate(
            //           categories.length,
            //           (index) => ProductCategories(
            //             size: size,
            //             title: categories[index].name!,
            //             press: () {
            //               Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) => Detailproduct(
            //                             productid: categories[index],
            //                           )));
            //             },
            //             imagespath: 'assets/images/noimages.jpg',
            //           ),
            //         ),
            //       ),
            categories.isEmpty
                ? SizedBox()
                : SizedBox(
                    height: size.height * 0.31,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return ProductCategories(
                          size: size,
                          title: categories[index].name!,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Detailproduct(
                                  categories: categories[index],
                                ),
                              ),
                            );
                          },
                          imagespath: 'assets/images/noimages.jpg',
                        );
                      },
                    ),
                  ),
            // Wrap(
            //   spacing: 15,
            //   runSpacing: 10,
            //   children: List.generate(
            //     catagoryrecom.length,
            //     (index) => ConstrainedBox(
            //       constraints: BoxConstraints(
            //         maxWidth: (size.width - 15 * 3) / 4,
            //       ),
            //       child: ProductCategories(
            //         size: size,
            //         title: catagoryrecom[index],
            //         press: () {
            //           if (index == 0) {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) =>
            //                     EachCategory(category: 'เสื้อผ้าลดราคา'),
            //               ),
            //             );
            //           }
            //         },
            //         imagespath: catagoryimg[index],
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02, horizontal: size.width * 0.035),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                        text: TextSpan(
                            text: 'สินค้าแนะนำ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            children: <TextSpan>[
                          TextSpan(
                            text: ' จาก 1668',
                            style: TextStyle(
                                color: red1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ])),
                  ),
                ],
              ),
            ),
            Wrap(
              spacing: 20,
              runSpacing: 10,
              children: List.generate(
                  listProducts.length,
                  (index) => Ouritem(
                        image: listProducts[index]['image'],
                        sale: listProducts[index]['sale'],
                        send: listProducts[index]['send'],
                        size: MediaQuery.of(context).size,
                        price: (listProducts[index]['price'] as num).toDouble(),
                        detail: listProducts[index]['detail'],
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => itempage(
                                size: size,
                                title: listProducts[index]['detail'],
                                price: (listProducts[index]['price'] as num)
                                    .toDouble(),
                                products: listProducts[index],
                                press: () {},
                              ),
                            ),
                          );
                        },
                      )),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
// Widget _buildMenuItem(String language, String flag) {
//   return Row(
//     children: [
//       Text(flag, style: TextStyle(fontSize: 20)), // ใช้ emoji ธงชาติ
//       SizedBox(width: 10),
//       Text(language),
//     ],
//   );
// }

// ฟังก์ชันแสดงธงชาติที่เลือก
Widget _buildFlagIcon(String language) {
  String flag;
  switch (language) {
    case 'ไทย':
      flag = '🇹🇭'; // ธงไทย
      break;
    case 'English':
      flag = '🇺🇸'; // ธงสหรัฐ
      break;
    case '汉语':
      flag = '🇨🇳'; // ธงจีน
      break;
    default:
      flag = '🇹🇭'; // ค่าเริ่มต้น (ธงไทย)
  }
  return Text(flag, style: TextStyle(fontSize: 30));
}
