import 'package:cargoshipping/account/widgets/accsetting.dart';
import 'package:cargoshipping/account/widgets/wecargo.dart';
import 'package:cargoshipping/message/messagePage.dart';
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return ListTile(
          leading: Image.asset(
            item.imagePath,
            width: 20,
            height: 20,
          ),
          title: Text(
            item.text,
            style: TextStyle(fontSize: 13),
          ),
          onTap: () {
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
      },
    );
  }
}

class MenuItem {
  final String imagePath;
  final String text;

  MenuItem({required this.imagePath, required this.text});
}
