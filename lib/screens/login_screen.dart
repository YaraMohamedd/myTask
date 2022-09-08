import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:task/components/custom_button.dart';
import 'package:task/components/custom_text_button.dart';
import 'package:task/constants.dart';
import 'package:task/controllers/authentication_controller.dart';
import 'package:task/helpers/size_config.dart';
import 'package:task/screens/registeration_screen.dart';
import '../components/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _passwordFocus = FocusNode();

  final RxBool isVisible = RxBool(false);
  final FocusNode _userNameFocus = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController userName = TextEditingController();

  final TextEditingController password = TextEditingController();
  SizeConfig sizeConfig = SizeConfig();
  final AuthenticationController controller =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          SizedBox(height: (sizeConfig.screenHeight / 2) - 200),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: RoundedDiagonalPathClipper(),
                    child: Container(
                      height: 400,
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        color: containerColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextField(
                            controller: userName,
                            prefixIcon: const Icon(Icons.person),
                            hintText: 'User Name',
                            validator: (String value) {
                              if ( value.length < 3) {
                                return 'برجاء ادخال اسم لا يقل عن ٣ احرف';
                              }
                            },
                            onSubmitted: (tern) => () {
                              _userNameFocus.unfocus();
                              FocusScope.of(context).unfocus();
                              // Hide KeyBord
                            },
                          ),
                          Obx(() => CustomTextField(
                                maxLines: 1,
                                secureText: isVisible.value ? false : true,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    isVisible.value = !isVisible.value;
                                  },
                                  child: Icon(isVisible.value == true
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                                controller: password,
                                secure: () {
                                  isVisible.value = !isVisible.value;
                                },
                                prefixIcon: Icon(Icons.lock),
                                hintText: 'password',
                                validator: (String value) {
                                  if (value.isEmpty || value.length < 9) {
                                    return 'برجاء ادخال رقم سري لا يقل عن تسع احرف';
                                  }
                                },
                                onSubmitted: (tern) => () {
                                  _passwordFocus.unfocus();
                                  FocusScope.of(context).unfocus();
                                  // Hide KeyBord
                                },
                              )),
                          CustomTextButton(
                            buttonText: 'Create Account?',
                            color: buttonTextColor,
                            onPressed: () {
                              Get.to(const SignUpScreen());
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    height: 420,
                    buttonName: 'Login',
                    onPressed: () {
                     // _formKey.currentState.save;
                       if(_formKey.currentState.validate()){
                         controller.loginUser(
                             name: userName.text, password: password.text);
                       }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
