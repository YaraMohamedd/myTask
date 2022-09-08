import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/components/custom_button.dart';
import 'package:task/components/custom_nav_bar.dart';
import 'package:task/components/my_account.dart';
import 'package:task/controllers/profile_controller.dart';
import 'package:task/models/user_response_model.dart';
import 'package:task/screens/edit_account_screen.dart';

import '../constants.dart';


class ProfileScreen extends StatefulWidget {


  ProfileScreen({Key key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name;
  String phone;
  String mail;
  String token;
  final ProfileController controller = Get.put(ProfileController());
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOffLineData();
    Future.delayed( Duration.zero, () {
      controller.getProfileData();
    });
  }
  Future getOffLineData()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    name=prefs.getString("username");
    phone=prefs.getString("phone");
    mail=prefs.getString("email");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(' Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
        FutureBuilder<UserResponseModel>(
          future: controller.getProfileData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [

                    MyAccount(
                      value: snapshot.data.user.username,
                      text: 'User Name',
                    ),
                    MyAccount(
                      value: snapshot.data.user.phone,
                      text: 'phone',
                    ),
                    MyAccount(
                      value: snapshot.data.user.email,
                      text: 'Email',
                    ),
                       CustomButton(
                      height: 40,
                      buttonName: 'Edit Profile',
                      onPressed: () {
                        Get.to(EditAccount(
                          snapshot: snapshot.data.user,
                        ));
                      },
                    ),

                  ],
                ),
              );
            } else {
              if(name==null||phone==null||mail==null){
                return Center(child: const CircularProgressIndicator(color: backgroundColor,));
              }
              return  SingleChildScrollView(
                child: Column(
                  children: [
                    MyAccount(
                      value: '$name',
                      text: 'User Name',
                    ),
                    MyAccount(
                      value: '$phone',
                      text: 'phone',
                    ),
                    MyAccount(
                      value: '$mail',
                      text: 'Email',
                    ),
                    CustomButton(
                      height: 40,
                      buttonName: 'Edit Profile',
                      onPressed: () {
                        Get.to(EditAccount(
                          snapshot: snapshot.data.user,
                        ));
                      },
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: const CustomNavBar(
        index: 1,
      ),
    );
  }
}
