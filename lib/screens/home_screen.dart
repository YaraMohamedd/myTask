import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/components/custom_nav_bar.dart';
import 'package:task/components/restaurant_card.dart';
import 'package:task/controllers/authentication_controller.dart';
import 'package:task/controllers/home_controller.dart';
import 'package:task/models/home_response_model.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {

   HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller=Get.put(HomeController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getHomeData();
    getDataOffline();

  }
  String image1,image2,image3,image4,image5,image6,image7,image8;
  String name1,name2,name3,name4,name5,name6,name7,name8;
  Future getDataOffline()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    image1=prefs.getString("image1");
    name1=prefs.getString("name1");
    image2=prefs.getString("image2");
    name2=prefs.getString("name2");
    image3=prefs.getString("image3");
    name3=prefs.getString("name3");
    image4=prefs.getString("image4");
    name4=prefs.getString("name4");
    image5=prefs.getString("image5");
    name5=prefs.getString("name5");
    image6=prefs.getString("image6");
    name6=prefs.getString("name6");
    image7=prefs.getString("image7");
    name7=prefs.getString("name7");
    image8=prefs.getString("image8");
    name8=prefs.getString("name8");

  }

  @override
  Widget build(BuildContext context) {
    return  RefreshIndicator(
      onRefresh: () => Future.delayed(Duration.zero, () {
         controller.getHomeData();
      }),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          automaticallyImplyLeading:false,
          backgroundColor: backgroundColor,
          title: const Text(' Home'),
          centerTitle: true,
        ),
        body: FutureBuilder<HomeResponseModel>(
          future:
            controller.getHomeData(),

            // ignore: missing_return
            builder:(context,snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data.restaurants.length,
                    itemBuilder: (context,index){
                   return RestaurantCard(
                 image: snapshot.data.restaurants[index].image??'',
                     name: snapshot.data.restaurants[index].name??'',
                  );
                });
              }else{
                 if(name1==null){
                   return Center(child: CircularProgressIndicator(color: backgroundColor,));
                 }
                  return ListView(
                    children: [
                      RestaurantCard(
                        image: image1,
                        name: '$name1'??'',
                      ),
                      RestaurantCard(
                        image: image2,
                        name: '$name2'??'',
                      ),
                      RestaurantCard(
                        image: image3,
                        name: '$name3'??'',
                      ),
                      RestaurantCard(
                        image: image4,
                        name: '$name4'??'',
                      ),

                      RestaurantCard(
                        image: image5,
                        name: '$name5'??'',
                      ),
                      RestaurantCard(
                        image: image6,
                        name: '$name6'??'',
                      ),
                      RestaurantCard(
                        image: image7,
                        name: '$name7'??'',
                      ),
                      RestaurantCard(
                        image: image8,
                        name: '$name8'??'',
                      ),
                    ],
                  );

              }

        } ),
        bottomNavigationBar: const CustomNavBar(
          index: 0,
        ),
      ),
    );
  }
}
