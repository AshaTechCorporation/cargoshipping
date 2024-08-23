import 'package:flutter/material.dart';

class Promotion2page extends StatefulWidget {
  const Promotion2page({super.key});

  @override
  State<Promotion2page> createState() => _Promotion2pageState();
}

class _Promotion2pageState extends State<Promotion2page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ข่าวสาร/โปรโมชั่น'),
        ),
        body: Container(
          color: Colors.grey[300],
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: 380,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // เพิ่ม crossAxisAlignment ให้กับ Column
                  children: [
                    Image.asset('assets/images/promotionbanner.png'),
                    SizedBox(
                      height: 7,
                    ),
                    Center(
                      child: Text(
                        'THC Charge รู้ไว้ก่อน!',
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Text(
                        'ค่าใช้จ่ายเบื้องหลังใบขนสินค้าขาเข้า',
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        '24 กรกฎาคม 2567',
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'THC Charge ย่อมาจาก Terminal Handling Charge หมายถึง ค่าธรรมเนียมที่เรียกเก็บจากผู้นำเข้าหรือผู้ส่งออกสินค้า สำหรับบริการจัดการสินค้าที่ท่าเรือ เช่น การยกตู้คอนเทนเนอร์ ขึ้นลงเรือ การเคลื่อนย้ายตู้คอนเทนเนอร์ภายในท่าเรือ การจัดเก็บตู้คอนเทนเนอร์ในลาน และบริการอื่น ๆ ที่เกี่ยวข้อง',
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 5,),
                    Align(
                      alignment: Alignment.centerLeft, // จัดข้อความให้ชิดซ้าย
                      child: Text(
                        'รายละเอียด',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                        ],
                      ),
                    ),
                    
                    Text(' - จำนวนเงิน: ขึ้นอยู่กับขนาด ประเภท ',textAlign: TextAlign.left,),
                    Text('   และน้ำหนักของตู้คอนเทนเนอร์',textAlign: TextAlign.left,),
                    Text(' การเรียกเก็บ:',textAlign: TextAlign.left,),
                    Text('    โดยทั่วไป',textAlign: TextAlign.left,),
                    Text('    สายการเดินเรือจะเป็นผู้เรียกเก็บค่าธรรมเนียมนี้จากผู้ นำเข้าหรือผู้ส่งออก',textAlign: TextAlign.left,),
                    Text('    อาจรวมอยู่ในค่าระวางเรือ หรือเรียกเก็บแยกต่างหาก',textAlign: TextAlign.left,),
                    Text('  การตรวจสอบ: ',textAlign: TextAlign.left,),
                    Text('    ผู้ส่งออกหรือผู้นำเข้าสามารถตรวจสอบอัตราค่าธรรมเนียม ',textAlign: TextAlign.left,),
                    Text('    THC ได้จากเว็บไซต์ของสายการเดินเรือหรือบริษัทท่าเรือ',textAlign: TextAlign.left,),

                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
