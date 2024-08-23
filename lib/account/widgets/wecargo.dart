import 'package:flutter/material.dart';

class Wecargo extends StatefulWidget {
  const Wecargo({super.key});

  @override
  State<Wecargo> createState() => _WecargoState();
}

class _WecargoState extends State<Wecargo> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('เกี่ยวกับเรา'),
      ),
      body: Column(
        children: [
          Center(
              child: Image.asset(
            'assets/images/logofull.png',
            width: 268,
            height: 85,
          )),
          SizedBox(
            height: size.height * 0.01,
          ),
          Container(
            width: 365,
            child: Column(
              children: [
                RichText(
                    text: TextSpan(
                        text: 'เราคือ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                        children: <TextSpan>[
                      TextSpan(
                        text: ' TEG CARGO',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      )
                    ])),
                SizedBox(height: size.height * 0.01),
                Text(
                    '   TEG  ชิปปิ้งจากจีนถึงไทย ส่งดีถูกใจ ใส่ใจถึงหน้าบ้าน เรามีบริการ ส่งของจากจีนครบจบทุกขั้นตอน ขนส่งด่วนที่สุด 4-7 วัน จากจีนถึงไทย ส่งตรงถึงหน้าบ้าน พร้อมผู้ดูแลส่วนตัว สามารถสั่งซื้อสินค้า ติดต่อ ประสานงาน ร้านค้า โรงงาน ติดตามสินค้า ชิปปิ้งจีน ราคาถูกพร้อม อำนวยความสะดวก มี  Application  แจ้งเตือนสถานะสินค้า 24 ชม.',style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(height: size.height * 0.01,),
                Text(
                    '    TEG เป็นตัวแทนออกของ หรือ ชิปปิ้ง (Shipping) หมายถึง ผู้ทำหน้าที่ด้านพิธีการเอกสารผ่านธนาคาร พิธีการศุลกากร และบริษัทเรือเดินทะเลหรือบริษัทขนส่งทางบก เพื่อนำสินค้านำเข้าจาก ประเทศจีน รวมถึงการจัดหารถไปรับสินค้าจาก โกดังลูกค้าโดยมีบริการ เหมาตู้คอนเทนเนอร์(FCL) แชร์ตู้ร่วม(LCL)และบริการส่งตรงถึงหน้า บ้าน(Door to Door) โดยนอกจากนี้บริษัทฯของเรายังมีบริการ เสริมอื่นๆ เช่น บริการจัดหาไกด์ ล่ามติดต่อประสานงาน ร้านค้า โรงงาน พร้อมอำนวยความสะดวก',style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(height: size.height * 0.01,),
                Text(
                    '    ทางบริษัทฯยังเปิดรับ พาสเนอร์ร่วมธุรกิจ โดยให้บริการครบวงจร เช่น เอกสารรับสินค้าที่จีนเป็นของพาสเนอร์เองได้ การอัพเดตสถานะ เข้าโกดัง รวมถึงสรุปข้อมูลสินค้าเข้าโกดังแบบวันต่อวัน',style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(height: size.height * 0.03,),
                    Image.asset('assets/images/exitway.png')
              ],
            ),
          )
        ],
      ),
    );
  }
}
