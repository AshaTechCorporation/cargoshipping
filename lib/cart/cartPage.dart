import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('สินค้าในรถเข็น'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.02,),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_rounded, size: 30, color: Colors.red,)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}