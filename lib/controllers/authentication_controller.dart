import 'package:flash/flash.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/components/flushbar_helper.dart';
import 'package:task/helpers/network_util.dart';
import 'package:task/helpers/url.dart';
import 'package:task/screens/home_screen.dart';
import 'package:task/screens/login_screen.dart';

class AuthenticationController extends GetxController {
  final NetworkUtil _networkUtil = NetworkUtil();
  RxBool isLoading = RxBool(false);
  Future loginUser({String name, String password}) async {
    Map<String, dynamic> formData = {"username": name, "password": password};
    final response =
        await _networkUtil.post("${Urls.baseUrl}/login", body: formData);
    if (response.statusCode == 200) {
      isLoading.value = false;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", response.data["user"]["api_token"]);
      prefs.setString("username", response.data["user"]["username"]);
      prefs.setString("email", response.data["user"]["email"]);
      prefs.setString("phone", response.data["user"]["phone"]);
      prefs.setInt("id", response.data["user"]["id"]);
      Get.offAll(HomeScreen());
      FlashHelper().successBar(message: response.data['message']);
    } else {
      isLoading.value = false;
    }
  }

  Future registerUser(
      {String name, String password, String phone, String email}) async {
    Map<String, dynamic> formData = {
      "username": name,
      "phone": phone,
      "email": email,
      "password": password
    };
    final response =
        await _networkUtil.post("${Urls.baseUrl}/register", body: formData);
    if (response.statusCode == 200) {
      isLoading.value = false;

      Get.offAll(LoginScreen());

    } else {
      isLoading.value = false;
         FlashHelper().errorBar(message: response.data['message']);
    }
  }

}
