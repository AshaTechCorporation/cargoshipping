import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Allproduct extends StatefulWidget {
  @override
  _AllproductState createState() => _AllproductState();
}

class _AllproductState extends State<Allproduct>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'หมวดหมู่สินค้าทั้งหมด',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Row(
        children: [
          // Custom TabBar on the left
          Container(
            width: size.width * 0.29,
            color: Colors.white,
            child: ListView(
              children: [
                _buildTabItem('เสื้อผ้า', 'assets/icons/clothmock.png', 0),
                _buildTabItem('เครื่องประดับ', 'assets/icons/bagmock.png', 1),
                _buildTabItem('อุปกรณ์กีฬา', 'assets/icons/bagmock.png', 2),
                _buildTabItem('สินค้าคู่เด็ก', 'assets/icons/bagmock.png', 3),
              ],
            ),
          ),

          // Main Content for each tab
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IndexedStack(
                index: selectedIndex,
                children: [
                  _buildClothingSection(),
                  Center(child: Text('เครื่องประดับ')),
                  Center(child: Text('อุปกรณ์กีฬา')),
                  Center(child: Text('สินค้าคู่เด็ก')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, String imagePath, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onTabTapped(index),
      child: Container(
        color: isSelected ? background : Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: 40,
              height: 40,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClothingSection() {
    return ListView(
      children: listallProducts.map((section) {
        return _buildSection(
          section['category'],
          section['products'],
        );
      }).toList(),
    );
  }

  Widget _buildSection(String title, List<Map<String, String>> items) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.only(left: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              physics: NeverScrollableScrollPhysics(),
              children: items.map((item) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // แสดงภาพจาก assets
                    Image.asset(
                      item['image']!, // ดึงภาพจากแผนที่ตามชื่อ item
                      width: size.width * 0.9, // กำหนดขนาดภาพ
                      height: size.height * 0.063,
                    ),
                    SizedBox(
                        height: size.height *
                            0.006), // ระยะห่างระหว่างรูปกับข้อความ
                    // แสดงข้อความใต้ภาพ
                    Text(
                      item['name']!,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
