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
        elevation: 0,
         bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[300],
            height: size.height * 0.001,
          ),
        ),
        title: Text(
          'บทความ',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTabItem(0, "TAG 1"),
                _buildTabItem(1, "TAG 2"),
                _buildTabItem(2, "TAG 3"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTagContent(size),
                _buildTagContent(size),
                _buildTagContent(size),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: size.height * 0.07,
        color: Colors.white,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/redstar.png'),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Text(
                  'ติดตามบทความใหม่ๆ ได้ที่นี่',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Image.asset('assets/images/redstar.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(int index, String title) {
    final size = MediaQuery.of(context).size;
    bool isSelected = _tabController.index == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _tabController.index = index;
        });
      },
      child: Container(
        height: size.height * 0.04,
        width: size.width * 0.29,
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isSelected ? red1 : Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : greyuserinfo,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
          'THC Charge รู้ไว้ก่อน! ค่าใช้จ่ายเบื้องหลังใบขนสินค้านำเข้า',
          '24 กรกฎาคม 2567',
        ),
        SizedBox(height: 8),
        _buildCard(
          size,
          'assets/images/tag2.png',
          '3 เอกสารสำคัญเมื่อใบขนสินค้าจากจีนที่จำเป็นต้องมี',
          '24 กรกฎาคม 2567',
        ),
        SizedBox(height: 8),
        _buildCard(
          size,
          'assets/images/tag3.png',
          'สิ่งที่ควรรู้ก่อนสั่งซื้อสินค้าเกี่ยวกับใบขนส่งสินค้า',
          '24 กรกฎาคม 2567',
        ),
        SizedBox(height: 8),
        _buildCard(
          size,
          'assets/images/tag1.png',
          'THC Charge รู้ไว้ก่อน! ค่าใช้จ่ายเบื้องหลังใบขนสินค้านำเข้า',
          '24 กรกฎาคม 2567',
        ),
        SizedBox(height: 8),
        _buildCard(
          size,
          'assets/images/tag2.png',
          '3 เอกสารสำคัญเมื่อใบขนสินค้าจากจีนที่จำเป็นต้องมี',
          '24 กรกฎาคม 2567',
        ),
        SizedBox(height: 8),
        _buildCard(
          size,
          'assets/images/tag3.png',
          'สิ่งที่ควรรู้ก่อนสั่งซื้อสินค้าเกี่ยวกับใบขนส่งสินค้า',
          '24 กรกฎาคม 2567',
        ),
      ],
    );
  }

  Widget _buildCard(Size size, String imagePath, String title, String date) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(15)),
            child: Image.asset(
              imagePath,
              height: size.height * 0.1,
              width: size.height * 0.1,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    date,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
