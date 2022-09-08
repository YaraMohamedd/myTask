import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/helpers/network_util.dart';
import 'package:task/helpers/url.dart';
import 'package:task/models/home_response_model.dart';

class HomeController extends GetxController {
  final NetworkUtil _networkUtil = NetworkUtil();
  RxBool isLoading = RxBool(false);
  // ignore: missing_return
  Future<HomeResponseModel> getHomeData() async {
    final response = await _networkUtil.dio.get("${Urls.baseUrl}/home");

    if (response.statusCode == 200) {
      isLoading.value = false;
       SharedPreferences prefs=await SharedPreferences.getInstance();
       prefs.setString("name1", response.data["restaurants"][0]["name"]);
      prefs.setString("image1", response.data["restaurants"][0]["image"]);
      prefs.setString("name2", response.data["restaurants"][1]["name"]);
      prefs.setString("image2", response.data["restaurants"][1]["image"]);
      prefs.setString("name3", response.data["restaurants"][2]["name"]);
      prefs.setString("image3", response.data["restaurants"][2]["image"]);
      prefs.setString("name4", response.data["restaurants"][3]["name"]);
      prefs.setString("image4", response.data["restaurants"][3]["image"]);
      prefs.setString("name5", response.data["restaurants"][4]["name"]);
      prefs.setString("image5", response.data["restaurants"][4]["image"]);
      prefs.setString("name6", response.data["restaurants"][5]["name"]);
      prefs.setString("image6", response.data["restaurants"][5]["image"]);
      prefs.setString("name7", response.data["restaurants"][6]["name"]);
      prefs.setString("image7", response.data["restaurants"][6]["image"]);
      prefs.setString("name8", response.data["restaurants"][7]["name"]);
      prefs.setString("image8", response.data["restaurants"][7]["image"]);
      return HomeResponseModel.fromJson(jsonDecode(response.toString()));
    } else {
      isLoading.value = false;
    }
  }
}
