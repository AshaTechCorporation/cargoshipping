import 'package:cargoshipping/account/widgets/accsetting.dart';
import 'package:cargoshipping/account/widgets/summarysale.dart';
import 'package:cargoshipping/account/widgets/wecargo.dart';
import 'package:cargoshipping/message/messagePage.dart';
import 'package:cargoshipping/message/widgets/question.dart';
import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(imagePath: 'assets/icons/result.png', text: 'สมัครเป็นตัวแทน'),
    MenuItem(imagePath: 'assets/icons/result.png', text: 'สรุปยอดขาย'),
    MenuItem(imagePath: 'assets/icons/guide.png', text: 'คู่มือการใช้งาน'),
    MenuItem(imagePath: 'assets/icons/report.png', text: 'แจ้งเคลมสินค้า'),
    MenuItem(imagePath: 'assets/icons/help.png', text: 'ช่วยเหลือ'),
    MenuItem(imagePath: 'assets/icons/contact.png', text: 'ติดต่อเรา'),
    MenuItem(imagePath: 'assets/icons/setting.png', text: 'ตั้งค่า'),
  ];

  MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: ListTile.divideTiles(
        context: context,
        tiles: menuItems.map((item) {
          int index = menuItems.indexOf(item);
          return ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: 16, vertical: 0), // ลด vertical padding ให้เหลือ 0
            leading: Image.asset(
              item.imagePath,
              width: 25,
              height: 25,
            ),
            title: Text(
              item.text,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Question(),
                  ),
                );
              }
              if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Summarysale(),
                  ),
                );
              }
              if (index == 3) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MessagePage()));
              }
              if (index == 4) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MessagePage()));
              }
              if (index == 5) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Wecargo()));
              }
              if (index == 6) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Accsetting(
                              title: item.text,
                            )));
              }
            },
          );
        }).toList(),
      ).toList(),
    );
  }
}

class MenuItem {
  final String imagePath;
  final String text;

  MenuItem({required this.imagePath, required this.text});
}
