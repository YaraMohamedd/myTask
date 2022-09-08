
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:task/helpers/size_config.dart';
import 'package:task/screens/home_screen.dart';
import 'package:task/screens/login_screen.dart';

import '../constants.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key key}) : super(key: key);


  @override
  // ignore: library_private_types_in_public_api
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {


  _startNextScreen() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    var token=preferences.getString('token');
    if (token != null) {
      Get.off(HomeScreen());
    } else {
      Get.off(const LoginScreen());
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, _startNextScreen);

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        width: SizeConfig().blockSizeHorizontal() * 100,
        height: SizeConfig().blockSizeVertical() * 100,
        decoration: BoxDecoration(
        ),
        child: Center(
          child: Hero(
            tag: 'logo1',
            child: Material(
              color: Colors.transparent,
              elevation: 20.0,
              borderOnForeground: false,
              borderRadius: BorderRadius.circular(4.0),
              child: SizedBox(
                  height: 120,
                  //height: animation.value !=null?animation.value*120:0,
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.contain,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

