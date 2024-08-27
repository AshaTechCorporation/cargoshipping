import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/firstPage.dart';
import 'package:cargoshipping/register/Agentpage.dart';
import 'package:cargoshipping/register/legalpersonpage.dart';
import 'package:cargoshipping/register/regisPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                height: size.height * 0.12,
                width: size.width * 0.23,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/Frame 61.png'),
                    fit: BoxFit.fill, // ปรับแต่งการแสดงผลของภาพตามความต้องการ
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                height: size.height * 0.055,
                width: size.width * 0.45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/Frame 76.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.027),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Image.asset('assets/images/userlogin.png'),
                  labelText: 'รหัสผู้นำเข้า',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'รหัสผ่าน',
                  prefixIcon: Image.asset(
                    'assets/icons/password.png',
                    height: size.height * 0.001,
                  ),
                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: Image.asset('assets/icons/eyepass.png'))
                    ],
                  ),
                ),
                obscureText: true,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'ลืมรหัสผ่าน?',
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pushReplacement(
                    MaterialPageRoute(builder: (context) => FirstPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 219, 18, 4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 135, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'เข้าสู่ระบบ',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor:
                      Color.fromARGB(255, 219, 18, 4), // สีของข้อความ
                  backgroundColor: Colors.white, // สีพื้นหลังของปุ่ม
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: BorderSide(
                    color: Color.fromARGB(255, 219, 18, 4), // สีของขอบ
                    width: 2,
                  ),
                ),
                onPressed: () {
                  _showSelectionDialog(context);
                },
                child: const Text(
                  'ลงทะเบียนผู้ใช้ใหม่',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 219, 18, 4),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              Text(
                'หรือ',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: size.height * 0.012,
              ),
              Container(
                height: size.height * 0.06,
                width: size.width * 0.91,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black.withOpacity(0.1), // สีของเงาและความทึบ
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/google.png'),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Text(
                        'ดำเนินการต่อด้วยบัญชี Google',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: size.height * 0.06,
                width: size.width * 0.91,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black.withOpacity(0.1), // สีของเงาและความทึบ
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/facebook.png'),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Text(
                        'ดำเนินการต่อด้วยบัญชี Facebook',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: size.height * 0.06,
                width: size.width * 0.91,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black.withOpacity(0.1), // สีของเงาและความทึบ
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/line.png'),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Text(
                        'ดำเนินการต่อด้วยบัญชี Line',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: size.height * 0.06,
                width: size.width * 0.91,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black.withOpacity(0.1), // สีของเงาและความทึบ
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/apple.png'),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Text(
                        'ดำเนินการต่อด้วยบัญชี Apple',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showSelectionDialog(BuildContext context) {
  final size = MediaQuery.of(context).size;
  showDialog(
    context: context,
    barrierDismissible: true, // อนุญาตให้ปิด dialog โดยการกดที่ว่าง
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(16), // เพิ่ม Padding รอบๆ ขอบของ Dialog
        title: Text(
          'ท่านลงทะเบียนผู้ใช้ใหม่ในฐานะ ..',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold), // ปรับขนาดฟอนต์ของ Title
        ),
        content: SizedBox(
          width: 300, // กำหนดความกว้างของ Dialog
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildOption(
                context,
                'บุคคลทั่วไป',
                () {
                  // ปิด AlertDialog ก่อนที่จะ push ไปยังหน้าใหม่
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => registerpage()),
                  );
                },
              ),
              _buildOption(
                context,
                'นิติบุคคล',
                () {
                  // ปิด AlertDialog ก่อนที่จะ push ไปยังหน้าใหม่
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Legalpersonpage()),
                  );
                },
              ),
              _buildOption(
                context,
                'ตัวแทน (Agent)',
                () {
                  // ปิด AlertDialog ก่อนที่จะ push ไปยังหน้าใหม่
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Agentpage()),
                  );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}



Widget _buildOption(BuildContext context, String title, VoidCallback onTap) {
  final size = MediaQuery.of(context).size;
  return Container(
    width: size.width * 0.9,
    height: size.height * 0.07,
    margin: const EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.red, width: 2),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Center(
      child: ListTile(
        title: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 16,color: red1,fontWeight: FontWeight.bold), // ปรับขนาดฟอนต์ของตัวเลือก
          ),
        ),
        onTap: onTap,
      ),
    ),
  );
}
