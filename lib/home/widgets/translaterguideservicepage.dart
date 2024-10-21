import 'package:cargoshipping/constants.dart';
import 'package:flutter/material.dart';

class Translaterguideservicepage extends StatelessWidget {
  const Translaterguideservicepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          'บริการไกด์ ล่าม และหาสินค้า',
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
                    'assets/images/translaterimages.png',
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
                  'บริการไกด์ ล่าม และหาสินค้า',
                  style: TextStyle(
                    fontSize: 20,
                    color: red1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 13.0),
                child: Text(
                  'ล่าม ติดต่อโรงงาน',
                  style: TextStyle(
                      color: red1, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 13.0),
                child: Text(
                  'บริการสั่งซื้อสินค้าโดยเจ้าหน้าที่ล่าม ฝ่ายจัดหาสินค้า แบบครบวงจร ตั้งแต่จัดหาร้านค้า คู่เทียบ 2-3 ร้าน จนถึงการแลกเงินจ่ายค่าสินค้า ให้แก่โรงงาน ทางเรากล้ารับประกันว่าคุณจะได้รับบริการที่สะดวกสบาย ระบบของเราสามารถออกใบเสร็จรับเงินให้แก่ท่านได้ เพื่อเป็นหลักฐาน ในการลงบัญชีพร้อมผู้ดูแลส่วนตัว อำนวยความสะดวกในการค้าของ คุณ',
                  style: TextStyle(
                      color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 13.0),
                child: Text(
                  'หมายเหตุ : มาตรฐานการแลกเปลี่ยน ตามอัตราแลกเปลี่ยนของวันนั้น',
                  style: TextStyle(
                      color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 13.0),
                child: Text(
                  'ไกด์/ทัวร์ จองตั๋วเครื่องบิน',
                  style: TextStyle(
                      color: red1, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 13.0),
                child: Text(
                  'บริการพาทัวร์ช็อปปิ้งสินค้าที่ประเทศจีน ไม่ว่าจะที่ กว่างโจว ย่าน One-Link หรือ อี้อู แหล่งค้าส่งสินค้า เป็นต้น พร้อมไกด์ส่วนตัว และ โดยมีฝ่ายจองตั๋วเครื่องบินและที่พักรับรองให้บริการฟรี ไม่มีค่าบริการ',
                  style: TextStyle(
                      color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
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
              //       Navigator.of(context)
              //           .pop(); // ปิด dialog หลังจาก 2 วินาที
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
                  border:
                      Border.all(width: size.width * 0.003, color: red1)),
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
