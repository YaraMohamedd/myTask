import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/helpers/network_util.dart';
import 'package:task/helpers/url.dart';
import 'package:task/models/user_response_model.dart';

import 'package:task/screens/home_screen.dart';

class ProfileController extends GetxController {
  final NetworkUtil _networkUtil = NetworkUtil();
  RxBool isLoading = RxBool(false);

  Future<UserResponseModel> getProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("id");
    String token = prefs.getString("token");
    Map<String, dynamic> formData = {"user_id": id, "access_token": token};
    final response =
        await _networkUtil.post("${Urls.baseUrl}/profile", body: formData);
    if (response.statusCode == 200) {
      isLoading.value = false;
      print(response.data);
      return UserResponseModel.fromJson(jsonDecode(response.toString()));
    } else {
      isLoading.value = false;
    }
  }

  Future updateUserData(
      {String userName, String phone, String email, String password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("id");
    String token = prefs.getString("token");
    Map<String, dynamic> formData = {
      "user_id": id,
      "access_token": token,
      "username": userName,
      "phone": phone,
      "email": email,
      "password": password
    };
    final response = await _networkUtil.post("${Urls.baseUrl}/update-profile",
        body: formData);
    if (response.statusCode == 200) {
      isLoading.value = false;
      Get.offAll(HomeScreen());
    } else {
      isLoading.value = false;
    }
  }
}
