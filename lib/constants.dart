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
Color greymess = Color(0xffe5e5ea);
Color greyuserinfo = Color(0xff606060);
Color skyorange = Color(0xffffe7d1);
Color oldred = Color(0xff8a1015);
Color youngpink = Color(0xffffe6e7);
Color green = Color(0xff3ace01);
Color blue = Color(0xff3c5a9a);
Color pinkser = Color(0xffffefe0);

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

const List<String> topup = ['เติมเงิน', 'ถอนเงิน'];

const List<String> aboutQuestion = [
  'คำถามที่พบบ่อย',
  'เกี่ยวกับ TEG Cargo',
];
const List<Map<String, dynamic>> myorder = [
  {
    'id': 1,
    'name': 'รอตรวจสอบคำสั่งซื้อ',
    'images': 'assets/images/ordercheck.png'
  },
  {
    'id': 2,
    'name': 'รอชำระคำสั่งซื้อ',
    'images': 'assets/images/watingpayment.png'
  },
  {
    'id': 3,
    'name': 'ร้านค้าเตรียมจัดส่ง',
    'images': 'assets/images/shoppacking.png'
  },
  {
    'id': 4,
    'name': 'จัดส่งสินค้าแล้ว',
    'images': 'assets/images/deliordersucces.png'
  },
  {'id': 5, 'name': 'ยกเลิก', 'images': 'assets/images/cancelorder.png'},
];

const List<Map<String, dynamic>> orderlist = [
  {'id': 1, 'name': 'ถึงโกดัง', 'images': 'assets/images/warehousechinese.png'},
  {
    'id': 2,
    'name': 'อยู่ระหว่างการขนส่ง',
    'images': 'assets/images/shipprocess.png'
  },
  {'id': 3, 'name': 'ถึงโกดังไทย', 'images': 'assets/images/thaiwerehouse.png'},
  {
    'id': 4,
    'name': 'รอชำระค่าขนส่ง',
    'images': 'assets/images/waitingpayment.png'
  },
  {'id': 5, 'name': 'จัดส่งสำเร็จ', 'images': 'assets/images/ordersucces.png'},
];

const List<Map<String, dynamic>> listimportcorrect = [
  {
    'id': 1,
    'name': 'นำเข้าถูกต้อง',
    'images': 'assets/images/correctimport.png'
  },
  {
    'id': 2,
    'name': 'รอตรวจสอบเอกสาร',
    'images': 'assets/images/waitforverifi.png'
  },
  {'id': 3, 'name': 'รอชำระภาษี', 'images': 'assets/images/taxpayment.png'},
  {
    'id': 4,
    'name': 'อยู่ระหว่างดำเนินการ',
    'images': 'assets/images/duringprocess.png'
  },
  {'id': 5, 'name': 'เสร็จสิน', 'images': 'assets/images/finish.png'},
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

const List<String> importlist = [
  'assets/images/importcorrect.png',
  'assets/images/customclear.png',
  'assets/images/fcl.png',
  'assets/images/tourprivate.png',
  'assets/images/werehouse.png',
  'assets/images/payment.png',
  'assets/images/export.png',
  'assets/images/freight.png',
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

const List<Map<String, dynamic>> importwidget = [
  {
    'id': 1,
    'name': 'นำเข้าถูกต้อง',
    'images': 'assets/icons/correctimport.png',
  },
  {
    'id': 2,
    'name': 'นำเข้าเหมาภาษี',
    'images': 'assets/icons/importtax.png',
  },
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
  MenuItem(imagePath: 'assets/icons/redcar.png', text: 'สรุปการขนส่ง'),
  MenuItem(imagePath: 'assets/icons/fav.png', text: 'รายการโปรด'),
  MenuItem(imagePath: 'assets/images/article.png', text: 'บทความ'),
  MenuItem(imagePath: 'assets/icons/guide.png', text: 'คู่มือการใช้งาน'),
  MenuItem(imagePath: 'assets/icons/report.png', text: 'แจ้งปัญหา'),
  MenuItem(imagePath: 'assets/icons/help.png', text: 'ช่วยเหลือ'),
  MenuItem(imagePath: 'assets/icons/contact.png', text: 'ติดต่อเรา'),
  MenuItem(imagePath: 'assets/icons/setting.png', text: 'ตั้งค่า'),
];

const List<Map<String, dynamic>> ordersum = [
  {
    'id': 1,
    'month': 'สิงหาคม 2567',
    'amount': '00,000 บาท',
    'detailLink': 'ดูรายละเอียด',
    'images': 'assets/icons/ordermont.png'
  },
  {
    'id': 2,
    'month': 'กรกฎาคม 2567',
    'amount': '00,000 บาท',
    'detailLink': 'ดูรายละเอียด',
    'images': 'assets/icons/ordermont.png'
  },
  {
    'id': 3,
    'month': 'มิถุนายน 2567',
    'amount': '00,000 บาท',
    'detailLink': 'ดูรายละเอียด',
    'images': 'assets/icons/ordermont.png'
  }
];

const List<Map<String, dynamic>> transport = [
  {
    'id': 1,
    'month': 'สิงหาคม 2567',
    'amount': '00,000 บาท',
    'detailLink': 'ดูรายละเอียด',
    'images': 'assets/icons/ordermont.png'
  },
  {
    'id': 2,
    'month': 'กรกฎาคม 2567',
    'amount': '00,000 บาท',
    'detailLink': 'ดูรายละเอียด',
    'images': 'assets/icons/ordermont.png'
  },
  {
    'id': 3,
    'month': 'มิถุนายน 2567',
    'amount': '00,000 บาท',
    'detailLink': 'ดูรายละเอียด',
    'images': 'assets/icons/ordermont.png'
  }
];

const List<Map<String, dynamic>> listallProducts = [
  {
    'category': 'เสื้อ',
    'products': [
      {'name': 'เสื้อยืด', 'image': 'assets/images/t_shirt.png'},
      {'name': 'เสื้อเชิ้ต', 'image': 'assets/images/shirt.png'},
      {'name': 'เสื้อสเวตเตอร์', 'image': 'assets/images/sweater.png'},
      {'name': 'เสื้อโปโล', 'image': 'assets/images/t_shirt.png'},
      {'name': 'เสื้อกล้าม', 'image': 'assets/images/shirt.png'},
      {'name': 'เสื้อฮอก', 'image': 'assets/images/sweater.png'},
    ]
  },
  {
    'category': 'กางเกง/กระโปรง',
    'products': [
      {'name': 'กางเกงขาสั้น', 'image': 'assets/images/t_shirt.png'},
      {'name': 'กางเกงขายาว', 'image': 'assets/images/shirt.png'},
      {'name': 'กระโปรงสั้น', 'image': 'assets/images/sweater.png'},
      {'name': 'กระโปรงยาว', 'image': 'assets/images/shirt.png'},
      {'name': 'เดรส', 'image': 'assets/images/t_shirt.png'},
    ]
  },
  {
    'category': 'รองเท้า',
    'products': [
      {'name': 'รองเท้าแตะ', 'image': 'assets/images/t_shirt.png'},
      {'name': 'รองเท้าผ้าใบ', 'image': 'assets/images/shirt.png'},
      {'name': 'รองเท้าส้นสูง', 'image': 'assets/images/sweater.png'},
    ]
  }
];

const List<Map<String, dynamic>> itemfav = [
  {
    'storeName': '1688严选店',
    'storeItems': [
      {
        'id': 1,
        'name': 'ชั้นวางพลาสติกในครัว, ชั้นวางของในห...',
        'imageAssetPath': 'assets/images/shelf.png',
      },
      {
        'id': 2,
        'name': 'ชั้นวางพลาสติกในครัว, ชั้นวางของในห...',
        'imageAssetPath': 'assets/images/shelf.png',
      },
    ],
  },
  {
    'storeName': 'taobao严选店',
    'storeItems': [
      {
        'id': 1,
        'name':
            'กล่องเก็บผ้าฝ้ายและผ้าลินิน Tianshan, ตะกร้าเก็บเสื้อผ้าในครัวเรือน,กล่องเก็บกํามะหยี่,ที่เก็บผ้านวม',
        'imageAssetPath': 'assets/images/box.png',
      },
      {
        'id': 2,
        'name':
            'ผ้าพันคอลายพรางผ้าไหมมัลติฟังก์ชั่น, ผ้าพันคอฤดูร้อนปั่นจักรยาน',
        'imageAssetPath': 'assets/images/headband.png',
      },
    ],
  },
];

const List<Map<String, dynamic>> importcard = [
  {
    'id': 1,
    'Importercode': 'AAAA',
    'Sendbycar': 'AAAA/EK',
    'Sendbyboat': 'AAAA/SEA',
  },
];

List<Map<String, dynamic>> problemData = [
  {
    'id': 1,
    'imagePath': 'assets/icons/bills.png',
    'title': 'ติดตามสถานะบิลสั่งซื้อ และสินค้า',
    'options': [
      'ติดตามการสั่งซื้อ',
      'ติดตามการจัดส่งสินค้า',
      'ติดตามการรับเงินจากร้านค้า',
      'ตรวจสอบยอดรวมที่ไม่ถูกต้อง',
    ],
  },
  {
    'id': 2,
    'imagePath': 'assets/icons/importproblem.png',
    'title': 'ปัญหาด้านการขนส่ง',
    'options': [
      'ติดตามการจัดส่งสินค้าในไทย',
      'ขออัปเดตสินค้าไปยังสถานที่จัดส่ง',
      'เปลี่ยนเส้นทางการจัดส่ง',
      'ปัญหาสินค้าหาย / ปริมาณไม่ถูกต้อง',
      'แจ้งสินค้าเสียหายที่เกิดขึ้นในไทย',
    ],
  },
  {
    'id': 3,
    'imagePath': 'assets/icons/moneyproblem.png',
    'title': 'ปัญหาด้านการเงิน',
    'options': [
      'เพิ่มเงิน / คืนเงิน / ถอนเงิน',
      'ติดตามการรับเงินจากร้านของขวัญ',
      'สอบถามการเปลี่ยนแปลง / ใบกำกับภาษี',
      'ค่าธรรมเนียมที่ไม่ได้ถูกต้อง',
    ],
  },
  {
    'id': 4,
    'imagePath': 'assets/icons/bills.png', //no images
    'title': 'การบริการหลังการขาย',
    'options': [
      'แจ้งตรวจสอบค่าขนส่งในจีน/ค่าสินค้า',
      'แจ้งตรวจสอบสินค้าไม่ครบ/สูญหาย',
      'แจ้งตรวจสอบได้รับสินค้าผิดแบบ/ผิดสี/ผิดไซส์',
      'แจ้งตรวจสอบปัญหาด้านคุณภาพสินค้า/สินค้าใช้งานไม่ได้',
    ],
  },
  {
    'id': 5,
    'imagePath': 'assets/icons/bills.png', //no images
    'title': 'การติดต่อสื่อสาร',
    'options': [
      'ติดต่อเจ้าหน้าที่ Call Center',
      'ระบบโทรศัพท์ขัดข้อง',
    ],
  },
  {
    'id': 6,
    'imagePath': 'assets/icons/bills.png', //no images
    'title': 'ปัญหาด้านเว็บไซต์',
    'options': [
      'เว็บไซต์ใช้งานยาก',
      'เว็บไซต์แสดงผลไม่ถูกต้อง',
      'ไม่สามารถแจ้งปัญหาได้',
      'ไม่สามารถเพิ่มตะกร้าเข้าสินค้าได้'
    ],
  },
  {
    'id': 7,
    'imagePath': 'assets/icons/bills.png', //no images
    'title': 'การอบรมสัมนา',
    'options': [
      'สอบถามวัน/เวลา/สถานที่',
    ],
  },
  {
    'id': 8,
    'imagePath': 'assets/icons/bills.png', //no images
    'title': 'สอบถามข้อมูลเพิ่มเติม',
    'options': [
      'แนะนำการบริการ',
      'สอบถามข้อมูลเพิ่มเติม',
      'บริการล่ามและค้นหาค้นหาสินค้า',
      'ร้องเรียนการบริการ'
    ],
  },
  {
    'id': 9,
    'imagePath': 'assets/icons/bills.png', //no images
    'title': 'โปรโมชั่น/คูปอง/ของรางวัล',
    'options': [
      'แจ้งปัญหาการใช้คูปอง',
      'ติดต่อรับของรางวัล',
      'สอบถามเกี่ยวกับโปรโมชั่น',
    ],
  },
];

final Map<String, String> guangzhouInfo = {
  '收货人': '阿苏 (AAAA)',
  '详细地址': 'TEG CARGO仓广东省广州市白云区唐自头村105A仓28号3栋',
  '邮编': '510450',
  '手机': '18520290139',
};

final Map<String, String> yiwuInfo = {
  '收货人': '王五 (AAAA)',
  '详细地址': 'TEG CARGO仓浙江省义乌市佛堂镇 105B仓22号1栋',
  '邮编': '322000',
  '手机': '18520290139',
};

List<Map<String, dynamic>> guidelist= [
  {
    'image': 'assets/images/tag1.png',
    'title': 'วิธี ...',
    'subtitle': '',
  },
  {
    'image': 'assets/images/tag1.png',
    'title': 'วิธี ...',
    'subtitle': '',
  },
  // เพิ่มรายการอื่น ๆ ตามต้องการ
];

const List<Map<String, dynamic>> palceanorder = [
  {
    'id': 1,
    'images': 'assets/icons/waitsum.png',
    'title': 'รอสรุปยอด',
    'process': 'x',
  },
  {
    'id': 2,
    'images': 'assets/icons/waitingorderpayment.png',
    'title': 'รอชำระคำสั่งซื้อ',
    'process': 'x',
  },
  {
    'id': 3,
    'images': 'assets/icons/orderpending.png',
    'title': 'อยู่ระหว่างการสั่งซื้อ',
    'process': 'x',
  },
  {
    'id': 4,
    'images': 'assets/icons/packingtrack.png',
    'title': 'อยู่ระหว่างการสั่งซื้อ',
    'process': 'x',
  },
  {
    'id': 5,
    'images': 'assets/icons/delivery.png',
    'title': 'จัดส่งสินค้าแล้ว',
    'process': 'x',
  },
  {
    'id': 6,
    'images': 'assets/icons/cancle.png',
    'title': 'ยกเลิก/ล้มเหลว',
    'process': 'x',
  },
];

const List<Map<String, dynamic>> tracktransport = [
  {
    'id': 1,
    'images': 'assets/icons/atwerehousechinese.png',
    'title': 'ถึงโกดังจีน',
    'process': 'x',
  },
  {
    'id': 2,
    'images': 'assets/icons/duringimport.png',
    'title': 'อยู่ระหว่างการขนส่ง',
    'process': 'x',
  },
  {
    'id': 3,
    'images': 'assets/icons/waitingorderpayment.png',
    'title': 'รอชำระคำขนส่ง',
    'process': 'x',
  },
  {
    'id': 4,
    'images': 'assets/icons/atwerehousethai.png',
    'title': 'ถึงโกดังไทย',
    'process': 'x',
  },
  {
    'id': 5,
    'images': 'assets/icons/delivery.png',
    'title': 'จัดส่งสำเร็จ',
    'process': 'x',
  },
];

const List<Map<String, dynamic>> correctimporttrack = [
  {
    'id': 1,
    'images': 'assets/icons/docsimport.png',
    'title': 'นำเข้าเอกสาร',
    'process': 'x',
  },
  {
    'id': 2,
    'images': 'assets/icons/duringprogress.png',
    'title': 'รอตรวจสอบเอกสาร',
    'process': 'x',
  },
  {
    'id': 3,
    'images': 'assets/icons/waitingorderpayment.png',
    'title': 'รอชำระคำภาษี',
    'process': 'x',
  },
  {
    'id': 4,
    'images': 'assets/icons/waitdocs.png',
    'title': 'อยู่ระหว่างดำเนินการ',
    'process': 'x',
  },
  {
    'id': 5,
    'images': 'assets/icons/delivery.png',
    'title': 'จัดส่งสำเร็จ',
    'process': 'x',
  },
];