import 'package:cargoshipping/All_product_categories/widget/ShoppingCategories.dart';
import 'package:cargoshipping/All_product_categories/widget/product.dart';
import 'package:cargoshipping/Itempage/itempage.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/OurItem.dart';
import 'package:flutter/material.dart';

class EachCategory extends StatefulWidget {
  final String category;

  const EachCategory({Key? key, required this.category}) : super(key: key);

  @override
  State<EachCategory> createState() => _EachCategoryState();
}

class _EachCategoryState extends State<EachCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เสื้อผ้า'),
      ),
      body: ShoppingCategories(),
    );
  }
}


