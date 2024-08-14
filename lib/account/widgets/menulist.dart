import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(imagePath: 'assets/icons/result.png', text: 'สมัครเป็นตัวแทน'),
    MenuItem(imagePath: 'assets/icons/result.png', text: 'สรุปยอดขาย'),
    MenuItem(imagePath: 'assets/icons/guide.png', text: 'คู่มือการใช้งาน'),
    MenuItem(imagePath: 'assets/icons/report.png', text: 'แจ้งเคลมสินค้า'),
    MenuItem(imagePath: 'assets/icons/contact.png', text: 'ช่วยเหลือ'),
    MenuItem(imagePath: 'assets/icons/setting.png', text: 'ติดต่อเรา'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // ปรับขนาดตามจำนวนรายการ
      physics: NeverScrollableScrollPhysics(), // ปิดการเลื่อนของ ListView
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return ListTile(
          leading: Image.asset(
            item.imagePath,
            width: 30, // ปรับขนาดภาพ
            height: 30,
          ),
          title: Text(item.text),
          onTap: () {
            // เพิ่มการทำงานเมื่อคลิกที่รายการ
          },
        );
      },
    );
  }
}

class MenuItem {
  final String imagePath;
  final String text;

  MenuItem({required this.imagePath, required this.text});
}
