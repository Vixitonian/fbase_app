// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:fbase_app/home_screen.dart';
import 'package:fbase_app/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.scheduleFrameCallback((_) {
      if (FirebaseAuth.instance.currentUser == null) {
        Timer(Duration(seconds: 2), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => LoginScreen()));
        });
      } else {
        Timer(Duration(seconds: 2), () {
          var user = FirebaseAuth.instance.currentUser;
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => HomeScreen()));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'FBASE',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
