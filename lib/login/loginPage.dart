import 'dart:io';

import 'package:cargoshipping/constants.dart';
import 'package:cargoshipping/home/firstPage.dart';
import 'package:cargoshipping/register/Agentpage.dart';
import 'package:cargoshipping/register/legalpersonpage.dart';
import 'package:cargoshipping/register/regisPage.dart';
import 'package:cargoshipping/register/server/registerService.dart';
import 'package:cargoshipping/widgets/Form.dart';
import 'package:cargoshipping/widgets/LoadingDialog.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String device_no = '';
  String notify_token = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await requestNotificationPermission();
      getToken();
      getdeviceId();
    });
  }

  void getdeviceId() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      // ดึงข้อมูล Android ID
      final androidInfo = await deviceInfo.androidInfo;
      device_no = androidInfo.id;
      print('android: ${device_no}');
    } else if (Platform.isIOS) {
      // ดึงข้อมูล Identifier for Vendor (iOS)
      final iosInfo = await deviceInfo.iosInfo;
      device_no = iosInfo.identifierForVendor!;
      print('iOS Identifier: ${iosInfo.identifierForVendor}');
    }
  }

  void getToken() async {
    var playerId = OneSignal.User.pushSubscription.id;
    notify_token = playerId ?? '';
    print('token: ${playerId}');
  }

  Future<void> requestNotificationPermission() async {
    if (Platform.isAndroid) {
      if (await Permission.notification.isGranted) {
        print("Notification permission already granted");
      } else {
        var status = await Permission.notification.request();
        if (status.isGranted) {
          print("Notification permission granted");
        } else if (status.isDenied) {
          print("Notification permission denied");
        } else if (status.isPermanentlyDenied) {
          print("Notification permission permanently denied");
          openAppSettings();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'เข้าสู่ระบบ',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.001,
                ),
                Container(
                  height: size.height * 0.12,
                  width: size.width * 0.23,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icons/Frame 61.png'),
                      fit: BoxFit.fill,
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
                SizedBox(height: size.height * 0.02),
                FromRegister(
                  width: size.width * 0.9,
                  controller: _emailController,
                  hintText: 'รหัสผู้นำเข้า',
                ),
                FromRegister(
                  width: size.width * 0.9,
                  controller: _passwordController,
                  hintText: 'รหัสผ่าน',
                  isPassword: true,
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
                SizedBox(
                  height: size.height * 0.059,
                  width: size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () async {
                      LoadingDialog.open(context);
                      if (notify_token == '') {
                        getToken();
                      }
                      try {
                        final token = await RegisterService.login(_emailController.text, _passwordController.text, device_no, notify_token);
                        if (token != null) {
                          final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
                          final SharedPreferences prefs = await _prefs;
                          await prefs.setString('token', token['token']);
                          await prefs.setInt('userID', token['userID']);
                          LoadingDialog.close(context);
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
                        }
                      } on ClientException catch (e) {
                        LoadingDialog.close(context);
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('แจ้งเตือน'),
                                  content: Text(e.toString()),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('ตกลง'),
                                    )
                                  ],
                                ));
                      } on SocketException catch (e) {
                        LoadingDialog.close(context);
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('แจ้งเตือน'),
                                  content: Text(e.toString()),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('ตกลง'),
                                    )
                                  ],
                                ));
                      } on HttpException catch (e) {
                        LoadingDialog.close(context);
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('แจ้งเตือน'),
                                  content: Text(e.toString()),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('ตกลง'),
                                    )
                                  ],
                                ));
                      } on FormatException catch (e) {
                        LoadingDialog.close(context);
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('แจ้งเตือน'),
                                  content: Text(e.toString()),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('ตกลง'),
                                    )
                                  ],
                                ));
                      } on Exception catch (e) {
                        LoadingDialog.close(context);
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('แจ้งเตือน'),
                                  content: Text(e.toString()),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('ตกลง'),
                                    )
                                  ],
                                ));
                      } catch (e) {
                        LoadingDialog.close(context);
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('แจ้งเตือน'),
                                  content: Text(e.toString()),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('ตกลง'),
                                    )
                                  ],
                                ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 219, 18, 4),
                      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'เข้าสู่ระบบ',
                      style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                SizedBox(
                  height: size.height * 0.059,
                  width: size.width * 0.9,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 219, 18, 4),
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(
                        color: Color.fromARGB(255, 219, 18, 4), // สีของขอบ
                        width: 1,
                      ),
                    ),
                    onPressed: () {
                      _showSelectionDialog(context);
                    },
                    child: const Text(
                      'ลงทะเบียนผู้ใช้ใหม่',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 219, 18, 4),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.018,
                ),
                Text(
                  'หรือ',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: size.height * 0.020,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height * 0.05,
                      width: size.width * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
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
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * 0.05,
                      width: size.width * 0.2,
                      decoration: BoxDecoration(
                        color: Color(0xff3c5a9a),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
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
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * 0.05,
                      width: size.width * 0.2,
                      decoration: BoxDecoration(
                        color: Color(0xff00b900),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
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
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * 0.05,
                      width: size.width * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showSelectionDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Text(
          'ท่านลงทะเบียนผู้ใช้ใหม่ในฐานะ ..',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildOption(
              context,
              'บุคคลทั่วไป',
              () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => registerpage(
                            type: 'บุคคลทั่วไป',
                          )),
                );
              },
            ),
            _buildOption(
              context,
              'นิติบุคคล',
              () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => registerpage(
                            type: 'นิติบุคคล',
                          )),
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Legalpersonpage()),
                // );
              },
            ),
            _buildOption(
              context,
              'ตัวแทน (Agent)',
              () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => registerpage(
                            type: 'ตัวแทน',
                          )),
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Agentpage()),
                // );
              },
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildOption(BuildContext context, String title, VoidCallback onTap) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      border: Border.all(color: red1, width: 1),
      borderRadius: BorderRadius.circular(15),
    ),
    child: ListTile(
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: red1, // กำหนดสีตัวหนังสือให้เป็นสีแดง
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onTap: onTap,
    ),
  );
}
