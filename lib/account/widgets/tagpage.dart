import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class TagsPage extends StatefulWidget {
  const TagsPage({super.key});

  @override
  _TagsPageState createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'บทความ',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'TAG 1'),
            Tab(text: 'TAG 2'),
            Tab(text: 'TAG 3'),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.red,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTagContent(size),
          _buildTagContent(size),
          _buildTagContent(size),
        ],
      ),
    );
  }

 
   Widget _buildTagContent(Size size) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: [
        _buildCard(
          size,
          'assets/images/tag1.png',
          'สิ่งที่ควรรู้ก่อนสั่งซื้อสินค้าเกี่ยวกับใบขนส่งสินค้า',
          '24 กรกฎาคม 2567',
        ),
        SizedBox(height: 16),
        _buildCard(
          size,
          'assets/images/tag2.png',
          'รู้ไว้ก่อน! ค่าใช้จ่ายเบื้องหลังใบขนสินค้านำเข้า',
          '24 กรกฎาคม 2567',
        ),
        SizedBox(height: 16),
        _buildCard(
          size,
          'assets/images/tag3.png',
          '3 เอกสารสำคัญ เมื่อใบขนสินค้าจากจีนถึงไทยเป็นต้องมี',
          '24 กรกฎาคม 2567',
        ),
      ],
    );
  }

  Widget _buildCard(Size size, String imagePath, String title, String date) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imagePath,
              height: size.height * 0.2,
              width: double.infinity,
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Text(
                    date,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}