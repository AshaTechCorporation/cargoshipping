import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

class PictureSliderWidget extends StatelessWidget {
  const PictureSliderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  static const List<String> sampleImages = [
    'assets/images/Bannerslide1.png',
    'assets/images/bannerslide2.png',
    'assets/images/bannerslide3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 150,
          width: 358,
          // decoration: BoxDecoration(
          //     color: Colors.amber, borderRadius: BorderRadius.circular(20)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: sampleImages.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      sampleImages[index],
                      fit: BoxFit.fill, // ขยายภาพเต็มพื้นที่ของ Container
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
