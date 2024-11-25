import 'package:cached_network_image/cached_network_image.dart';
import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class OurItemSearch extends StatelessWidget {
  const OurItemSearch({
    super.key,
    required this.detail,
    required this.image,
    required this.press,
    required this.price,
    required this.sale,
    required this.send,
    required this.size,
  });

  final Size size;
  final String image;
  final String detail;
  final String send;
  final String sale;
  final String price;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: size.width * 0.44,
        height: size.height * 0.258,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
            //   child: Image.asset(
            //     image,
            //     fit: BoxFit.fill,
            //     height: size.height * 0.14,
            //     width: double.infinity,
            //   ),
            // ),
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: CachedNetworkImage(
                height: size.height * 0.14,
                width: size.width * 0.44,
                imageUrl: "${image}",
                fit: BoxFit.fill,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/noimages.jpg',
                  fit: BoxFit.fill,
                  height: size.height * 0.14,
                  width: size.width * 0.44,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                detail,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '¥ $price',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Set the text color to red
                    ),
                  ),
                  Text(
                    'จัดส่ง $send',
                    style: TextStyle(fontSize: 11, color: greyuserinfo, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'ขายแล้ว $sale ใน 30 วัน',
                    style: TextStyle(fontSize: 11, color: greyuserinfo, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
