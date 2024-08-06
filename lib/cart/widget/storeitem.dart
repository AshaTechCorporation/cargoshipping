import 'package:cargoshipping/cart/widget/productitem.dart';
import 'package:flutter/material.dart';

class StoreItem extends StatelessWidget { //ชื่อร้านค้า
  final String storeName;

  StoreItem({required this.storeName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            storeName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        for (int i = 0; i < 3; i++) ProductItem(),
      ],
    );
  }
}