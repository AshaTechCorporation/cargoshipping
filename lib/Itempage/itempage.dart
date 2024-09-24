import 'package:cargoshipping/Itempage/confirmorderpage.dart';
import 'package:cargoshipping/Itempage/widgets/bottomsheetswidget.dart';
import 'package:cargoshipping/Itempage/widgets/iamgesitem.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/OurItem.dart';
import 'package:flutter/material.dart';

class itempage extends StatefulWidget {
  const itempage(
      {super.key,
      required this.size,
      required this.title,
      required this.price,
      required this.press,
      required this.products});

  final Size size;
  final String title;
  final double price;
  final VoidCallback press;
  final Map<String, dynamic> products;

  @override
  State<itempage> createState() => _itempageState();
}

class _itempageState extends State<itempage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle item tap
    print('Selected index: $index');
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
            onPressed: () {
              // Action when the icon is pressed
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: white,
              child: Column(
                children: [
                  ImagesItem(
                    products: widget.products,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: widget.size.height * 0.005,
                        horizontal: widget.size.width * 0.01),
                    child: Row(
                      children: [
                        Text('3 ตัวเลือกสินค้า'),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      SizedBox(width: widget.size.width * 0.028),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          widget
                              .products['image'], // ใช้ภาพเดียวกันจาก products
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          widget
                              .products['image'], // ใช้ภาพเดียวกันจาก products
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          widget
                              .products['image'], // ใช้ภาพเดียวกันจาก products
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 9.0),
                    child: Row(
                      children: [
                        Text(
                          '${widget.products['price']} บาท',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        //Text('(${widget.products['price']} บาท)'),
                        Spacer(),
                        Text(
                          'ขายแล้ว ${widget.products['sale']} ชิ้น',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: size.width * 0.01),
                        Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 9.0),
                    child: Text(
                      '${widget.products['detail']}',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: size.height * 0.001),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: widget.size.height * 0.001,
                          horizontal: widget.size.width * 0.028),
                      child: Row(
                        children: [
                          Text(
                            'MakeMixue.store',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[900]),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.001),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: widget.size.height * 0.001,
                        horizontal: widget.size.width * 0.028),
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
                    padding: EdgeInsets.symmetric(
                        vertical: widget.size.height * 0.001,
                        horizontal: widget.size.width * 0.028),
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
                                style: TextStyle(
                                    color: greyuserinfo,
                                    fontWeight: FontWeight.bold),
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
            Container(
              height: size.height * 0.40,
              width: size.width * 0.95,
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(25)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'อัตราแลกเปลี่ยน ณ วันที่ 00 ส.ค. 00 (00:00:00)',
                    style: TextStyle(
                        color: Colors.blue[800], fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '4.8851 หยวนจีนต่อบาทไทย',
                    style: TextStyle(
                        color: Colors.blue[800], fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: skyorange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ราคาสินค้าอาจคลาดเคลื่อนกับเว็บไซต์ต้นทาง',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: red1,
                              fontSize: 13),
                        ),
                        Text(
                          'ระบบจะแสดงราคาสินค้าที่ต้องชำระหลังออเดอร์ตรวจสอบแล้ว',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: red1,
                              fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'ขั้นตอนการชำระ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              _buildIconWithLine(
                                  size, 'assets/icons/step1.png'),
                              _buildDividerLine(size),
                              _buildIconWithLine(
                                  size, 'assets/icons/step2.png'),
                              _buildDividerLine(size),
                              _buildIconWithLine(
                                  size, 'assets/icons/step3.png'),
                            ],
                          ),
                          SizedBox(width: size.width * 0.02),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: size.height * 0.005),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: _buildStepText(
                                    'รอเจ้าหน้าที่ตรวจสอบหลังจากทำการสั่งซื้อ',
                                  ),
                                ),
                                SizedBox(height: size.height * 0.044),
                                Align(
                                  alignment: Alignment
                                      .centerLeft, // จัดข้อความให้อยู่ทางซ้าย
                                  child: _buildStepText(
                                    'ชำระค่าขนส่งในจีน และค่าสินค้าแก่ Supplier',
                                  ),
                                ),
                                SizedBox(height: size.height * 0.042),
                                Align(
                                  alignment: Alignment
                                      .centerLeft, // จัดข้อความให้อยู่ทางซ้าย
                                  child: _buildStepText(
                                    'ชำระค่าขนส่งจากจีนถึงไทย และการจัดส่งในไทย',
                                  ),
                                ),
                              ],
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
              height: size.height * 0.02,
            ),
            Container(
              width: size.width * 0.95,
              height: size.height * 0.28,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: pinkmess),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/icons/hello.png'),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text(
                          'ข้อจำกัดการรับผิดชอบ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: oldred),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Text(
                      'TEG Cargo เป็นเพียงผู้ช่วยในการสั่งซื้อสินค้ากับร้านค้าจีนตามราย การสินค้าที่ลูกค้าเปิดออเดอร์สั่งซื้อมาเท่านั้นในกรณีที่สินค้ามีปัญหา เช่น ด้านคุณภาพสินค้า สินค้าผิดสเปก หรือปัญหาใน ด้านอื่นๆ ทาง TEG Cargo จะช่วยประสานงานกับทางร้านค้าจีนเพื่อเจรจาให้ ร้านค้า จีนรับผิดชอบต่อความเสียหายต่างๆที่เกิดขึ้น เนื่องจาก TEG Cargo เป็นเพียงผู้ช่วยสั่งซื้อสินค้าเท่านั้น และไม่สามารถรับผิดชอบต่อความ เสียหายต่างๆ ที่เกิดขึ้นจากร้านค้าจีนได้',
                      style:
                          TextStyle(color: oldred, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
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
                        style: TextStyle(
                            fontSize: 13,
                            color: greyuserinfo,
                            fontWeight: FontWeight.w800),
                      ),
                      Spacer(),
                      Text(
                        'ยี่ห้อ, วัสดุ, ฟังก์ชั่น, ...',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w900),
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
                  Text(
                    'เงื่อนไขการใช้งาน',
                    style: TextStyle(
                        fontSize: 13,
                        color: greyuserinfo,
                        fontWeight: FontWeight.w800),
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
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Align(
                              child: SizedBox(
                                height: size.height * 0.045,
                                width: size.width * 0.55,
                                child: Text(
                                  'จาก Quzhou, Zhejiang ถึง รับประกันการจัดส่ง 48 ชั่วโมง ',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 16, color: Colors.grey),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      Row(
                        children: [
                          Text(
                            'บริการ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: size.width * 0.05),
                          Expanded(
                            child: Align(
                              child: SizedBox(
                                height: size.height * 0.045,
                                width: size.width * 0.55,
                                child: Text(
                                  'คืนสินค้าใน 7 วัน, ได้รับการชดเชยหากจัดส่งล่าช้า, คืนเงินไว',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 16, color: Colors.grey),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      Row(
                        children: [
                          Text(
                            'การขนส่ง',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: size.width * 0.099),
                          Expanded(
                            child: Text(
                              'มีให้เลือก 10 สี',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 16, color: Colors.grey),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Image.asset('assets/images/Frame 100.png'),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('แสดงเพิ่มเติม'),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset('assets/icons/downarrow.png')
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13),
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
              height: 15,
            ),
            Wrap(
              spacing: 12,
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
                                size: MediaQuery.of(context).size,
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
      bottomNavigationBar: SizedBox(
        height: size.height * 0.108,
        child: BottomAppBar(
          color: white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: size.width * 0.01),
                  child: TextButton(
                    onPressed: () => _onItemTapped(0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/Group2.png',
                          height: 24,
                          width: 24,
                          color:
                              _selectedIndex == 0 ? Colors.black : Colors.black,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          'หมวดสินค้า',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: _selectedIndex == 0
                                  ? Colors.black
                                  : Colors.black,
                              fontSize: 12),
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
              SizedBox(
                width: size.width * 0.01,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: size.width * 0.01), // ขยับไปทางขวา 10 หน่วย
                  child: TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (BuildContext context) {
                          return ProductDetailsBottomSheet(
                            product: widget.products,
                            buttonLabel: 'เพิ่มลงรถเข็น',
                            onButtonPress: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          20),
                                    ),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 24),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/icons/addcart.png',
                                          height: 60,
                                        ),
                                        SizedBox(height: size.height * 0.01),
                                        Text(
                                          'เพิ่มสินค้าในรถเข็น\nเรียบร้อยแล้ว',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );

                              Future.delayed(Duration(seconds: 1), () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              });
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
                          height: size.height * 0.035,
                          width: size.width * 0.07,
                          color:
                              _selectedIndex == 0 ? Colors.black : Colors.black,
                        ),
                        SizedBox(
                          height: size.height * 0.003,
                        ),
                        Text(
                          'เพิ่มลงรถเข็น',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: _selectedIndex == 1
                                  ? Colors.black
                                  : Colors.black,
                              fontSize: 12),
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
                    color: Colors.red[700],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (BuildContext context) {
                          return ProductDetailsBottomSheet(
                            product: widget.products, // ส่งข้อมูลสินค้า
                            buttonLabel:
                                'ซื้อสินค้า', // แสดงข้อความปุ่มเป็น "ซื้อสินค้า"
                            onButtonPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Confirmorderpage()),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Center(
                      child: Text(
                        'ซื้อสินค้า', // ข้อความบนปุ่ม
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
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

  Widget _buildIconWithLine(Size size, String imagePath) {
    return Center(
      child: Image.asset(
        imagePath,
        width: size.width * 0.08,
        height: size.height * 0.04,
        color: Colors.orange,
      ),
    );
  }

  Widget _buildDividerLine(Size size) {
    return Container(
      width: 2,
      height: size.height * 0.02,
      color: Colors.orange,
    );
  }

  Widget _buildStepText(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
}
