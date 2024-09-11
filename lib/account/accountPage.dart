import 'package:cargoshipping/account/widgets/CardlistWidget.dart';
import 'package:cargoshipping/account/widgets/firsttopup.dart';
import 'package:cargoshipping/account/widgets/firstwithdrown.dart';
import 'package:cargoshipping/account/widgets/howto.dart';
import 'package:cargoshipping/account/widgets/importlist.dart';
import 'package:cargoshipping/account/widgets/listimportcorrectwidget.dart';
import 'package:cargoshipping/account/widgets/menulist.dart';
import 'package:cargoshipping/account/widgets/orderlistwidget.dart';
import 'package:cargoshipping/account/widgets/ordersumpage.dart';
import 'package:cargoshipping/account/widgets/tagunlimited.dart';
import 'package:cargoshipping/account/widgets/topupwidget.dart';
import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/widgets/correctimportpage.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isGuangzhouSelected = true;
  @override
  Widget build(BuildContext context) {
    final selectedInfo = isGuangzhouSelected ? guangzhouInfo : yiwuInfo;
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200.0),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFcd8032),
                      Color(0xFFecc49d),
                    ],
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'A123456',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Name Surname',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Spacer(),
                          Container(
                            width: 150,
                            height: 60,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [color1, color2],
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                stops: [0.3, 0.7],
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Bronze',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(width: 10),
                                CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  radius: 20,
                                  child: Icon(
                                    Icons.person,
                                    size: 20,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.009,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'TEG+ Point ',
                                style: TextStyle(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '150 คะแนน ',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 90),
                                child: Text(
                                  'Wallet ',
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                'คงเหลือ 1025 บาท',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                            fistpagewidget.length,
                            (index) => Topupwidget(
                                size: size,
                                title: topup[index],
                                press: () {
                                  if (index == 0) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Firsttopup()),
                                    );
                                  }
                                  if (index == 1) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Firstwithdrawpage()),
                                    );
                                  }
                                })),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            height: size.height * 0.09,
            width: size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1.5,
              ),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Tagunlimited()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset('assets/images/freetour.png'),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                    SizedBox(
                      height: size.height * 0.064,
                      width: size.width * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width * 0.3,
                          ),
                          Text(
                            'TEG UNLIMITED',
                            style: TextStyle(
                                fontSize: 13,
                                color: red1,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: size.height * 0.001,
                          ),
                          Text(
                            'รับส่วนลดทุกบริการ TEG CARGO สิทธิประโยชน์พิเศษ และอีกมากมาย',
                            style: TextStyle(
                                fontSize: 12,
                                color: greyuserinfo,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.099,
                    ),
                    Image.asset('assets/icons/rightredarrow.png')
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  'คำสั่งซื้อของฉัน',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Ordersumpage()));
                  },
                  child: Row(
                    children: [
                      Text(
                        'ประวัติสรุปการสั่งซื้อ',
                        style: TextStyle(fontSize: 12, color: greyuserinfo),
                      ),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      Image.asset('assets/icons/history.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Wrap(
              spacing: 3,
              runSpacing: 3,
              children: List.generate(
                myorder.length,
                (index) => CardlistWidget(
                  size: size,
                  title: myorder[index]['name'],
                  press: () {},
                  imagespath: myorder[index]['images'],
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  'รายการขนส่ง',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Ordersumpage()));
                  },
                  child: Row(
                    children: [
                      Text(
                        'ประวัติสรุปการสั่งซื้อ',
                        style: TextStyle(fontSize: 12, color: greyuserinfo),
                      ),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      Image.asset('assets/icons/history.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: List.generate(
              orderlist.length,
              (index) => Orderlist(
                size: size,
                title: orderlist[index]['name'],
                press: () {},
                imagespath: orderlist[index]['images'],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  'รายการนำเข้าถูกต้อง',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Ordersumpage()));
                  },
                  child: Row(
                    children: [
                      Text(
                        'ประวัติสรุปการสั่งซื้อ',
                        style: TextStyle(fontSize: 12, color: greyuserinfo),
                      ),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      Image.asset('assets/icons/history.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.2),
            child: Wrap(
              spacing: 3,
              runSpacing: 3,
              children: List.generate(
                listimportcorrect.length,
                (index) => Listimportcorrectwidget(
                  size: size,
                  title: listimportcorrect[index]['name'],
                  press: () {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Correctimportpage(),
                        ),
                      );
                    }
                  },
                  imagespath: listimportcorrect[index]['images'],
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'รายการนำเข้า',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 5.0,
              left: 10.0,
              right: 10.0,
              bottom: 10.0,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: importlist.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (context, index) {
                return Importlist(
                  size: size,
                  press: () {},
                  imagespath: importlist[index],
                );
              },
            ),
          ),
          SizedBox(
              width: size.width * 0.95,
              child: Image.asset('assets/images/freight.png')),

          // Wrap(
          //   spacing: 15,
          //   runSpacing: 10,
          //   children: List.generate(
          //     importlist.length,
          //     (index) => Importlist(
          //       size: size,
          //       press: () {},
          //       imagespath: importlist[index],
          //     ),
          //   ),
          // ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Column(
            children: List.generate(
                howto.length,
                (index) => Howto(
                      size: size,
                      press: () {},
                      title: howto[index],
                    )),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  width: size.width * 0.9,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isGuangzhouSelected = true;
                              });
                            },
                            child: Container(
                              decoration: isGuangzhouSelected
                                  ? BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.red, // สีของเส้นใต้
                                          width: 2.0, // ความหนาของเส้นใต้
                                        ),
                                      ),
                                    )
                                  : null, // ไม่มีเส้นใต้ถ้าไม่ได้เลือก
                              padding: EdgeInsets.only(
                                  bottom:
                                      3.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'ที่อยู่โกดัง ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isGuangzhouSelected
                                            ? Colors.black
                                            : Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'กวางโจว',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isGuangzhouSelected
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isGuangzhouSelected = false;
                              });
                            },
                            child: Container(
                              decoration: isGuangzhouSelected
                                  ? null
                                  : BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.red, // สีของเส้นใต้
                                          width: 2.0, // ความหนาของเส้นใต้
                                        ),
                                      ),
                                    ),
                              padding: EdgeInsets.only(
                                  bottom:
                                      3.0), // ระยะห่างระหว่างข้อความกับเส้นใต้
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'ที่อยู่โกดัง ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: !isGuangzhouSelected
                                            ? Colors.black
                                            : Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'อี้อู',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: !isGuangzhouSelected
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      _buildInfoRow(
                          '收货人', selectedInfo['收货人']!, Icons.copy, Colors.grey),
                      _buildInfoRow('详细地址', selectedInfo['详细地址']!, Icons.copy,
                          Colors.grey),
                      _buildInfoRow(
                          '邮编', selectedInfo['邮编']!, Icons.copy, Colors.grey),
                      _buildInfoRow(
                          '手机', selectedInfo['手机']!, Icons.copy, Colors.grey),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'ที่อยู่โกดังไทย ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'TEGCARGO',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                '12 6 ตำบลคลองข่อย อำเภอปากเกร็ด\nจังหวัดนนทบุรี 11120',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.copy,
                                  color: Colors.grey,
                                  size: 25,
                                ),
                                Text(
                                  'คัดลอก',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      _buildInfoRow('เบอร์โทรศัพท์', '061-996-6663', Icons.copy,
                          Colors.grey),
                      _buildInfoRow(
                          'Google Maps',
                          'https://maps.app.goo.gl/gmk7B6pgrATazqb167g_st=ic',
                          Icons.copy,
                          Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        'ระเบียบการเข้าคลัง TEG CARGO',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: red1,
                        ),
                      ),
                      Text(
                        '1. ก่อนเข้ารับกรุณาโทรนัดหมายก่อนล่วงหน้า อย่างน้อย 2 ชั่วโมง\n2. กรณีรับพัสดุจำนวนมากรบกวนแจ้งรหัสสินค้าที่จะนำออกให้ครบเพื่อความสะดวก\n3. ไม่อนุญาตให้นำสัตว์เลี้ยงหรือเด็กเข้าคลัง',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                MenuList(),
              ],
            ),
          ),
        ])));
  }
}

Widget _buildInfoRow(
    String title, String detail, IconData icon, Color iconColor) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            detail,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            Icon(icon, color: iconColor),
            SizedBox(width: 2),
            Text(
              'คัดลอก',
              style: TextStyle(
                color: iconColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
