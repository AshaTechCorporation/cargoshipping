import 'package:cargoshipping/account/widgets/accsetting.dart';
import 'package:cargoshipping/account/widgets/guidepage.dart';
import 'package:cargoshipping/account/widgets/itemfav.dart';
import 'package:cargoshipping/account/widgets/ordersumpage.dart';
import 'package:cargoshipping/account/widgets/tagpage.dart';
import 'package:cargoshipping/account/widgets/transportpage.dart';
import 'package:cargoshipping/account/widgets/wecargo.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/message/messagePage.dart';
import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
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
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Ordersumpage()));
              }
              if (index == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Transportpage()));
              }
              if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Itemfav(),
                  ),
                );
              }
              if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TagsPage(

                    ),
                  ),
                );
              }
              if (index == 4) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Guidepage(

                    ),
                  ),
                );
              }
              if (index == 5) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MessagePage()));
              }
              if (index == 6) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MessagePage()));
              }
              if (index == 7) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Wecargo()));
              }
              if (index == 8) {
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
