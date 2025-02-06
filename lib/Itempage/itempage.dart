import 'dart:developer';

import 'package:cargoshipping/Itempage/confirmorderpage.dart';
import 'package:cargoshipping/Itempage/widgets/bottomsheetswidget.dart';
import 'package:cargoshipping/Itempage/widgets/iamgesitem.dart';
import 'package:cargoshipping/Itempage/widgets/paymentstepperwidget.dart';
import 'package:cargoshipping/Itempage/widgets/warningwidget.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/services/homeApi.dart';
import 'package:cargoshipping/home/services/homeController.dart.dart';
import 'package:cargoshipping/home/widgets/OurItem.dart';
import 'package:cargoshipping/message/widgets/customdivider.dart';
import 'package:cargoshipping/models/itemmodel/item_model.dart';
import 'package:cargoshipping/models/itemsearch.dart';
import 'package:cargoshipping/models/itemt1688.dart';
import 'package:cargoshipping/models/itemtaobao.dart';
import 'package:cargoshipping/models/serviceTransporter.dart';
import 'package:cargoshipping/objectbox.g.dart';
import 'package:cargoshipping/widgets/LoadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class Itempage extends StatefulWidget {
  Itempage(
      {super.key,
      required this.size,
      required this.title,
      required this.price,
      required this.press,
      required this.products,
      required this.num_iid,
      required this.type,
      required this.name,
      required this.categorySelect});

  final Size size;
  final String title;
  final double price;
  final VoidCallback press;
  final Map<String, dynamic> products;
  final String num_iid;
  final String type;
  final String name;
  final ServiceTransporter categorySelect;

  @override
  State<Itempage> createState() => _ItempageState();
}

class _ItempageState extends State<Itempage> {
  int _selectedIndex = 0;
  int amount = 1;
  Itemt1688? itemt1688;
  //ItemTaobao? itemTaobao;
  Map<String, dynamic>? itemTaobao;
  List<ItemSearch> item = [];
  late final Store store;
  late final Box<JsonData> jsonBox;

  Future<void> initObjectBox() async {
    store = await openStore();
    jsonBox = store.box<JsonData>(); // เปิด Box สำหรับ Map
  }

  // void saveJson(Map<String, dynamic> data, String type, String categoryName) {
  //   final jsonString = jsonEncode(data);
  //   final jsonData = JsonData(json: jsonString, type: type, categoryName: categoryName);
  //   jsonBox.put(jsonData);
  // }

  void saveJson(Map<String, dynamic> data, String type, String categoryName) {
    final jsonString = jsonEncode(data); // แปลงข้อมูล JSON เป็น String

    // ค้นหาข้อมูลที่มี categoryName และ type ตรงกัน
    final query = jsonBox.query(JsonData_.categoryName.equals(categoryName) & JsonData_.type.equals(type)).build();

    final existingData = query.findFirst();
    query.close(); // ปิด query เมื่อใช้เสร็จ

    if (existingData != null) {
      // ถ้ามีข้อมูลอยู่แล้ว -> อัปเดต List<String> json
      List<String> updatedJsonList = List.from(existingData.jsonList)..add(jsonString);

      existingData.jsonList = updatedJsonList;
      jsonBox.put(existingData); // อัปเดตข้อมูลที่มีอยู่แล้ว
      print(" อัปเดตข้อมูลสำเร็จ: ${existingData.jsonList.length} รายการ");
    } else {
      // ถ้ายังไม่มีข้อมูล -> สร้างใหม่
      final jsonData = JsonData(
        jsonList: [jsonString], // เก็บเป็น List<String>
        type: type,
        categoryName: categoryName,
      );
      jsonBox.put(jsonData);
      print(" เพิ่มข้อมูลใหม่สำเร็จ");
    }
  }

  void getAllJsonData() {
    final allData = jsonBox.getAll(); // ดึงข้อมูลทั้งหมด
    for (var data in allData) {
      //print(data); // แสดงผลแต่ละรายการ
      inspect(data);
    }
  }

  void deleteAllJson() {
    final count = jsonBox.removeAll();
    print('ลบข้อมูลทั้งหมด $count รายการ');
  }

  void _onItemTapped(int index) async {
    //final _pro = await context.read<HomeController>().productCart;
    getAllJsonData();
    setState(() {
      _selectedIndex = index;
    });
    // Handle item tap
    print('Selected index: $index');
    //inspect(_pro);
  }

  @override
  void initState() {
    super.initState();
    print(widget.num_iid);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getDetailItem(num_iid: widget.num_iid, type: widget.type);
      await initObjectBox();
    });
  }

  @override
  void dispose() {
    store.close();
    super.dispose();
  }

  //ดูข้อมูลสินค้าตาม Category Name
  Future<void> getlistCategoriesByName({required String categories_name}) async {
    try {
      //LoadingDialog.open(context);
      // final _item = await HomeApi.getItemCategories(categories_name: categories_name);
      String result = categories_name.replaceAll(" ", "");
      final _item = await HomeApi.getItemSearch(search: result, type: widget.type);

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

  //ดึงข้อมูล รายละเอียดสินค้า
  Future<void> getDetailItem({required String num_iid, required String type}) async {
    try {
      LoadingDialog.open(context);
      //final _categories = await HomeApi.getCategories(name: name);
      final _detailItem = await HomeApi.getItemDetail(num_id: num_iid, type: type);
      if (!mounted) return;
      setState(() {
        if (widget.type == '1688') {
          itemt1688 = _detailItem;
        } else {
          itemTaobao = _detailItem;
        }
      });
      await getlistCategoriesByName(categories_name: itemTaobao!['title']);
      //inspect(categories);
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
      appBar: AppBar(
        title: Text(
          'สั่งซื้อสินค้า',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: white,
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/icons/but_share.png',
              width: 35,
              height: 27,
            ),
            onPressed: () async {
              // Action when the icon is pressed
              deleteAllJson();
            },
          ),
          IconButton(
            icon: Image.asset(
              'assets/icons/cart.png',
              width: 30,
              height: 30,
            ),
            onPressed: () {
              // Action when the icon is pressed
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: itemTaobao == null
            ? SizedBox()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: white,
                    child: Column(
                      children: [
                        ImagesItem(
                          image: 'https:${itemTaobao!['pic_url']}',
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: widget.size.height * 0.005, horizontal: widget.size.width * 0.01),
                          child: Row(
                            children: [
                              Text('${itemTaobao!['item_imgs'].length} ตัวเลือกสินค้า'),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Wrap(
                          children: List.generate(
                            itemTaobao!['item_imgs'].length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.012),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.network(
                                  'https:${itemTaobao!['item_imgs'][index]['url']}', // ใช้ภาพเดียวกันจาก products
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Image.asset(
                                    width: 70,
                                    height: 70,
                                    'assets/images/logofull.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Row(
                        //   children: <Widget>[
                        //     SizedBox(width: widget.size.width * 0.028),
                        //     ClipRRect(
                        //       borderRadius: BorderRadius.circular(16.0),
                        //       child: Image.asset(
                        //         widget.products['image'], // ใช้ภาพเดียวกันจาก products
                        //         width: 70,
                        //         height: 70,
                        //         fit: BoxFit.cover,
                        //       ),
                        //     ),
                        //     SizedBox(width: size.width * 0.02),
                        //     ClipRRect(
                        //       borderRadius: BorderRadius.circular(16.0),
                        //       child: Image.asset(
                        //         widget.products['image'], // ใช้ภาพเดียวกันจาก products
                        //         width: 70,
                        //         height: 70,
                        //         fit: BoxFit.cover,
                        //       ),
                        //     ),
                        //     SizedBox(width: size.width * 0.02),
                        //     ClipRRect(
                        //       borderRadius: BorderRadius.circular(16.0),
                        //       child: Image.asset(
                        //         widget.products['image'], // ใช้ภาพเดียวกันจาก products
                        //         width: 70,
                        //         height: 70,
                        //         fit: BoxFit.cover,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(height: size.height * 0.01),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 9.0),
                          child: Row(
                            children: [
                              Text(
                                '${itemTaobao!['price']} บาท',
                                style: TextStyle(fontSize: 24, color: Colors.red, fontWeight: FontWeight.bold),
                              ),
                              //Text('(${widget.products['price']} บาท)'),
                              Spacer(),
                              Text(
                                'ขายแล้ว ${itemTaobao!['sales']} ชิ้น',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(width: size.width * 0.01),
                              IconButton(
                                icon: Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'เพิ่มไปยังสินค้าที่ถูกใจแล้ว',
                                        style: TextStyle(color: white),
                                      ),
                                      duration: Duration(seconds: 2),
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.black.withOpacity(0.5),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 9.0),
                          child: Text(
                            '${itemTaobao!['title']}',
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                        SizedBox(height: size.height * 0.001),
                        SizedBox(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: widget.size.height * 0.001, horizontal: widget.size.width * 0.028),
                            child: Row(
                              children: [
                                Text(
                                  '${itemTaobao!['seller_info']['nick']}',
                                  style: TextStyle(fontSize: 15, color: Colors.grey[900]),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.001),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: widget.size.height * 0.001, horizontal: widget.size.width * 0.028),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      'รับประกันการจัดส่ง 48 ชั่วโมง',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Text(
                                      '5.0 คะแนนสินค้า',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.005),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: widget.size.height * 0.001, horizontal: widget.size.width * 0.028),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      'กลับมาซื้อซ้ำแล้ว 90%',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: greyuserinfo,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      'จำนวนสินค้าที่จำหน่ายได้${widget.products['sale']}',
                                      style: TextStyle(color: greyuserinfo, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  PaymentStepsWidget(size: size),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  warningwidget(size: size),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    color: white,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'รายละเอียดสินค้า',
                              style: TextStyle(fontSize: 13, color: greyuserinfo, fontWeight: FontWeight.w800),
                            ),
                            Spacer(),
                            Text(
                              'ยี่ห้อ, วัสดุ, ฟังก์ชั่น, ...',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Image.asset('assets/icons/rightarrow.png')
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        CustomDivider(
                          heightFactor: size.height * 0.0000005,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          'เงื่อนไขการใช้งาน',
                          style: TextStyle(fontSize: 13, color: greyuserinfo, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'การขนส่ง',
                                  style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: size.width * 0.01),
                                Expanded(
                                  child: Align(
                                    child: SizedBox(
                                      height: size.height * 0.045,
                                      width: size.width * 0.55,
                                      child: Text(
                                        'จาก Quzhou, Zhejiang ถึง รับประกันการจัดส่ง 48 ชั่วโมง ',
                                        style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                              ],
                            ),
                            SizedBox(height: size.height * 0.01),
                            Row(
                              children: [
                                Text(
                                  'บริการ',
                                  style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: size.width * 0.05),
                                Expanded(
                                  child: Align(
                                    child: SizedBox(
                                      height: size.height * 0.045,
                                      width: size.width * 0.55,
                                      child: Text(
                                        'คืนสินค้าใน 7 วัน, ได้รับการชดเชยหากจัดส่งล่าช้า, คืนเงินไว',
                                        style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                              ],
                            ),
                            SizedBox(height: size.height * 0.01),
                            Row(
                              children: [
                                Text(
                                  'ข้อมูลจำเพาะ',
                                  style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: size.width * 0.06),
                                Expanded(
                                  child: Text(
                                    'มีให้เลือก 10 สี',
                                    style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        CustomDivider(
                          heightFactor: size.height * 0.0000005,
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Image.network('https:${itemTaobao!['pic_url']}'),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'แสดงเพิ่มเติม',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Image.asset('assets/icons/downarrow.png')
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.02, left: size.width * 0.05),
                    child: Row(
                      children: [
                        Text(
                          'สินค้าที่เยี่ยมชมล่าสุด',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
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
                                    press: () async {
                                      await getDetailItem(num_iid: item[index].num_iid!, type: widget.type);
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => Itempage(
                                      //       size: MediaQuery.of(context).size,
                                      //       title: listProducts[index]['detail'],
                                      //       price: (listProducts[index]['price'] as num).toDouble(),
                                      //       products: listProducts[index],
                                      //       press: () {},
                                      //       num_iid: widget.num_iid,
                                      //       type: widget.type,
                                      //       name: widget.name,
                                      //     ),
                                      //   ),
                                      // );
                                    },
                                  )),
                        ),
                ],
              ),
      ),
      bottomNavigationBar: SizedBox(
        // height: size.height * 0.099,
        child: BottomAppBar(
          color: white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: size.width * 0.03, top: size.height * 0.001),
                  child: TextButton(
                    onPressed: () => _onItemTapped(0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/Group2.png',
                          height: size.height * 0.02,
                          color: _selectedIndex == 0 ? Colors.black : Colors.black,
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          'หมวดสินค้า',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: _selectedIndex == 0 ? Colors.black : Colors.black, fontSize: 9),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // VerticalDivider(
              //   color: Colors.grey,
              //   thickness: 1,
              // ),
              Container(
                height: size.height * 0.10,
                width: size.width * 0.001,
                color: Colors.grey,
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: size.width * 0.01),
                  child: TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (BuildContext context) {
                          return ProductDetailsBottomSheet(
                            product: itemTaobao!,
                            buttonLabel: 'เพิ่มลงรถเข็น',
                            onChange: (value) {},
                            onButtonPress: () async {
                              // เก็บข้อมูล
                              saveJson(itemTaobao!, widget.type, widget.categorySelect.name!); // jsonData คือข้อมูล JSON ที่ให้มา
                              //await context.read<HomeController>().addProductsToCart(itemTaobao!);
                              // showDialog(
                              //   context: context,
                              //   builder: (BuildContext context) {
                              //     return AlertDialog(
                              //       shape: RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(20),
                              //       ),
                              //       contentPadding: EdgeInsets.symmetric(vertical: 24),
                              //       content: Column(
                              //         mainAxisSize: MainAxisSize.min,
                              //         children: <Widget>[
                              //           Image.asset(
                              //             'assets/icons/addcart.png',
                              //             height: 60,
                              //           ),
                              //           SizedBox(height: size.height * 0.01),
                              //           Text(
                              //             'เพิ่มสินค้าในรถเข็น\nเรียบร้อยแล้ว',
                              //             textAlign: TextAlign.center,
                              //             style: TextStyle(
                              //               fontSize: 16,
                              //               fontWeight: FontWeight.bold,
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     );
                              //   },
                              // );
                              // Future.delayed(Duration(seconds: 1), () {
                              //   Navigator.of(context).pop();
                              //   Navigator.of(context).pop();
                              // });
                            },
                          );
                        },
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/addtocart.png',
                          height: size.height * 0.03,
                          color: _selectedIndex == 0 ? Colors.black : Colors.black,
                        ),
                        // SizedBox(
                        //   height: size.height * 0.002,
                        // ),
                        Text(
                          'เพิ่มลงรถเข็น',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(color: _selectedIndex == 1 ? Colors.black : Colors.black, fontSize: 9),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: red1,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (BuildContext context) {
                          return ProductDetailsBottomSheet(
                            product: itemTaobao!, // ส่งข้อมูลสินค้า
                            buttonLabel: 'ซื้อสินค้า', // แสดงข้อความปุ่มเป็น "ซื้อสินค้า"
                            onChange: (val) {
                              setState(() {
                                amount = val;
                              });
                            },
                            onButtonPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Confirmorderpage(
                                          products: itemTaobao!,
                                          name: itemTaobao!['title'],
                                          type: widget.type,
                                          num_iid: itemTaobao!['num_iid'],
                                          amount: amount,
                                        )),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Center(
                      child: Text(
                        'ซื้อสินค้า', // ข้อความบนปุ่ม
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
