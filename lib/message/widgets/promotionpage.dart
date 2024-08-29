import 'package:cargoshipping/message/widgets/promotion2page.dart';
import 'package:flutter/material.dart';

class Promotionpage extends StatefulWidget {
  const Promotionpage({super.key});

  @override
  State<Promotionpage> createState() => _PromotionpageState();
}

class _PromotionpageState extends State<Promotionpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('บทความ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
      ),
      body: Container(
        color: Colors.grey[300],
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Promotion2page(),
                    ),
                  );
                  },
                  child: Image.asset(
                    'assets/images/pro1.png',
                    height: 221,
                    width: 358,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Image.asset(
                  'assets/images/pro2.png',
                  height: 221,
                  width: 358,
                ),
                SizedBox(
                  height: 7,
                ),
                Image.asset(
                  'assets/images/pro3.png',
                  height: 221,
                  width: 358,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
