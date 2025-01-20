import 'package:flutter/material.dart';
import 'package:cargoshipping/constants.dart';

class WaitPurchase extends StatelessWidget {
  WaitPurchase({super.key, required this.size, required this.press, required this.pressPrice});

  final Size size;
  VoidCallback press;
  VoidCallback pressPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.95,
      color: white,
      child: GestureDetector(
        onTap: press,
        child: Center(
          child: Stack(
            children: [
              Positioned(
                bottom: size.height * 0.015,
                right: size.width * 0.02,
                child: Opacity(
                  opacity: 0.7,
                  child: Image.asset(
                    'assets/icons/carback.png',
                    width: size.width * 0.28,
                    height: size.height * 0.1,
                  ),
                ),
              ),
              Container(
                width: size.width * 0.95,
                height: size.height * 0.28,
                decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 0.5)),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Container(
                      width: size.width * 0.88,
                      height: size.height * 0.045,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Order no. A423456',
                            style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Image.asset(
                              'assets/icons/waitsumready.png',
                              height: size.height * 0.035,
                            ),
                            SizedBox(
                              width: size.width * 0.015,
                            ),
                            Text(
                              'สรุปยอดคำสั่งซื้อ',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: red1),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      child: Row(
                        children: [
                          Text(
                            'ประเภท สินค้าสั่งซื้อ ',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          Spacer(),
                          Text(
                            'สั่งซื้อเมื่อ 28 ก.ค.  67',
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/byredcar.png',
                            height: size.height * 0.03,
                          ),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Text(
                            'ขนส่งทางรถ',
                            style: TextStyle(fontSize: 14, color: greyuserinfo, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            'รายละเอียด',
                            style: TextStyle(fontSize: 14, color: red1, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Image.asset('assets/icons/rightarrow.png'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                          child: Text(
                            'ยอดคำสั่งซื้อรวม 0,000 บาท',
                            style: TextStyle(fontSize: 14, color: red1, fontWeight: FontWeight.bold),
                          ),
                        ),
                        
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                          child: GestureDetector(
                            onTap: pressPrice,
                            child: Container(
                              height: size.height * 0.05,
                              width: size.width * 0.24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: red1, // สีของปุ่มชำระเงิน
                              ),
                              child: Center(
                                child: Text(
                                  'ชำระเงิน',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
