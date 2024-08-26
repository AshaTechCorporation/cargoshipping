import 'package:cargoshipping/home/firstPage.dart';
import 'package:cargoshipping/login/loginPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // home: LoginPage(),
      // routes: {
      //   '/home': (context) => FirstPage(),
      //   '/login': (context) => LoginPage(),
      // },
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
              titleTextStyle:
                  TextStyle(fontFamily: 'SukhumvitSet', fontSize: 16)),
          fontFamily: 'SukhumvitSet'),
      home: LoginPage(),
    );
  }
}
