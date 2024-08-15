import 'package:flutter/material.dart';

class Ouritem extends StatelessWidget {
  const Ouritem(
      {super.key,
      required this.detail,
      required this.image,
      required this.press,
      required this.price,
      required this.sale,
      required this.send,
      required this.size,});

  final Size size;
  final String image;
  final String detail;
  final String send;
  final String sale;
  final double price;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: size.width * 0.44,
        height: size.height * 0.28,
        decoration: BoxDecoration(
          //color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                '${image}',
                fit: BoxFit.fill,
                height: size.height * 0.14,
                width: double.infinity,
              ),
            ),
            Text(
              '$detail',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '¥ ${price}',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Set the text color to red
                  ),
                ),
                Text('จัดส่ง ${send}',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey
                ),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text('ขายแล้ว ${sale} ใน 30 วัน',
              style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey
                ),)],
            ),
          ],
        ),
      ),
    );
  }
}
