import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Werehousesearch extends StatelessWidget {
  const Werehousesearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          'บริการจัดหาโรงงาน',
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: backgroundColor,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // จัดข้อความและวิดเจ็ตภายในให้ชิดซ้าย
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), // ขอบมน
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(10.0), // ขอบมนให้เหมือนกับ Container
                  child: Image.asset(
                    'assets/images/werehousesearch.png',
                    fit: BoxFit.cover, // ให้ภาพครอบคลุมพื้นที่ทั้งหมด
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 8.0),
                child: Text(
                  'บริการจัดหาโรงงาน',
                  style: TextStyle(
                    fontSize: 20,
                    color: red1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 10.0),
                child: Text(
                  'ในบริการการจัดหาสินค้านั้นแตกต่างการฝากสั่งไม่ได้จัดหาผ่าน APPLICATION 1688/TAOBAO ลูกค้าต้องการดีล สั่งของกับโรงงานโดยไม่ผ่านร้านค้าต้องการดีลพิเศษเพิ่มเติม',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 8.0),
                child: Text(
                  'ค่าบริการ',
                  style: TextStyle(
                    fontSize: 13,
                    color: red1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Text(
                  'โดยค่าบริการส่วนนี้จะอยู่ที่ 3% ของค่าสินค้า ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 1.0),
                child: Text(
                  'จะรับมัดจำชำระค่าจัดหารายการ 500 บาท ก่อนเริ่มงาน',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 15.0),
                child: Text(
                  'หมายเหตุ :',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 5.0),
                child: Text(
                  'การฝากจัดหาสินค้านั้น ทางบริษัทฯ จะหาร้านค้าหรือโรงงานทั้งมีอยู่ ใน App หรือไม่มี โดยจะมียอดสั่งซื้อสูง เช่น สั่งผลิต สั่งงานล็อตซื้อ จำนวนมากๆ และ OME',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: size.height * 0.08,
        child: BottomAppBar(
          color: white,
          child: GestureDetector(
            onTap: () {
              // showDialog(
              //   context: context,
              //   builder: (BuildContext context) {
              //     Future.delayed(Duration(seconds: 2), () {
              //       Navigator.of(context).pop(); // ปิด dialog หลังจาก 2 วินาที
              //     });
              //     return AlertDialog(
              //       title: Text('เปิดบิล'),
              //       content: Text('เปิดบิลเสร็จสิ้น'),
              //     );
              //   },
              // );
            },
            child: Container(
              height: size.height * 0.06,
              width: size.width * 0.42,
              decoration: BoxDecoration(
                  color: red1,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: size.width * 0.003, color: red1)),
              child: Center(
                child: Text(
                  'สนใจใช้บริการนี้',
                  style: TextStyle(
                    color: white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
