import 'package:cargoshipping/Itempage/itempage.dart';
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
      required this.size});

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
            Text('$detail', maxLines: 2, overflow: TextOverflow.ellipsis,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('¥ ${price}'),
                Text('จัดส่ง ${send}')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('ขายแล้ว ${sale}')
              ],
            ),

            // SizedBox(
            //   //width: MediaQuery.of(context).size.width,
            //   // width: 150,
            //   height: size.height * 0.12,
            //   child: Image.asset(
            //     'assets/images/bear.jpg',
            //     fit: BoxFit.fill,
            //     //scale: 5.5,
            //   ),
            // ),
            // ClipRRect(
            //   child: Container(
            //     //width: MediaQuery.of(context).size.width,
            //     // width: 150,
            //     height: size.height * 0.12,
            //     decoration: BoxDecoration(
            //         color: const Color.fromARGB(255, 243, 235, 235),
            //         borderRadius: BorderRadius.only(
            //             bottomLeft: Radius.circular(16),
            //             bottomRight: Radius.circular(16))),
            //     child: Column(
            //       children: [
            //         Text('$detail')
            //         // Center(
            //         //     child: Text(
            //         //   '$detail',
            //         //   style: TextStyle(
            //         //       fontWeight: FontWeight.bold, fontSize: 14),
            //         // )),
            //         // Row(
            //         //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         //   children: [
            //         //     Text(
            //         //       '$price',
            //         //       style: TextStyle(
            //         //           fontSize: 20,
            //         //           color: Colors.red,
            //         //           fontWeight: FontWeight.bold),
            //         //     ),
            //         //     Text(
            //         //       'ขายแล้ว40,000ชิ้น',
            //         //       style: TextStyle(
            //         //           fontWeight: FontWeight.w200, fontSize: 12),
            //         //     )
            //         //   ],
            //         // )
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
