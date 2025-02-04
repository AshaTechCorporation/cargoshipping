import 'dart:developer';
import 'package:cargoshipping/Itempage/itempage.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/detailproduct.dart';
import 'package:cargoshipping/home/services/homeApi.dart';
import 'package:cargoshipping/home/widgets/OurItem.dart';
import 'package:cargoshipping/home/widgets/ProductCategories.dart';
import 'package:cargoshipping/models/categories.dart';
import 'package:cargoshipping/widgets/LoadingDialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class Tegmallpage extends StatefulWidget {
  const Tegmallpage({super.key});

  @override
  State<Tegmallpage> createState() => _TegmallpageState();
}

class _TegmallpageState extends State<Tegmallpage> {
  List<Categories> categories = [];
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getlistCategories(name: items[0]);
    });
  }

  Future<void> getlistCategories({required String name}) async {
    try {
      LoadingDialog.open(context);
      final _categories = await HomeApi.getCategories(name: name);
      if (!mounted) return;

      setState(() {
        categories = _categories;
      });
      //inspect(categories);
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
  String selectedLanguage = 'ไทย';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.115),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: background,
            flexibleSpace: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          'ฝากสั่ง',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: size.height * 0.045,
                          width: size.width * 0.85,
                          padding: EdgeInsets.all(size.height * 0.005),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: size.width * 0.001),
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                          ),
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: size.width * 0.33,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'ค้นหาสินค้า',
                                      hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                      contentPadding: EdgeInsets.only(left: size.width * 0.02, bottom: size.height * 0.017),
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
                                        border: Border.all(color: Colors.white, width: 2),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
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
                                              .map((String item) => DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: TextStyle(fontSize: 14, color: red1),
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
                                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
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
                                    //เมื่อกด ค้นหา จะแสดงสินค้า ไม่ได้ไปหน้าอื่น
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
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.003),
                          child: GestureDetector(
                            onTapDown: (TapDownDetails details) {
                              showMenu(
                                context: context,
                                position: RelativeRect.fromLTRB(
                                  details.globalPosition.dx,
                                  details.globalPosition.dy + 25,
                                  MediaQuery.of(context).size.width - details.globalPosition.dx - 10,
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
                            child: Image.asset('assets/icons/thai.png', height: size.height * 0.032),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: size.height * 0.17,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: imgList
                  .map((item) => Center(
                        child: Image.network(
                          item,
                          fit: BoxFit.fill,
                          width: size.width * 0.87,
                          height: size.height * 0.17,
                          errorBuilder: (context, error, stackTrace) => Image.asset(
                            width: size.width * 0.87,
                            height: size.height * 0.17,
                            'assets/images/logofull.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ))
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  // onTap: () => _onDotTapped(entry.key),
                  child: Container(
                    width: size.width * 0.015,
                    height: size.height * 0.01,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black).withOpacity(_currentIndex == entry.key ? 0.9 : 0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
            Image.asset('assets/images/tegmall.png'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02, horizontal: size.width * 0.035),
              child: Row(
                children: [
                  Text(
                    'หมวดหมู่สินค้าแนะนำ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(), // เว้นที่ระหว่างข้อความ
                  Text(
                    'หมวดหมู่ทั้งหมด',
                    style: TextStyle(fontSize: 12, color: red1, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            categories.isEmpty
                ? SizedBox()
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: SizedBox(
                      height: size.height * 0.31,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
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
                  ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02, horizontal: size.width * 0.035),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                        text: TextSpan(text: 'สินค้าแนะนำ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18), children: <TextSpan>[
                      TextSpan(
                        text: ' จาก 1668',
                        style: TextStyle(color: red1, fontWeight: FontWeight.bold, fontSize: 18),
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
                                price: (listProducts[index]['price'] as num).toDouble(),
                                products: listProducts[index],
                                press: () {},
                              ),
                            ),
                          );
                        },
                      )),
            ),
            SizedBox(
              height: size.height * 0.06,
            ),
          ],
        ),
      ),
    );
  }

  void _onDotTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
