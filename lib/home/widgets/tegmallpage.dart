import 'dart:developer';

import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/services/homeApi.dart';
import 'package:cargoshipping/home/widgets/searchshowpage.dart';
import 'package:cargoshipping/models/categories.dart';
import 'package:cargoshipping/widgets/LoadingDialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class Tegmallpage extends StatefulWidget {
  const Tegmallpage({super.key});

  @override
  State<Tegmallpage> createState() => _TegmallpageState();
}

class _TegmallpageState extends State<Tegmallpage> {
  List<Categories> categories = [];

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
  String selectedLanguage = 'ไทย';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.11),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: size.height * 0.045,
                        width: size.width * 0.87,
                        padding: EdgeInsets.all(size.height * 0.005),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey, width: size.width * 0.001),
                          borderRadius: BorderRadius.circular(15),
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
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                      border: Border.all(
                                          color: Colors.white, width: 2),
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
                                                        fontSize: 14,
                                                        color: red1),
                                                  ),
                                                ))
                                            .toList(),
                                        value: selectedValue,
                                        onChanged: (String? value) {
                                          setState(() {
                                            selectedValue = value!;
                                          });
                                          getlistCategories(
                                              name: selectedValue);
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
                                          builder: (context) =>
                                              Searchshowpage()));
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
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.003),
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
                ],
              ),
            ),
          )),
    );
  }
}
