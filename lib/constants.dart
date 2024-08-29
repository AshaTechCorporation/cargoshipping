import 'package:cargoshipping/account/widgets/menulist.dart';
import 'package:flutter/material.dart';

Color color1 = Color(int.parse('0xffcd7f32'));
Color color2 = Color(int.parse('0xfffbbc80'));
Color red1 = Color(0xffde1e26);
Color arrowcolor = Color(0xffd9d9d9);
Color background = Color(0xfff5f5f5);
Color white = Color(0xffffffff);
Color headingtext = Color(0xff606060);
Color pinkmess = Color(0xfff8d2d4);
Color greymess= Color(0xffe5e5ea);
Color greyuserinfo = Color(0xff606060);

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

const List<String> topup =[
  'เติมเงิน',
  'ถอนเงิน'
];

const List<String> aboutQuestion = [
  'คำถามที่พบบ่อย',
  'เกี่ยวกับ TEG Cargo',
];
const List<String> productOrderList = [
  'ที่ต้องชำระ',
  'ที่ต้องจัดส่ง',
  'ระหว่างขนส่ง',
  'ถึงโกดังไทย',
  'ประวัติทั้งหมด'
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
  'assets/icons/showhis.png'
];

const List<String> importlist = [
  'assets/images/car.png',
  'assets/images/ship.png',
  'assets/images/import.png',
  'assets/images/fcl.png',
  'assets/images/tour.png',
  'assets/images/shippingrate.png',
];

const List<Map<String, dynamic>> listProducts = [
  {
    'id': 1,
    'image': 'assets/images/shelf.png',
    'imagedetail1': 'assets/images/images23.png',
    'imagedetail2': 'assets/images/images25.png',
    'imagedetail3': 'assets/images/images26.png',
    'price': 4.88,
    'detail':
        'ชั้นวางพลาสติกในครัว, ชั้นวางของในห้องน้ําแบบไม่มีรูพรุน, สุขโครกติดผนัง, เครื่องใช้ในห้องน้ํา, กล่องเก็บของ',
    'send': '48 ชั่วโมง',
    'sale': '5000+ '
  },
  {
    'id': 2,
    'image': 'assets/images/box.png',
    'imagedetail1': 'assets/images/images23.png',
    'imagedetail2': 'assets/images/images25.png',
    'imagedetail3': 'assets/images/images26.png',
    'price': 11.19,
    'detail':
        'กล่องเก็บผ้าฝ้ายและผ้าลินิน Tianshan, ตะกร้าเก็บเสื้อผ้าในครัวเรือน,กล่องเก็บกํามะหยี่,ที่เก็บผ้านวม',
    'send': '48 ชั่วโมง',
    'sale': '4000+ '
  },
  {
    'id': 3,
    'image': 'assets/images/pant.png',
    'imagedetail1': 'assets/images/images23.png',
    'imagedetail2': 'assets/images/images25.png',
    'imagedetail3': 'assets/images/images26.png',
    'price': 9.40,
    'detail':
        'กางเกงขาสั้นผู้ชาย, กางเกงขาสั้นลําลอง, กางเกงใหญ่ผู้ชาย, ฤดูร้อนผู้ชาย, วัยรุ่น, วัยกลางคนและผู้สูงอายุ',
    'send': '48 ชั่วโมง',
    'sale': '3000+ '
  },
  {
    'id': 4,
    'image': 'assets/images/headband.png',
    'imagedetail1': 'assets/images/images23.png',
    'imagedetail2': 'assets/images/images25.png',
    'imagedetail3': 'assets/images/images26.png',
    'price': 3,
    'detail': 'ผ้าพันคอลายพรางผ้าไหมมัลติฟังก์ชั่น, ผ้าพันคอฤดูร้อนปั่นจักรยาน',
    'send': '48 ชั่วโมง',
    'sale': '3000+ '
  },
  {
    'id': 5,
    'image': 'assets/images/bellser.png',
    'imagedetail1': 'assets/images/images23.png',
    'imagedetail2': 'assets/images/images25.png',
    'imagedetail3': 'assets/images/images26.png',
    'price': 55.60,
    'detail':
        'เสื้อเบลเซอร์สีกาแฟผู้หญิง 2023 ฤดูใบไม้ผลิและฤดูใบไม้ร่วงชายตัวน้อยทอดถนนแฟชั่นใหม่',
    'send': '48 ชั่วโมง',
    'sale': '2000+ '
  },
  {
    'id': 6,
    'image': 'assets/images/cardigan.png',
    'imagedetail1': 'assets/images/images23.png',
    'imagedetail2': 'assets/images/images25.png',
    'imagedetail3': 'assets/images/images26.png',
    'price': 23,
    'detail':
        'เสื้อคาร์ดิแกนเสื้อถักทับแจ็คเก็ตผู้หญิงรุ่นเกาหลีของฤดูใบไม้ร่วง',
    'send': '48 ชั่วโมง',
    'sale': '1000+ '
  },
];

const List<String> fistpagewidget = [
  'นำเข้าถูกต้อง',
  'นำเข้าเหมาภาษี',
];

const List<Map<String, dynamic>> shirtproductimg = [
  {'id': 1, 'images': 'assets/images/t_shirt.png', 'title': 'เสื้อยืด'},
  {'id': 2, 'images': 'assets/images/shirt.png', 'title': 'เสื้อเชิ้ต'},
  {'id': 3, 'images': 'assets/images/sweater.png', 'title': 'เสื้อสเวตเตอร์'}
];

List<String> payment = [
  'assets/images/leaveorder.png',
  'assets/images/alipay.png',
  'assets/images/paymentcomp.png',
];

List<String> howto = [
  'HOW TO ชำระค่าขนส่งจีน-ไทย',
  'HOW TO ฝากโอนชำระค่าสินค้าจีน',
  'HOW TO ค้นหาสินค้าจาก 1688 TAOBAO',
  'HOW TO สมัครเป็นตัวแทน',
  'ที่อยู่โกดังจีน',
  'ที่อยู่โกดังไทย',
  'ระเบียบการเข้าคลัง TEG Cargo'
];


List<MenuItem> menuItems = [
    MenuItem(imagePath: 'assets/icons/cart-plus_svgrepo.com.png', text: 'สรุปการสั่งการสั่งซื้อ'),
    MenuItem(imagePath: 'assets/icons/yellotruck.png', text: 'สรุปการขนส่ง'),
    MenuItem(imagePath: 'assets/icons/fav.png', text: 'รายการโปรด'),
    MenuItem(imagePath: 'assets/icons/guide.png', text: 'บทความ'),
    MenuItem(imagePath: 'assets/icons/guide.png', text: 'คู่มือการใช้งาน'),
    MenuItem(imagePath: 'assets/icons/help.png', text: 'ช่วยเหลือ'),
    MenuItem(imagePath: 'assets/icons/report.png', text: 'แจ้งปัญหา'),
    MenuItem(imagePath: 'assets/icons/contact.png', text: 'ติดต่อเรา'),
    MenuItem(imagePath: 'assets/icons/setting.png', text: 'ตั้งค่า'),
  ];


  const List<Map<String, dynamic>> ordersum= [
  {
    'id': 1,
    'month': 'สิงหาคม 2567',
    'amount': '00,000 บาท',
    'detailLink': 'ดูรายละเอียด',
    'images' : 'assets/icons/ordermont.png'
  },
   {
    'id': 2,
    'month': 'กรกฎาคม 2567',
    'amount': '00,000 บาท',
    'detailLink': 'ดูรายละเอียด',
    'images' : 'assets/icons/ordermont.png'
  },
  {
    'id': 3,
    'month': 'มิถุนายน 2567',
    'amount': '00,000 บาท',
    'detailLink': 'ดูรายละเอียด',
    'images' : 'assets/icons/ordermont.png'
  }
];


const List<Map<String, dynamic>> transport= [
  {
    'id': 1,
    'month': 'สิงหาคม 2567',
    'amount': '00,000 บาท',
    'detailLink': 'ดูรายละเอียด',
    'images' : 'assets/icons/ordermont.png'
  },
   {
    'id': 2,
    'month': 'กรกฎาคม 2567',
    'amount': '00,000 บาท',
    'detailLink': 'ดูรายละเอียด',
    'images' : 'assets/icons/ordermont.png'
  },
  {
    'id': 3,
    'month': 'มิถุนายน 2567',
    'amount': '00,000 บาท',
    'detailLink': 'ดูรายละเอียด',
    'images' : 'assets/icons/ordermont.png'
  }
];

