
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/components/custom_button.dart';
import 'package:task/components/custom_text_field.dart';
import 'package:task/controllers/profile_controller.dart';
import 'package:task/models/user_response_model.dart';

import '../constants.dart';

// ignore: must_be_immutable
class EditAccount extends StatelessWidget {
  final User snapshot;
  final controller = Get.put(ProfileController());
  EditAccount({Key key, this.snapshot}) : super(key: key) {
    name.value = snapshot.username ?? '';
    phone.value = snapshot.phone ?? '';
    mail.value = snapshot.email ?? '';
  }
  RxString name = RxString('');
  RxString phone = RxString('');
  RxString mail = RxString('');
  RxString password = RxString('');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Obx(() => Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    validator: (String value) {

                      if (name.value.isEmpty || name.value.length < 2) {
                        return 'برجاء ادخال اسم لا يقل عن ٣ احرف';

                      }
                    },
                    onChanged: (String value) {
                      name.value = value;
                    },
                    initialValue: name.value,
                  ),
                  CustomTextField(
                    onChanged: (String value) {
                      phone.value = value;
                    },
                    validator: (String value) {
                      String patttern = r'(^(?:[+0]9)?[0-9]{11}$)';
                      RegExp regExp = RegExp(patttern);
                      if (phone.value.isEmpty || phone.value.length < 3) {
                        return  'برجاء ادخال رقم الهاتف' ;
                      }
                      else if (!regExp.hasMatch(phone.value)) {
                        return  'برجاء ادخال رقم هاتف لا يقل عن 11 رقم';
                      }
                    },
                    initialValue: phone.value,
                  ),
                  CustomTextField(
                    validator: (String value) {
                      if (mail.value.isEmpty || !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                          .hasMatch(mail.value)) {
                        return  'برجاء ادخال  بريد الكتروني صالح' ;
                      }
                    },
                    onChanged: (String value) {
                      mail.value = value;
                    },
                    initialValue: mail.value,
                  ),
                  CustomButton(
                    height: 40,
                    buttonName: 'Save Data',
                      onPressed: () {
                      if(_formKey.currentState.validate()){
                        controller.updateUserData(
                            userName: name.value,
                            phone: phone.value,
                            email: mail.value,
                            password: mail.value);
                      }
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
