import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/constants.dart';
import 'package:task/screens/home_screen.dart';
import 'package:task/screens/profile_screen.dart';

class CustomNavBar extends StatelessWidget {
  final int index;

  const CustomNavBar({Key key, this.index}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor:buttonTextColor,
        showSelectedLabels: false,
        currentIndex: index,
        backgroundColor:buttonTextColor ,
        showUnselectedLabels: false,
        items:  [
          BottomNavigationBarItem(
            label: 'home',
            icon: InkWell(
                onTap: (){
                  Get.offAll(HomeScreen());
                },
                child: Icon(Icons.home,color: index==0?backgroundColor:containerColor,)),
          ),
          BottomNavigationBarItem(
            label: 'profile',
            icon: InkWell(
                onTap: (){
                  Get.to(ProfileScreen());
                },
                child:Icon(Icons.person,color: index==1?backgroundColor:containerColor,)),
          ),

        ],
      ),
    );
  }
}
