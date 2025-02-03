import 'dart:developer';

import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/services/homeApi.dart';
import 'package:cargoshipping/models/categories.dart';
import 'package:cargoshipping/models/searchpic1688.dart';
import 'package:cargoshipping/models/searchpictaobao.dart';
import 'package:cargoshipping/upload/uploadService.dart';
import 'package:cargoshipping/widgets/LoadingDialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SearchKeywordPage extends StatefulWidget {
  SearchKeywordPage({super.key, required this.type, required this.keyword});
  String type;
  String keyword;

  @override
  State<SearchKeywordPage> createState() => _SearchKeywordPageState();
}

class _SearchKeywordPageState extends State<SearchKeywordPage> {
  final List<String> items = [
    'taobao',
    '1688',
  ];
  String selectedLanguage = 'ไทย';
  String selectedValue = '';
  List<Categories> categories = [];
  List<SearchPic1688> itemSearch1688 = [];
  List<SearchPicTaobao> itemSearchTaobao = [];
  ImagePicker picker = ImagePicker();
  XFile? selectedimage;
  TextEditingController searchText = TextEditingController();


  @override
  void initState() {
    super.initState();
    setState(() {
      selectedValue = widget.type;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //await getlistCategories(name: items[0]);
    });
  }

  Future openDialogImage() async {
    final img = await picker.pickImage(source: ImageSource.gallery);
    return img;
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.072),
        child: Container(
          color: red1,
          height: size.height * 0.2,
          child: Padding(
            padding: EdgeInsets.only(top: size.height * 0.039, left: size.width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.01),
                  child: Container(
                    height: size.height * 0.041,
                    width: size.width * 0.78,
                    decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.3,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'ค้นหาสินค้า',
                              hintStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                              contentPadding: EdgeInsets.only(left: size.width * 0.02, bottom: size.height * 0.019),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final img = await openDialogImage();
                            if (img != null) {
                              setState(() {
                                selectedimage = img;
                              });
                              try {
                                LoadingDialog.open(context);
                                final _imageUpload = await UoloadService.uploadImage(selectedimage!);
                                if (_imageUpload['photo_test_url'] != null) {
                                  final _imgcode = await HomeApi.uploadImage(imgcode: _imageUpload['photo_test_url']);
                                  if (_imgcode != null) {
                                    final _searchImage = await HomeApi.getItemSearchImg(searchImg: _imgcode, type: selectedValue);
                                    LoadingDialog.close(context);
                                    if (_searchImage.isNotEmpty) {
                                      setState(() {
                                        searchText.clear();
                                        if (selectedValue == '1688') {
                                          itemSearchTaobao.clear();
                                          itemSearch1688.clear();
                                          itemSearch1688 = _searchImage;
                                        } else {
                                          itemSearchTaobao.clear();
                                          itemSearch1688.clear();
                                          itemSearchTaobao = _searchImage;
                                        }
                                      });
                                    } else {
                                      LoadingDialog.close(context);
                                      print('No item from Api');
                                    }
                                  } else {
                                    LoadingDialog.close(context);
                                    print('No item from Api');
                                  }
                                } else {
                                  LoadingDialog.close(context);
                                  print('ล้มเหลว');
                                }
                              } on Exception catch (e) {
                                if (!mounted) return;
                                LoadingDialog.close(context);
                                print(e);
                              }
                            }
                          },
                          child: Image.asset(
                            'assets/icons/cam.png',
                            height: size.height * 0.035,
                            width: size.width * 0.07,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.005,
                        ),
                        Container(
                          color: Colors.grey,
                          height: size.height * 0.03,
                          width: size.width * 0.001,
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                          width: size.width * 0.205,
                          child: DropdownButtonHideUnderline(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 0),
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  hint: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'เลือกสินค้า',
                                      style: TextStyle(
                                        fontSize: 15,
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
                                              style: TextStyle(fontSize: 15, color: red1),
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
                                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                                    width: size.width * 0.1,
                                  ),
                                  menuItemStyleData: MenuItemStyleData(
                                    height: size.height * 0.06,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.001,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.008),
                          child: GestureDetector(
                            onTap: () {
                              //
                            },
                            child: Container(
                              height: size.height * 0.035,
                              width: size.width * 0.18,
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
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   width: size.width * 0.01,
                // ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.01, left: size.width * 0.006),
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
                    child: Image.asset('assets/icons/thai.png', height: size.height * 0.03),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.001,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
