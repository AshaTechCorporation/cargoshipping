import 'dart:developer';
import 'package:cargoshipping/Itempage/itempage.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/detailproduct.dart';
import 'package:cargoshipping/home/searchPage.dart';
import 'package:cargoshipping/home/services/homeApi.dart';
import 'package:cargoshipping/home/widgets/OurItem.dart';
import 'package:cargoshipping/home/widgets/OurServicesWidget.dart';
import 'package:cargoshipping/home/widgets/Servicedetail.dart';
import 'package:cargoshipping/home/widgets/importrate.dart';
import 'package:cargoshipping/home/widgets/importwidget.dart';
import 'package:cargoshipping/home/widgets/payment.dart';
import 'package:cargoshipping/home/widgets/reportpage.dart';
import 'package:cargoshipping/home/widgets/shippingcalpage.dart';
import 'package:cargoshipping/models/categories.dart';
import 'package:cargoshipping/widgets/LoadingDialog.dart';
import 'package:cargoshipping/widgets/PictureSliderWidget.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getlistCategories(name: items[0]);
    });
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.11),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          child: AppBar(
            backgroundColor: Colors.red,
            toolbarHeight: size.height * 0.099,
            title: Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: size.height * 0.045,
                    width: size.width * 0.85,
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 122, 124, 126)),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.35,
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'ค้นหาสินค้า',
                                contentPadding:
                                    EdgeInsets.only(left: 15, bottom: 10),
                              ),
                            ),
                          ),
                          Icon(Icons.camera_alt_outlined),
                          VerticalDivider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                            width: size.width * 0.2,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'เลือกสินค้า',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.red,
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
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
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
                                buttonStyleData: const ButtonStyleData(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  height: 40,
                                  width: 140,
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.001,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Implement navigation to Search page here
                            },
                            child: Container(
                              height: size.height * 0.05,
                              width: size.width * 0.17,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.red,
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
                  Icon(Icons.favorite_border_outlined),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: size.height * 0.01),
                    // แสดงภาพสไลด์
                    PictureSliderWidget(size: size),
                    SizedBox(
                      height: size.height *
                          0.07, // เว้นพื้นที่สำหรับ Widget ที่ทับอยู่ด้านบน
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                  ],
                ),
                Positioned(
                    bottom: size.height *
                        0.03,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        fistpagewidget.length,
                        (index) => Importwidget(
                          size: size,
                          title: fistpagewidget[index],
                          press: () {},
                        ),
                      ),
                    ))
              ],
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
                      if (index == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReportProblemPage()),
                        );
                      }
                      if (index == 6) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Shippingcalpage(),
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
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'อัตราเงินประจำวัน',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
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
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              // color: red1,
              width: size.width * 0.93,
              height: size.height * 0.42,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ที่อยู่รับพัสดุ',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
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
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15),
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
                                side: BorderSide(color: red1, width: 1),
                              ),
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
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15),
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
                                side: BorderSide(color: red1, width: 1),
                              ),
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
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02, horizontal: size.width * 0.035),
              child: Row(
                children: [
                  Text(
                    'หมวดหมู่สินค้า',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(), // เว้นที่ระหว่างข้อความ
                  Text('หมวดหมู่ทั้งหมด')
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
                                color: Colors.red,
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
          ],
        ),
      ),
    );
  }
}
