import 'package:get/get.dart';
import 'package:task/controllers/authentication_controller.dart';
import 'package:task/controllers/home_controller.dart';
import 'package:task/controllers/profile_controller.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthenticationController());
    Get.lazyPut(() => HomeController());
     Get.lazyPut(() => ProfileController());
  }

}