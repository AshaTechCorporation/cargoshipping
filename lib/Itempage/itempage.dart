import 'package:cargoshipping/Itempage/widgets/iamgesitem.dart';
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
            icon: Icon(Icons.ios_share),
            onPressed: () {
              // Action when the icon is pressed
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
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
            // Your existing content here
            imagesItem(),
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
                    'assets/images/bear.jpg',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    'assets/images/bear.jpg',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    'assets/images/bear.jpg',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  '${widget.products['price']} บาท',
                  style: TextStyle(
                      fontSize: 33,
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
            SizedBox(height: 1),
            Text(
              '${widget.products['detail']}',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
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
                          'รายละเอียดสินค้า',
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
                        Icon(Icons.messenger_outline_sharp,
                            color: _selectedIndex == 0
                                ? Colors.black
                                : Colors.black),
                        Text(
                          'แชทกับ TEG',
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
                        Icon(Icons.shopping_cart_outlined,
                            color: _selectedIndex == 1
                                ? Colors.black
                                : Colors.black),
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
              Container(
                width: 1,
                height: 60,
                color: Colors.grey,
              ),
              Expanded(
                flex: 2, // Increase the size of this button
                child: Container(
                  color: Colors.red,
                  child: TextButton(
                    onPressed: () => _onItemTapped(2),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
