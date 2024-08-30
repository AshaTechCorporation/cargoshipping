import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Itemfav extends StatefulWidget {
  const Itemfav({super.key});

  @override
  State<Itemfav> createState() => _ItemfavState();
}

class _ItemfavState extends State<Itemfav> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'รายการโปรด',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: size.height * 0.27,
              child: Card(
                color: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '1688严选店',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                          Text('ลบ',style: TextStyle(
                            color: greyuserinfo
                          ),)
                        ],
                      ),
                      Divider(), // เส้นแบ่งระหว่างชื่อร้านและรายการสินค้า
                      _buildProductItem(
                        context,
                        'ชั้นวางพลาสติกในครัว, ชั้นวางของในห...',
                        '¥4.88',
                      ),
                      Divider(), // เส้นแบ่งระหว่างสินค้าชิ้นแรกและชิ้นที่สอง
                      _buildProductItem(
                        context,
                        'ชั้นวางพลาสติกในครัว, ชั้นวางของในห...',
                        '¥4.88',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.5,
          ),
          Center(
            child: Container(
              height: size.height * 0.057,
              width: size.width * 0.95,
              decoration: BoxDecoration(
                  color: red1, borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'เพิ่มสินค้าที่เลือกไปยังรถเข็น',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: white,
                        fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, String title, String price) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            height: 60,
            width: 60,
            color: Colors.grey[300], // เปลี่ยนภาพเป็น Container สีเทา
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Text(
                price,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 16),
        Column(
          children: [
            Text(
              'ลบ',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Image.asset(
              'assets/icons/shoppingbutton.png',
              width: size.width * 0.12,
              height: size.height * 0.044,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ],
    );
  }
}
