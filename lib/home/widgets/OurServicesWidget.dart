import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/Servicedetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OurServicesWidget extends StatelessWidget {
  OurServicesWidget({
    super.key,
    required this.size,
    required this.title,
    required this.press,
    required this.imagespath,
  });

  final Size size;
  final String title;
  final VoidCallback press;
  final String imagespath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Servicedetail(
                      title: title,
                    )));
      },
      child: Column(
        children: [
          Container(
            // height: size.height * 0.1,
            // width: size.width * 0.2,
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: AspectRatio(
                aspectRatio: 5,
                child: Container(
                  height: 50,
                  child: Image.asset(
                    imagespath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Text(
            '$title',
            style: TextStyle(fontSize: 13),
          )
        ],
      ),
    );
  }
}
