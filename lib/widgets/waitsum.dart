import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/track/selldetail.dart';
import 'package:flutter/material.dart';

class Waitsum extends StatefulWidget {
  const Waitsum({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  _WaitsumState createState() => _WaitsumState();
}

class _WaitsumState extends State<Waitsum> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 358,
          height: 168,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              SizedBox(
                height: widget.size.height * 0.015,
              ),
              Container(
                width: 334,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Order no. A123456',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: widget.size.height * 0.01,
              ),
              Container(
                width: 308,
                height: 33,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/icon_wait.png',
                    ),
                    SizedBox(
                      width: widget.size.width * 0.03,
                    ),
                    Text(
                      'รอสรุปยอด',
                      style:
                          TextStyle(color: red1, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: widget.size.height * 0.01,
              ),
              Container(
                width: 334,
                height: 21,
                child: Row(
                  children: [
                    Text('ประเภท สินค้าสั่งซื้อ '),
                    Spacer(),
                    Text('สั่งซื้อเมื่อ 28 ก.ค.  67')
                  ],
                ),
              ),
              SizedBox(
                height: widget.size.height * 0.01,
              ),
              Container(
                width: 334,
                height: 25,
                child: Row(
                  children: [
                    Image.asset('assets/icons/ship_icon.png'),
                    SizedBox(
                      width: widget.size.width * 0.03,
                    ),
                    Text('ขนส่งทางเรือ'),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Selldetail()),
                        );
                      },
                      child: Row(
                        children: [
                          Text('รายละเอียด'),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: arrowcolor,
                          ),
                        ],
                      ),
                    ),
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
