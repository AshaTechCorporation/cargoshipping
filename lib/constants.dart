import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xff1B58B1);
const kSecondTextColor = Color(0xff7B7B7B);
const kConkgroundColor = Color(0xffFFFFFF);

const List<String> titleData = [
  'ขนส่งทางบก\nและทางทะเล',
  'จัดส่งแบบ\nเหมาตู้ FCL',
  'จัดส่งแบบ FCL',
  'ส่งถึงหน้าบ้าน',
  'ขนส่งพร้อม\nออกหนังสือ',
  'ล่าม ไกด์ทัวร์\nตั๋วเครื่องบิน',
  'การคำนวน\nค่าขนส่ง',
  'เรทราคานำเข้า'
];

const List<String> aboutQuestion = [
  'คำถามที่พบบ่อย',
  'เกี่ยวกับ TEG Cargo',
];
const List<String> productOrderList = [
  'ที่ต้องชำระ',
  'ที่ต้องจัดส่ง',
  'ระหว่างขนส่ง',
  'ประวัติการสั่งซื้อ'
];

const List<String> listImport = [
  'นำเข้าทางรถ',
  'นำเข้าทางเรือ',
  'เรทราคานำเข้า',
  'การคำนวน\nค่าขนส่ง'
];

const List<String> reccomproduct = [
  'ชั้นวางพลาสติกในครัว, \nชั้นวางของในห้องน้ําแบบไม่มีรู...',
  'กล่องเก็บผ้าฝ้ายและผ้าลินิน \nTianshan, ตะกร้าเก็บเสื้อผ้าในค',
  'ตุ๊กตาหมีสีเหลือง',
  'ตุ๊กตาหมีสีขาว'
];
List<String> Imgservice = [
  'assets/icons/exportboktale.png',
  'assets/icons/fcl.png',
  'assets/icons/lcl.png',
  'assets/icons/dellitohome.png',
  'assets/icons/withlisecse.png',
  'assets/icons/translater.png',
  'assets/icons/calculator.png',
  'assets/icons/priceimport.png',
  'assets/icons/etc.png',
];

List<String> catagoryrecom = [
  'เสื้อผ้า',
  'เครื่องประดับ',
  'อุปกรณ์กีฬา',
  'สินค้าเด็ก',
  'เครื่องใช้ในบ้าน', // เพิ่มคอมมาหลังจากรายการนี้
  'อุปกรณ์สวนและสำนักงาน', // เพิ่มคอมมาหลังจากรายการนี้
  'อาหาร',
  'เครื่องสำอาง'
];

const List<String> catagoryimg = [
  'assets/icons/cloth.png',
  'assets/icons/accessory.png',
  'assets/icons/sport.png',
  'assets/icons/kids.png',
  'assets/icons/hometools.png',
  'assets/icons/garden.png',
  'assets/icons/food.png',
  'assets/icons/makeup.png',
];

const List<String> oderlist = [
  'assets/icons/overdue.png',
  'assets/icons/packing.png',
  'assets/icons/deliverytime.png',
  'assets/icons/orderhistory.png',
];

const List<String> importlist = [
  'assets/icons/carimport.png',
  'assets/icons/boatimport.png',
  'assets/icons/pricerate.png',
  'assets/icons/calprice.png',
];

const List<Map<String, dynamic>> listProducts = [
  {
    'id': 1,
    'image': 'assets/images/shelf.png',
    'imagedetail1':'assets/images/images23.png',
    'imagedetail2':'assets/images/images25.png',
    'imagedetail3':'assets/images/images26.png',
    'price': 4.88,
    'detail':
        'ชั้นวางพลาสติกในครัว, ชั้นวางของในห้องน้ําแบบไม่มีรูพรุน, สุขโครกติดผนัง, เครื่องใช้ในห้องน้ํา, กล่องเก็บของ',
    'send': '48 ชั่วโมง',
    'sale': '5000+ '
  },
  {
    'id': 2,
    'image': 'assets/images/box.png',
    'imagedetail1':'assets/images/images23.png',
    'imagedetail2':'assets/images/images25.png',
    'imagedetail3':'assets/images/images26.png',
    'price': 11.19,
    'detail':
        'กล่องเก็บผ้าฝ้ายและผ้าลินิน Tianshan, ตะกร้าเก็บเสื้อผ้าในครัวเรือน,กล่องเก็บกํามะหยี่,ที่เก็บผ้านวม',
    'send': '48 ชั่วโมง',
    'sale': '4000+ '
  },
  {
    'id': 3,
    'image': 'assets/images/pant.png',
    'imagedetail1':'assets/images/images23.png',
    'imagedetail2':'assets/images/images25.png',
    'imagedetail3':'assets/images/images26.png',
    'price': 9.40,
    'detail':
        'กางเกงขาสั้นผู้ชาย, กางเกงขาสั้นลําลอง, กางเกงใหญ่ผู้ชาย, ฤดูร้อนผู้ชาย, วัยรุ่น, วัยกลางคนและผู้สูงอายุ',
    'send': '48 ชั่วโมง',
    'sale': '3000+ '
  },
  {
    'id': 4,
    'image': 'assets/images/headband.png',
    'imagedetail1':'assets/images/images23.png',
    'imagedetail2':'assets/images/images25.png',
    'imagedetail3':'assets/images/images26.png',
    'price': 3,
    'detail':
        'ผ้าพันคอลายพรางผ้าไหมมัลติฟังก์ชั่น, ผ้าพันคอฤดูร้อนปั่นจักรยาน',
    'send': '48 ชั่วโมง',
    'sale': '3000+ '
  },
  {
    'id': 5,
    'image': 'assets/images/bellser.png',
    'imagedetail1':'assets/images/images23.png',
    'imagedetail2':'assets/images/images25.png',
    'imagedetail3':'assets/images/images26.png',
    'price': 55.60,
    'detail':
        'เสื้อเบลเซอร์สีกาแฟผู้หญิง 2023 ฤดูใบไม้ผลิและฤดูใบไม้ร่วงชายตัวน้อยทอดถนนแฟชั่นใหม่',
    'send': '48 ชั่วโมง',
    'sale': '2000+ '
  },
  {
    'id': 6,
    'image': 'assets/images/cardigan.png',
    'imagedetail1':'assets/images/images23.png',
    'imagedetail2':'assets/images/images25.png',
    'imagedetail3':'assets/images/images26.png',
    'price': 23,
    'detail':
        'เสื้อคาร์ดิแกนเสื้อถักทับแจ็คเก็ตผู้หญิงรุ่นเกาหลีของฤดูใบไม้ร่วง',
    'send': '48 ชั่วโมง',
    'sale': '1000+ '
  },
  
];
