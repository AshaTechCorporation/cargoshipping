import 'package:cargoshipping/Itempage/confirmorderpage.dart';
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
        title: Text(
          'สั่งซื้อสินค้า',
          style: TextStyle(color: Colors.black),
        ),
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
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (BuildContext context) {
                          final size = MediaQuery.of(context).size;
                          return DraggableScrollableSheet(
                            expand: false,
                            initialChildSize:
                                0.8, // ความสูงเริ่มต้นที่ 80% ของหน้าจอ
                            minChildSize: 0.4, // ความสูงต่ำสุดที่ 40% ของหน้าจอ
                            maxChildSize: 0.9, // ความสูงสูงสุดที่ 90% ของหน้าจอ
                            builder: (context, scrollController) {
                              return SingleChildScrollView(
                                controller: scrollController,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // ส่วนแสดงภาพและราคา
                                      Row(
                                        children: [
                                          Container(
                                            height: size.height * 0.08,
                                            width: size.height * 0.1,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.grey[200],
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.asset(
                                                widget.products['image'],
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: size.width * 0.04),
                                          Text(
                                            '¥ ${widget.products['price']}',
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16),

                                      // ส่วนเลือกสี
                                      Text(
                                        'สี',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 8),
                                      Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        children: [
                                          _buildColorOption('สีธูปแดง'),
                                          _buildColorOption('สีขาวมวล'),
                                          _buildColorOption('สีน้ำตาลอ่อน'),
                                          _buildColorOption('สีเทาอ่อน'),
                                          _buildColorOption('สีนอร์ดิกบลู'),
                                        ],
                                      ),
                                      SizedBox(height: 16),

                                      // ตัวเลือกข้อมูล
                                      _buildOptionRow('ตัวเลือก', 'ข้อมูล'),
                                      _buildOptionRow('ตัวเลือก', 'ข้อมูล'),
                                      SizedBox(height: 16),

                                      // ส่วนเลือกจำนวนสินค้า
                                      _buildQuantitySelector(size),
                                      SizedBox(height: 16),

                                      // บริการเสริม
                                      Text(
                                        'บริการเสริม',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 8),
                                      Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        children: [
                                          _buildServiceOption(
                                              'ตีลังไม้', 'เริ่มต้น ¥500/CBM'),
                                          _buildServiceOption('พันห่อด้วยเทป',
                                              'เริ่มต้น ¥50/CBM'),
                                          _buildServiceOption(
                                              'ตรวจ QC สินค้า', '¥25/กล่อง'),
                                        ],
                                      ),
                                      SizedBox(height: 16),

                                      // รายละเอียดราคา
                                      _buildPriceDetails(),
                                      SizedBox(
                                        height: size.height * 0.06,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Confirmorderpage()));
                                        },
                                        child: Center(
                                          child: Container(
                                            height: size.height * 0.067,
                                            width: size.width * 0.8,
                                            decoration: BoxDecoration(
                                                color: red1,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'ซื้อสินค้า',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: white,
                                                      fontSize: 16),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
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
}

Widget _buildColorOption(String colorName) {
  return Column(
    children: [
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      SizedBox(height: 4),
      Text(colorName, style: TextStyle(fontSize: 12)),
    ],
  );
}

Widget _buildOptionRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 16)),
        Text(value, style: TextStyle(fontSize: 16)),
      ],
    ),
  );
}

Widget _buildQuantitySelector(Size size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('จำนวน'),
      Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.remove),
          ),
          Text(
            '50',
            style: TextStyle(fontSize: 16),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
    ],
  );
}

Widget _buildServiceOption(String title, String price) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.red),
    ),
    child: Column(
      children: [
        Text(title, style: TextStyle(fontSize: 14, color: Colors.red)),
        SizedBox(height: 4),
        Text(price, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    ),
  );
}

Widget _buildPriceDetails() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('จำนวนสินค้า 50 ชิ้น', style: TextStyle(fontSize: 16)),
      Text('¥11.19 (~฿55.56)',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    ],
  );
}
