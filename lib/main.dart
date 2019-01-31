import 'package:flutter/material.dart';
import 'package:login_app/anima.dart';
import 'package:login_app/dashboard.dart';
import 'package:login_app/homepage.dart';
import 'package:login_app/loginpage.dart';
import 'package:login_app/signuppage.dart';
 

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
    
      home: loginpage(),
      routes: <String, WidgetBuilder>{
        "/landing" :(BuildContext context) =>MyApp(),
        "/login":(BuildContext context) =>loginpage(),
        "/signup":(BuildContext context) =>SingUpPage(),
        "/home":(BuildContext context)=>homepage(),
        "/dashbord":(BuildContext context)=>DashboardPage(),
         "/anima":(BuildContext context)=>anima(),
      },
    );
  }
}
