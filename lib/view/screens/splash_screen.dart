import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../settings/app_routes.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    navigationToHomeScreen();
    super.initState();
  }

  Future<void> navigationToHomeScreen() async{
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(milliseconds: 2000), () {
        Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SizedBox(
        height: double.infinity,
        child: Image.asset("assets/images/splash.jpg",fit: BoxFit.cover,),
      ),
    );
  }
}
