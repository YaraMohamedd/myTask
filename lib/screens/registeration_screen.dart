import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:task/components/custom_button.dart';

import '../components/custom_text_field.dart';
import '../constants.dart';
import '../controllers/authentication_controller.dart';
import '../helpers/size_config.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FocusNode _passwordFocus = FocusNode();

  final RxBool isVisible = RxBool(false);
  final FocusNode _userNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController userName = TextEditingController();

  final TextEditingController password = TextEditingController();
  final TextEditingController phone = TextEditingController();

  final TextEditingController email = TextEditingController();
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
            padding: EdgeInsets.all(20.0),
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
                            prefixIcon: Icon(Icons.person),
                            hintText: 'User Name',
                            validator: (String value) {

                              if (value.isEmpty || value.length < 2) {
                                return 'برجاء ادخال اسم لا يقل عن ٣ احرف';

                              }
                            },
                            onSubmitted: (tern) => () {
                              _userNameFocus.unfocus();
                              FocusScope.of(context).unfocus();
                              // Hide KeyBord
                            },
                          ),
                          CustomTextField(
                            controller: phone,
                            prefixIcon: Icon(Icons.phone),
                            hintText: 'phone',
                            validator: (String value) {
                              String patttern = r'(^(?:[+0]9)?[0-9]{11}$)';
                              RegExp regExp = RegExp(patttern);
                              if (value.isEmpty || value.length < 3) {
                                return  'برجاء ادخال رقم الهاتف' ;
                              }
                              else if (!regExp.hasMatch(value)) {
                                return  'برجاء ادخال رقم هاتف لا يقل عن 11 رقم';
                              }
                            },
                            onSubmitted: (tern) => () {
                              _phoneFocus.unfocus();
                              FocusScope.of(context).unfocus();
                              // Hide KeyBord
                            },
                          ),
                          CustomTextField(
                            controller: email,
                            prefixIcon: Icon(Icons.mail),
                            hintText: 'email',
                            validator: (String value) {
                              if (value.isEmpty || !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                              .hasMatch(value)) {
                                return  'برجاء ادخال  بريد الكتروني صالح' ;
                              }
                            },
                            onSubmitted: (tern) => () {
                              _emailFocus.unfocus();
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
                                    return 'برجاء ادخال رقم سري لا يقل عن 9 احرف';
                                  }
                                },
                                onSubmitted: (tern) => () {
                                  _passwordFocus.unfocus();
                                  FocusScope.of(context).unfocus();
                                  // Hide KeyBord
                                },
                              ))
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    height: 420,
                      buttonName: 'Sign Up',
                      onPressed: () {
                       if(_formKey.currentState.validate()){
                         controller.registerUser(
                             name: userName.text,
                             password: password.text,
                             phone: phone.text,
                             email: email.text);
                       }
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
