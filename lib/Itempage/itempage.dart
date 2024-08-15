import 'package:cargoshipping/Itempage/widgets/iamgesitem.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/OurItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('สั่งซื้อสินค้า'),
        // backgroundColor: Colors.grey,
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
                    widget.products['image'], // ใช้ภาพเดียวกันจาก products
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    widget.products['image'], // ใช้ภาพเดียวกันจาก products
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    widget.products['image'], // ใช้ภาพเดียวกันจาก products
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
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
                  SizedBox(width: 15),
                  //Text('(${widget.products['price']} บาท)'),
                  Spacer(),
                  Text(
                    'ขายแล้ว ${widget.products['sale']} ชิ้น',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.red,
                  )
                ],
              ),
            ),
            SizedBox(height: 1),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.0),
              child: Text(
                '${widget.products['detail']}',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            SizedBox(height: 1),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: widget.size.height * 0.001,
                    horizontal: widget.size.width * 0.028),
                child: Row(
                  children: [
                    Text(
                      'MakeMixue.store',
                      style: TextStyle(fontSize: 15, color: Colors.grey[900]),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: widget.size.height * 0.007),
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
                          'รับประกันการจัดส่ง',
                          style: TextStyle(
                            fontSize: 17,
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
            SizedBox(height: 5),
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
                          'ข้อมูลเฉพาะ',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'ยี่ห้อ, วัสดุ, น้ำหนัก,...',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Icon(Icons.arrow_forward_sharp)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft, // จัดตำแหน่งให้ชิดซ้าย
              padding: EdgeInsets.all(16.0), // เพิ่ม padding ถ้าต้องการ
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // จัดตำแหน่งให้ชิดซ้าย
                children: [
                  Text(
                    'เงื่อนไขการใช้งาน',
                    style: TextStyle(fontSize: 13),
                  ),
                  SizedBox(height: 8), // เพิ่มระยะห่างระหว่างข้อความ
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Adjust alignment as needed
                    children: [
                      Text(
                        'การขนส่ง',
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        'จาก Quzhou, Zhejiang ถึง',
                        style: TextStyle(fontSize: 13),
                      ),
                      Image.asset(
                        'assets/icons/Vector.png',
                        height: 15,
                        width: 9,
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      'รับประกันการจัดส่ง 48 ชั่วโมง',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Adjust alignment as needed
                    children: [
                      Text(
                        'บริการ',
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        'คืนสินค้าใน 7 วัน',
                        style: TextStyle(fontSize: 13),
                      ),
                      Image.asset(
                        'assets/icons/Vector.png',
                        height: 15,
                        width: 9,
                      ),
                    ],
                  ),
                  Center(
                    child: Text('ได้รับการชดเชยหากจัดส่งล่าช้า, คืนเงินไว'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Adjust alignment as needed
                    children: [
                      Text(
                        'ข้อมูลจำเพาะ',
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        'มีให้เลือก 10 สี',
                        style: TextStyle(fontSize: 13),
                      ),
                      Image.asset(
                        'assets/icons/Vector.png',
                        height: 15,
                        width: 9,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    child: Text(
                      'สินค้าที่เยี่ยมชมล่าสุด',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
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
                              price: (listProducts[index]['price'] as num)
                                  .toDouble(),
                              detail: listProducts[index]['detail'],
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => itempage(
                                      size: MediaQuery.of(context).size,
                                      title: listProducts[index]['detail'],
                                      price:
                                          (listProducts[index]['price'] as num)
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
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: TextButton(
                    onPressed: () => _onItemTapped(0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/Group2.png', // Replace with your image asset path
                          height: 24, // Adjust the height as needed
                          width: 24, // Adjust the width as needed
                          color:
                              _selectedIndex == 0 ? Colors.black : Colors.black,
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
              VerticalDivider(
                color: Colors.grey,
                thickness: 1,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 10.0), // ขยับไปทางขวา 10 หน่วย
                  child: TextButton(
                    onPressed: () => _onItemTapped(1),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/cart.png', // Replace with your image asset path
                          height: 24, // Adjust the height as needed
                          width: 24, // Adjust the width as needed
                          color:
                              _selectedIndex == 0 ? Colors.black : Colors.black,
                        ),
                        Text(
                          'เพิ่มลงรถเข็น',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: _selectedIndex == 1
                                  ? Colors.black
                                  : Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2, // Increase the size of this button
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red[700],
                    borderRadius: BorderRadius.circular(
                        20), // Adjust the radius as needed
                  ),
                  child: TextButton(
                    onPressed: () => _onItemTapped(2),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        'ซื้อสินค้า',
                        style: TextStyle(
                          color: _selectedIndex == 2
                              ? Colors.black
                              : const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
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
}
