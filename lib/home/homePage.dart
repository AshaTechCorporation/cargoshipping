import 'dart:developer';

import 'package:cargoshipping/Itempage/itempage.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/alipayservice.dart';
import 'package:cargoshipping/home/alliandwechatservice.dart';
import 'package:cargoshipping/home/bookingairservice.dart';
import 'package:cargoshipping/home/correctimport.dart';
import 'package:cargoshipping/home/depositPayment.dart';
import 'package:cargoshipping/home/detailproduct.dart';
import 'package:cargoshipping/home/fclpage.dart';
import 'package:cargoshipping/home/lclpage.dart';
import 'package:cargoshipping/home/orderinapp.dart';
import 'package:cargoshipping/home/services/homeApi.dart';
import 'package:cargoshipping/home/shippingservice.dart';
import 'package:cargoshipping/home/shipservicepage.dart';
import 'package:cargoshipping/home/termfee.dart';
import 'package:cargoshipping/home/tourprivateservice.dart';
import 'package:cargoshipping/home/waitPurchasePage.dart';
import 'package:cargoshipping/home/werehouseqc.dart';
import 'package:cargoshipping/home/werehousesearch.dart';
import 'package:cargoshipping/home/widgets/OurItem.dart';
import 'package:cargoshipping/home/widgets/OurServicesWidget.dart';
import 'package:cargoshipping/home/widgets/Servicedetail.dart';
import 'package:cargoshipping/home/widgets/WaitPurchase.dart';
import 'package:cargoshipping/home/widgets/importrate.dart';
import 'package:cargoshipping/home/widgets/importwidget.dart';
import 'package:cargoshipping/home/widgets/paperless.dart';
import 'package:cargoshipping/home/widgets/payment.dart';
import 'package:cargoshipping/home/widgets/searchshowpage.dart';
import 'package:cargoshipping/home/widgets/shippingcalpage.dart';
import 'package:cargoshipping/home/widgets/tegmallpage.dart';
import 'package:cargoshipping/home/widgets/translaterguideservicepage.dart';
import 'package:cargoshipping/home/worldexport.dart';
import 'package:cargoshipping/message/widgets/customdivider.dart';
import 'package:cargoshipping/models/categories.dart';
import 'package:cargoshipping/models/itemsearch.dart';
import 'package:cargoshipping/models/orders/partService.dart';
import 'package:cargoshipping/models/orders/products.dart';
import 'package:cargoshipping/models/rateShip.dart';
import 'package:cargoshipping/models/serviceTransporter.dart';
import 'package:cargoshipping/track/widgets/placeorderourchase.dart';
import 'package:cargoshipping/upload/uploadService.dart';
import 'package:cargoshipping/widgets/LoadingDialog.dart';
import 'package:cargoshipping/home/widgets/ProductCategories.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Categories> categories = [];
  List<ServiceTransporter> serviceTransporter = [];
  List<ServiceTransporter> storeTEG = [];
  List<RateShip> rateShip = [];
  List<ServiceTransporter> categoryProduct = [];
  final ScrollController _scrollController = ScrollController();
  double appBarOpacity = 0.0;
  Color searchBarColor = Colors.transparent;
  bool _isExpanded = true;
  TextEditingController searchText = TextEditingController();
  Map<String, List<RateShip>> groupedData = {};
  bool enabled = true;
  List<ItemSearch> item = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //await getlistCategories(name: items[0]);
      await getlistService();
    });
    // เพิ่ม Listener เพื่อตรวจจับการเลื่อน
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      double newOpacity = (offset / 150).clamp(0.0, 1.0); // ปรับค่า 150 ตามต้องการ

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
      //inspect(categories);
      LoadingDialog.close(context);
    } on Exception catch (e) {
      if (!mounted) return;
      LoadingDialog.close(context);
      print(e);
    }
  }

  Future<void> getlistCategoriesByName({required String categories_name}) async {
    try {
      //LoadingDialog.open(context);
      // final _item = await HomeApi.getItemCategories(categories_name: categories_name);
      String result = categories_name.replaceAll(" ", "");
      final _item = await HomeApi.getItemSearch(search: result, type: selectedValue);

      if (!mounted) return;

      setState(() {
        item = _item;
      });
      //inspect(item);
      //LoadingDialog.close(context);
    } on Exception catch (e) {
      if (!mounted) return;
      //LoadingDialog.close(context);
      print(e);
    }
  }

  //ดึงข้อมูล api Category
  Future<void> getlistService() async {
    try {
      // LoadingDialog.open(context);
      final _service = await HomeApi.getService();
      final _store = await HomeApi.getStore();
      final _rateShip = await HomeApi.getRateShip();
      final _categoryProduct = await HomeApi.getCategoryProduct();
      if (!mounted) return;

      setState(() {
        serviceTransporter = _service;
        storeTEG = _store;
        rateShip = _rateShip;
        categoryProduct = _categoryProduct;
        for (var item in _rateShip) {
          groupedData.putIfAbsent(item.vehicle!, () => []).add(item);
        }
        Future.delayed(Duration(seconds: 2), () async {
          if (_service.isNotEmpty) {
            enabled = !enabled;
          }
        });
      });
      await getlistCategoriesByName(categories_name: categoryProduct[0].taobao!);

      // LoadingDialog.close(context);
    } on Exception catch (e) {
      if (!mounted) return;
      // LoadingDialog.close(context);
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
  ImagePicker picker = ImagePicker();
  XFile? selectedimage;

  Future openDialogImage() async {
    final img = await picker.pickImage(source: ImageSource.gallery);
    return img;
  }

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
                      border: Border.all(color: Colors.grey, width: size.width * 0.001),
                      borderRadius: BorderRadius.circular(15),
                      color: Color.lerp(Colors.transparent, Colors.white, appBarOpacity),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width * 0.33,
                            child: TextFormField(
                              controller: searchText,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'ค้นหาสินค้า',
                                hintStyle: TextStyle(fontSize: 13),
                                isCollapsed: true,
                                contentPadding: EdgeInsets.only(left: size.width * 0.02, bottom: size.height * 0.01),
                              ),
                            ),
                          ),
                          InkWell(
                              onTap: () async {
                                final img = await openDialogImage();
                                if (img != null) {
                                  setState(() {
                                    selectedimage = img;
                                  });
                                  print(selectedimage!.path);
                                  try {
                                    LoadingDialog.open(context);
                                    final _imageUpload = await UoloadService.uploadImage(selectedimage!);
                                    if (_imageUpload != null) {
                                      final _imgcode = await HomeApi.uploadImage(imgcode: 'https://cargo-api.dev-asha9.com/${_imageUpload}');
                                      if (_imgcode != null) {
                                        final _searchImage = await HomeApi.getItemSearchImg(searchImg: _imgcode, type: selectedValue);
                                        LoadingDialog.close(context);
                                        if (_searchImage.isNotEmpty) {
                                          setState(() {
                                            searchText.clear();
                                          });
                                          if (selectedValue == '1688') {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Searchshowpage(
                                                          items1688: _searchImage,
                                                          itemstaobao: [],
                                                          type: selectedValue,
                                                        )));
                                          } else {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Searchshowpage(
                                                          itemstaobao: _searchImage,
                                                          items1688: [],
                                                          type: selectedValue,
                                                        )));
                                          }
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
                              child: Image.asset('assets/icons/cam.png')),
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
                                                style: TextStyle(fontSize: 13, color: red1, fontWeight: FontWeight.w600),
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
                            onTap: () async {
                              if (searchText.text != '') {
                                try {
                                  LoadingDialog.open(context);
                                  final _search = await HomeApi.getItemSearch(search: searchText.text, type: selectedValue);
                                  if (!mounted) return;
                                  LoadingDialog.close(context);
                                  if (_search.isNotEmpty) {
                                    setState(() {
                                      searchText.clear();
                                    });
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => Searchshowpage(
                                    //               items: _search,
                                    //             )));
                                  } else {
                                    print('No item from Api');
                                  }
                                } on Exception catch (e) {
                                  if (!mounted) return;
                                  LoadingDialog.close(context);
                                  print(e);
                                }
                              } else {}
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
                                  style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
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
                    //bottom: MediaQuery.of(context).size.height * (-30 / 800),
                    bottom: -20,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ...List.generate(
                            importwidget.length,
                            (index) => GestureDetector(
                              onTap: () {
                                if (index == 0) {
                                  print(index);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Paperless(),
                                    ),
                                  );
                                }
                                if (index == 1) {
                                  print(index);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Tegmallpage(),
                                    ),
                                  );
                                }
                              },
                              child: Importwidget(
                                size: size,
                                title: importwidget[index]['name'],
                                imagePath: importwidget[index]['images'],
                                id: importwidget[index]['id'],
                              ),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'บริการของเรา',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showBottomSheet(context);
                    },
                    child: Row(
                      children: [
                        Text(
                          'บริการทั้งหมด',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            // Wrap(
            //   spacing: 8,
            //   runSpacing: 8,
            //   children: List.generate(titleData.length, (index) {
            //     return SizedBox(
            //       width: size.width * 0.21,
            //       child: OurServicesWidget(
            //         size: size,
            //         title: titleData[index],
            //         press: () {
            //           if (index == 0) {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => Servicedetail(
            //                   title: titleData[index],
            //                 ),
            //               ),
            //             );
            //           }
            //           if (index == 1) {}
            //           if (index == 6) {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => ShippingCalculatorPage(),
            //               ),
            //             );
            //           }
            //           if (index == 7) {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => Importrate(),
            //               ),
            //             );
            //           }
            //         },
            //         imagespath: Imgservice[index],
            //       ),
            //     );
            //   }),
            // ),
            // SizedBox(
            //   height: size.height * 0.01,
            // ),
            SizedBox(
              height: size.height * 0.26,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 1.0,
                  ),
                  itemCount: serviceTransporter.length,
                  itemBuilder: (context, index) {
                    return OurServicesWidget(
                        size: size,
                        title: serviceTransporter[index].name ?? '',
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Servicedetail(
                                id: serviceTransporter[index].id!,
                              ),
                            ),
                          );
                          // if (serviceTransporter[index].name == 'ขนส่งทางบก') {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => Servicedetail(),
                          //     ),
                          //   );
                          // }
                          // if (serviceTransporter[index].name == 'ขนส่งทางทะเล') {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => Shipservicepage(),
                          //     ),
                          //   );
                          // }
                          // if (serviceTransporter[index].name == 'จัดส่งแบบเหมาตู้') {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => Fclpage1(),
                          //     ),
                          //   );
                          // }
                          // if (serviceTransporter[index].name == 'จัดส่งแบบ LCL ทางเครื่องบิน') {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => Lclpage(),
                          //     ),
                          //   );
                          // }
                          // if (serviceTransporter[index].name == 'บริการส่งออกสินค้าทั่วโลก') {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => Worldexport(),
                          //     ),
                          //   );
                          // }
                          // if (serviceTransporter[index].name == 'บริการนำเข้าแบบถูกต้อง') {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => Correctimportservice(),
                          //     ),
                          //   );
                          // }
                          // if (index == 6) {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => Translaterguideservicepage(),
                          //     ),
                          //   );
                          // }
                          // if (index == 7) {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => ShippingCalculatorPage(),
                          //     ),
                          //   );
                          // }
                          // if (index == 8) {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => Importrate(),
                          //     ),
                          //   );
                          // }
                          // if (index == 9) {
                          //   _showBottomSheet(context);
                          // }
                        },
                        imagespath: serviceTransporter[index].image ?? '');
                  },
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02, horizontal: size.width * 0.035),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      // List<PartService> example2 = [
                      //   PartService(1, 200),
                      // ];
                      // List<Products> example = [
                      //   Products(
                      //     '843650150244',
                      //     '深灰色百褶裙女高腰显瘦春秋2024新款冬季毛呢半身裙jk短裙a字裙',
                      //     'https://detail.1688.com/offer/843650150244.html',
                      //     'https://detail.1688.com/offer/843650150244.html',
                      //     'ของเด็ก',
                      //     'ของเด็ก',
                      //     'ของเด็ก',
                      //     '20',
                      //     '1',
                      //     example2,
                      //   ),
                      // ];
                      // await HomeApi.createOrder(
                      //   date: "2023-11-20",
                      //   total_price: 1299,
                      //   shipping_type: 'Car',
                      //   payment_term: '1',
                      //   note: '',
                      //   products: example,
                      // );
                    },
                    child: Text(
                      'รายการรอชำระ',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WaitPurchasePage(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'รายการทั้งหมด',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: WaitPurchase(
                      size: size,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Placeorderourchase(),
                          ),
                        );
                      },
                      pressPrice: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: WaitPurchase(
                      size: size,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Placeorderourchase(),
                          ),
                        );
                      },
                      pressPrice: () {},
                    ),
                  ),
                ],
              ),
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
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: headingtext),
                      ),
                      SizedBox(
                        width: size.width * 0.04,
                      ),
                      Text(
                        '22 สิงหาคม 2567',
                        style: TextStyle(color: red1, fontSize: 13, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        payment.length,
                        (index) => Payment(
                              size: size,
                              press: () {
                                if (index == 0) {
                                  Navigator.push(context, MaterialPageRoute(builder: (contex) => Tegmallpage()));
                                } else if (index == 1) {
                                  Navigator.push(context, MaterialPageRoute(builder: (contex) => DepositPayment()));
                                } else {}
                              },
                              imagespath: payment[index],
                            )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '*อัตราเงินอาจมีการเปลี่ยนแปลง บริษัทขอสงวนสิทธิ์ในการไม่แจ้งให้ทราบล่วงหน้า',
                      style: TextStyle(fontSize: 10, color: headingtext, fontWeight: FontWeight.bold),
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
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '${importcard[0]['Importercode']}',
                            style: TextStyle(
                              fontSize: 15,
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
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '${importcard[0]['Sendbycar']}',
                              style: TextStyle(
                                fontSize: 15,
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
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '${importcard[0]['Sendbyboat']}',
                              style: TextStyle(
                                fontSize: 15,
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
              //height: size.height * 0.42,
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
                  Column(
                    children: List.generate(
                      storeTEG.length,
                      (indexStore) => SizedBox(
                        //height: size.height * 0.19,
                        width: size.width * 0.93,
                        // color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(text: '${storeTEG[indexStore].name ?? ''} :', style: TextStyle(color: red1, fontWeight: FontWeight.w600, fontSize: 15), children: <TextSpan>[
                              TextSpan(
                                text: ' ${storeTEG[indexStore].address ?? ''}',
                                style: TextStyle(color: headingtext, fontSize: 15),
                              )
                            ])),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            RichText(
                                text: TextSpan(text: 'เบอร์โทรศัพท์ :', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15), children: <TextSpan>[
                              TextSpan(
                                text: ' ${storeTEG[indexStore].phone ?? ''}',
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 15),
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
                                      foregroundColor: red1, side: BorderSide(color: red1, width: size.width * 0.004), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))),
                                  onPressed: () {
                                    Clipboard.setData(
                                      ClipboardData(text: storeTEG[indexStore].address ?? ''),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('คัดลอกที่อยู่เรียบร้อยแล้ว')),
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
                    ),
                  ),

                  // SizedBox(
                  //   height: size.height * 0.01,
                  // ),
                  // Container(
                  //   height: size.height * 0.19,
                  //   width: size.width * 0.93,
                  //   // color: Colors.white,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       RichText(
                  //           text: TextSpan(text: 'คลังอี้อู :', style: TextStyle(color: red1, fontWeight: FontWeight.w600, fontSize: 15), children: <TextSpan>[
                  //         TextSpan(
                  //           text: ' TEG CARGO仓 浙江省义乌市稠城街道江北下朱货运市场一栋231-232号 邮编322023',
                  //           style: TextStyle(color: headingtext, fontSize: 15),
                  //         )
                  //       ])),
                  //       SizedBox(
                  //         height: size.height * 0.01,
                  //       ),
                  //       RichText(
                  //           text: TextSpan(text: 'เบอร์โทรศัพท์ :', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15), children: <TextSpan>[
                  //         TextSpan(
                  //           text: ' 18520290139',
                  //           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 15),
                  //         )
                  //       ])),
                  //       SizedBox(
                  //         height: size.height * 0.018,
                  //       ),
                  //       Center(
                  //         child: SizedBox(
                  //           height: size.height * 0.042,
                  //           width: size.width * 0.3,
                  //           child: TextButton(
                  //             style: TextButton.styleFrom(
                  //                 foregroundColor: red1,
                  //                 side: BorderSide(color: red1, width: size.width * 0.004),
                  //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))),
                  //             onPressed: () {
                  //               Clipboard.setData(
                  //                 ClipboardData(text: 'ที่อยู่ที่ต้องการคัดลอก'),
                  //               );
                  //               ScaffoldMessenger.of(context).showSnackBar(
                  //                 SnackBar(content: Text('คัดลอกที่อยู่เรียบร้อยแล้ว')),
                  //               );
                  //             },
                  //             child: Text(
                  //               'คัดลอกที่อยู่',
                  //               style: TextStyle(fontWeight: FontWeight.bold),
                  //             ),
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            // Carimportratewidget(size: size),
            // SizedBox(
            //   height: size.height * 0.01,
            // ),
            // Shippingimportratewidget(size: size),
            SizedBox(
              height: size.height * 0.04,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  child: Text(
                    'อัตราค่าขนส่ง',
                    style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            groupedData.isEmpty
                ? SizedBox.shrink()
                : Column(
                    children: groupedData.entries.map((entry) {
                      return Stack(
                        children: [
                          Image.asset(entry.key == 'Car' ? 'assets/images/16.png' : 'assets/images/17.png'),
                          Positioned(
                            top: size.height * 0.08,
                            left: size.width * 0.05,
                            child: Column(
                              children: entry.value.map((item) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: item.type,
                                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16, fontFamily: 'SukhumvitSet'),
                                            children: <TextSpan>[
                                              // TextSpan(
                                              //   text: item.type,
                                              //   style: TextStyle(
                                              //     fontWeight: FontWeight.bold,
                                              //     color: Colors.red,
                                              //     fontSize: 14,
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.39,
                                        ),
                                        Text(
                                          item.kg ?? '',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.18,
                                        ),
                                        Text(
                                          item.cbm ?? '',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                    Positioned(
                                        top: size.height * 0.22,
                                        left: size.width * 0.05,
                                        child: Row(
                                          children: [
                                            Text(
                                              item.name ?? '',
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                                            )
                                          ],
                                        )),
                                  ],
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      );
                    }).toList(),
                  ),
            // Padding(
            //   padding: EdgeInsets.all(size.height * 0.012),
            //   child: Stack(
            //     children: [
            //       Image.asset('assets/images/16.png'),
            //       Positioned(
            //           top: size.height * 0.12,
            //           left: size.width * 0.05,
            //           child: Row(
            //             children: [
            //               RichText(
            //                 text: TextSpan(
            //                   text: 'ประเภท ',
            //                   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16, fontFamily: 'SukhumvitSet'),
            //                   children: <TextSpan>[
            //                     TextSpan(
            //                       text: 'C',
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         color: Colors.red,
            //                         fontSize: 14,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: size.width * 0.39,
            //               ),
            //               Text(
            //                 '00',
            //                 style: TextStyle(
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: size.width * 0.18,
            //               ),
            //               Text(
            //                 '00',
            //                 style: TextStyle(
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               )
            //             ],
            //           )),
            //       Positioned(
            //           top: size.height * 0.155,
            //           left: size.width * 0.05,
            //           child: Row(
            //             children: [
            //               Text(
            //                 'สินค้ามาตราฐาน',
            //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
            //               )
            //             ],
            //           )),
            //       Positioned(
            //           top: size.height * 0.185,
            //           left: size.width * 0.05,
            //           child: Row(
            //             children: [
            //               RichText(
            //                 text: TextSpan(
            //                   text: 'ประเภท ',
            //                   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16, fontFamily: 'SukhumvitSet'),
            //                   children: <TextSpan>[
            //                     TextSpan(
            //                       text: 'D',
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         color: Colors.red,
            //                         fontSize: 14,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: size.width * 0.39,
            //               ),
            //               Text(
            //                 '00',
            //                 style: TextStyle(
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: size.width * 0.18,
            //               ),
            //               Text(
            //                 '00',
            //                 style: TextStyle(
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               )
            //             ],
            //           )),
            //       Positioned(
            //           top: size.height * 0.22,
            //           left: size.width * 0.05,
            //           child: Row(
            //             children: [
            //               Text(
            //                 'สินค้ามาตราฐาน',
            //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
            //               )
            //             ],
            //           )),
            //       Positioned(
            //           top: size.height * 0.06,
            //           left: size.width * 0.05,
            //           child: Row(
            //             children: [
            //               RichText(
            //                 text: TextSpan(
            //                   text: 'ประเภท ',
            //                   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16, fontFamily: 'SukhumvitSet'),
            //                   children: <TextSpan>[
            //                     TextSpan(
            //                       text: 'A',
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         color: Colors.red,
            //                         fontSize: 14,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: size.width * 0.39,
            //               ),
            //               Text(
            //                 '00',
            //                 style: TextStyle(
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: size.width * 0.18,
            //               ),
            //               Text(
            //                 '00',
            //                 style: TextStyle(
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               )
            //             ],
            //           )),
            //       Positioned(
            //           top: size.height * 0.095,
            //           left: size.width * 0.05,
            //           child: Row(
            //             children: [
            //               Text(
            //                 'สินค้าทั่วไป',
            //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
            //               )
            //             ],
            //           )),
            //       Positioned(
            //           top: size.height * 0.258,
            //           left: size.width * 0.05,
            //           child: Row(
            //             children: [
            //               RichText(
            //                 text: TextSpan(
            //                   text: 'ประเภท ',
            //                   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16, fontFamily: 'SukhumvitSet'),
            //                   children: <TextSpan>[
            //                     TextSpan(
            //                       text: 'B',
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         color: Colors.red,
            //                         fontSize: 14,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: size.width * 0.39,
            //               ),
            //               Text(
            //                 '00',
            //                 style: TextStyle(
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: size.width * 0.18,
            //               ),
            //               Text(
            //                 '00',
            //                 style: TextStyle(
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               )
            //             ],
            //           )),
            //       Positioned(
            //           top: size.height * 0.29,
            //           left: size.width * 0.05,
            //           child: Row(
            //             children: [
            //               Text(
            //                 'สินค้าอื่นๆ',
            //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
            //               )
            //             ],
            //           ))
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.all(size.height * 0.012),
            //   child: Stack(
            //     children: [
            //       Image.asset('assets/images/17.png'),
            //       Positioned(
            //           top: size.height * 0.06,
            //           left: size.width * 0.05,
            //           child: Row(
            //             children: [
            //               RichText(
            //                 text: TextSpan(
            //                   text: 'ประเภท ',
            //                   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16, fontFamily: 'SukhumvitSet'),
            //                   children: <TextSpan>[
            //                     TextSpan(
            //                       text: 'A',
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         color: Colors.red,
            //                         fontSize: 14,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: size.width * 0.39,
            //               ),
            //               Text(
            //                 '00',
            //                 style: TextStyle(
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: size.width * 0.18,
            //               ),
            //               Text(
            //                 '00',
            //                 style: TextStyle(
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               )
            //             ],
            //           )),
            //       Positioned(
            //           top: size.height * 0.095,
            //           left: size.width * 0.05,
            //           child: Row(
            //             children: [
            //               Text(
            //                 'สินค้าทั่วไป',
            //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
            //               )
            //             ],
            //           )),
            //       Positioned(
            //           top: size.height * 0.12,
            //           left: size.width * 0.05,
            //           child: Row(
            //             children: [
            //               RichText(
            //                 text: TextSpan(
            //                   text: 'ประเภท ',
            //                   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16, fontFamily: 'SukhumvitSet'),
            //                   children: <TextSpan>[
            //                     TextSpan(
            //                       text: 'C',
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         color: Colors.red,
            //                         fontSize: 14,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: size.width * 0.39,
            //               ),
            //               Text(
            //                 '00',
            //                 style: TextStyle(
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: size.width * 0.18,
            //               ),
            //               Text(
            //                 '00',
            //                 style: TextStyle(
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               )
            //             ],
            //           )),
            //       Positioned(
            //           top: size.height * 0.155,
            //           left: size.width * 0.05,
            //           child: Row(
            //             children: [
            //               Text(
            //                 'สินค้ามาตราฐาน',
            //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
            //               )
            //             ],
            //           )),
            //       Positioned(
            //           top: size.height * 0.185,
            //           left: size.width * 0.05,
            //           child: Row(
            //             children: [
            //               RichText(
            //                 text: TextSpan(
            //                   text: 'ประเภท ',
            //                   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16, fontFamily: 'SukhumvitSet'),
            //                   children: <TextSpan>[
            //                     TextSpan(
            //                       text: 'D',
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         color: Colors.red,
            //                         fontSize: 14,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: size.width * 0.39,
            //               ),
            //               Text(
            //                 '00',
            //                 style: TextStyle(
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: size.width * 0.18,
            //               ),
            //               Text(
            //                 '00',
            //                 style: TextStyle(
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               )
            //             ],
            //           )),
            //       Positioned(
            //           top: size.height * 0.22,
            //           left: size.width * 0.05,
            //           child: Row(
            //             children: [
            //               Text(
            //                 'สินค้ามาตราฐาน',
            //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
            //               )
            //             ],
            //           )),
            //       Positioned(
            //           top: size.height * 0.258,
            //           left: size.width * 0.05,
            //           child: Row(
            //             children: [
            //               RichText(
            //                 text: TextSpan(
            //                   text: 'ประเภท ',
            //                   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16, fontFamily: 'SukhumvitSet'),
            //                   children: <TextSpan>[
            //                     TextSpan(
            //                       text: 'B',
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         color: Colors.red,
            //                         fontSize: 14,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: size.width * 0.39,
            //               ),
            //               Text(
            //                 '00',
            //                 style: TextStyle(
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: size.width * 0.18,
            //               ),
            //               Text(
            //                 '00',
            //                 style: TextStyle(
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               )
            //             ],
            //           )),
            //       Positioned(
            //           top: size.height * 0.29,
            //           left: size.width * 0.05,
            //           child: Row(
            //             children: [
            //               Text(
            //                 'สินค้าอื่นๆ',
            //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
            //               )
            //             ],
            //           ))
            //     ],
            //   ),
            // ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02, horizontal: size.width * 0.035),
              child: Row(
                children: [
                  Text(
                    'หมวดหมู่สินค้า',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(),
                  Text(
                    'หมวดหมู่ทั้งหมด',
                    style: TextStyle(fontSize: 12, color: red1, fontWeight: FontWeight.w700),
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
            categoryProduct.isEmpty
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
                      itemCount: categoryProduct.length,
                      itemBuilder: (context, index) {
                        return ProductCategories(
                          size: size,
                          title: categoryProduct[index].name!,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Detailproduct(
                                  type: selectedValue,
                                  categoryProduct: selectedValue == '1688' ? categoryProduct[index].one_six_eight_eight! : categoryProduct[index].taobao!,
                                ),
                              ),
                            );
                          },
                          imagespath: categoryProduct[index].image ?? '',
                        );
                      },
                    ),
                  ),
            // categories.isEmpty
            //     ? SizedBox()
            //     : SizedBox(
            //         height: size.height * 0.31,
            //         child: GridView.builder(
            //           scrollDirection: Axis.horizontal,
            //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //             crossAxisCount: 2,
            //             crossAxisSpacing: 10,
            //             mainAxisSpacing: 10,
            //             childAspectRatio: 1.0,
            //           ),
            //           itemCount: categories.length,
            //           itemBuilder: (context, index) {
            //             return ProductCategories(
            //               size: size,
            //               title: categories[index].name!,
            //               press: () {
            //                 Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) => Detailproduct(
            //                       categories: categories[index],
            //                     ),
            //                   ),
            //                 );
            //               },
            //               imagespath: 'assets/images/noimages.jpg',
            //             );
            //           },
            //         ),
            //       ),
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
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02, horizontal: size.width * 0.035),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                        text: TextSpan(text: 'สินค้าแนะนำ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18), children: <TextSpan>[
                      TextSpan(
                        text: ' จาก ${selectedValue}',
                        style: TextStyle(color: red1, fontWeight: FontWeight.bold, fontSize: 18),
                      )
                    ])),
                  ),
                ],
              ),
            ),
            item.isEmpty
                ? SizedBox()
                : Wrap(
                    spacing: 12,
                    runSpacing: 10,
                    children: List.generate(
                        item.length,
                        (index) => Ouritem(
                              image: item[index].pic_url!,
                              sale: item[index].sales.toString(),
                              send: item[index].sales.toString(),
                              size: MediaQuery.of(context).size,
                              price: item[index].price!,
                              detail: item[index].title!,
                              press: () async {},
                            )),
                  ),
            // Wrap(
            //   spacing: 20,
            //   runSpacing: 10,
            //   children: List.generate(
            //       listProducts.length,
            //       (index) => Ouritem(
            //             image: listProducts[index]['image'],
            //             sale: listProducts[index]['sale'],
            //             send: listProducts[index]['send'],
            //             size: MediaQuery.of(context).size,
            //             price: listProducts[index]['price'].toString(),
            //             detail: listProducts[index]['detail'],
            //             press: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => Itempage(
            //                     size: size,
            //                     title: listProducts[index]['detail'],
            //                     price: (listProducts[index]['price'] as num).toDouble(),
            //                     products: listProducts[index],
            //                     press: () {},
            //                     num_iid: '721593979484',
            //                     type: selectedValue,
            //                     name: 'xxx',
            //                   ),
            //                 ),
            //               );
            //             },
            //           )),
            // ),
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 1.0,
          maxChildSize: 1.0,
          minChildSize: 0.5,
          builder: (_, scrollController) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  color: white,
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      // ส่วนหัวด้านบน
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'บริการทั้งหมด',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.expand_more),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: serviceTransporter.length,
                          itemBuilder: (context, index) {
                            final service = serviceTransporter[index];
                            return Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    height: size.height * 0.05,
                                    width: size.width * 0.15,
                                    decoration: BoxDecoration(
                                      color: background,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.network(
                                          service.image ?? '',
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    service.name ?? '',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    service.description ?? '',
                                    style: TextStyle(fontSize: 12, color: headingtext),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Servicedetail(
                                          id: serviceTransporter[index].id!,
                                        ),
                                      ),
                                    );
                                    // if (serviceTransporter[index].name == 'ขนส่งทางบก') {
                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => Servicedetail(
                                    //         serviceTransporter: serviceTransporter[index],
                                    //       ),
                                    //     ),
                                    //   );
                                    // }
                                    // if (serviceTransporter[index].name == 'ขนส่งทางทะเล') {
                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => Shipservicepage(),
                                    //     ),
                                    //   );
                                    // }
                                    // if (serviceTransporter[index].name == 'จัดส่งแบบเหมาตู้') {
                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => Fclpage1(),
                                    //     ),
                                    //   );
                                    // }
                                    // if (serviceTransporter[index].name == 'จัดส่งแบบ LCL ทางเครื่องบิน') {
                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => Lclpage(),
                                    //     ),
                                    //   );
                                    // }
                                    // if (serviceTransporter[index].name == 'บริการส่งออกสินค้าทั่วโลก') {
                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => Worldexport(),
                                    //     ),
                                    //   );
                                    // }
                                    // if (serviceTransporter[index].name == 'บริการนำเข้าแบบถูกต้อง') {
                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => Correctimportservice(),
                                    //     ),
                                    //   );
                                    // }
                                    // if (index == 7) {
                                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => Tourprivateservice()));
                                    // }
                                    // if (index == 8) {
                                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => Bookingairservice()));
                                    // }
                                    // if (index == 9) {
                                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => Translaterguideservicepage()));
                                    // }
                                    // if (index == 10) {
                                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => Werehousesearch()));
                                    // }
                                    // if (index == 11) {
                                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => Werehouseqc()));
                                    // }
                                    // if (index == 12) {
                                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => Orderinapp()));
                                    // }
                                    // if (index == 13) {
                                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => Alipayservice()));
                                    // }
                                    // if (index == 14) {
                                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => Alliandwechatservice()));
                                    // }
                                    // if (index == 15) {
                                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => Termfee()));
                                    // }
                                    // if (index == 17) {
                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => ShippingCalculatorPage(),
                                    //     ),
                                    //   );
                                    // }
                                    // if (index == 16) {
                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => Importrate(),
                                    //     ),
                                    //   );
                                    // }
                                  },
                                ),
                                CustomDivider(
                                  heightFactor: size.height * 0.0000005,
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

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
