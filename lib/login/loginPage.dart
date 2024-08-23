import 'package:cargoshipping/home/firstPage.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                height: 99,
                width: 87,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/Frame 61.png'),
                    fit: BoxFit.fill, // ปรับแต่งการแสดงผลของภาพตามความต้องการ
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 43.91,
                width: 171.6,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/Frame 76.png'),
                    fit: BoxFit.fill, // ปรับแต่งการแสดงผลของภาพตามความต้องการ
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_2_outlined),
                  labelText: 'Email',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password', // Hint text
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove_red_eye_outlined),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'ลืมรหัสผ่าน?',
                          style: TextStyle(
                            color: Colors.blue[500],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => FirstPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 219, 18, 4),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 135, vertical: 12),
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
              const SizedBox(height: 15),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor:
                      Color.fromARGB(255, 219, 18, 4), // สีของข้อความ
                  backgroundColor: Colors.white, // สีพื้นหลังของปุ่ม
                  padding:
                      const EdgeInsets.symmetric(horizontal: 135, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Color.fromARGB(255, 219, 18, 4), // สีของขอบ
                      width: 2,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => registerpage()),
                  );
                },
                child: const Text(
                  'ลงทะเบียนผู้ใช้ใหม่',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 219, 18, 4), // สีของข้อความ
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'หรือ',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 35,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 100, vertical: 15), // การเว้นระยะในปุ่ม
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'ดำเนินต่อด้วยบัญชี Google',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 93, vertical: 15), // การเว้นระยะในปุ่ม
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    // มุมโค้งของปุ่ม
                  ),
                ),
                child: const Text(
                  'ดำเนินต่อด้วยบัญชี Facebook',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 110, vertical: 15), // การเว้นระยะในปุ่ม
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    // มุมโค้งของปุ่ม
                  ),
                ),
                child: const Text(
                  'ดำเนินต่อด้วยบัญชี Line',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 105, vertical: 15), // การเว้นระยะในปุ่ม
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'ดำเนินต่อด้วยบัญชี Apple',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
