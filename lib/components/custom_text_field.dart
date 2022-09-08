import 'package:flutter/material.dart';
import 'package:task/constants.dart';


class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function onSubmitted;
  final Widget prefixIcon;
  final bool secureText;
  final int maxLines;
  final Function onChanged;

  final Widget suffixIcon;
  final Function validator;
  final Function secure;

  final String initialValue;
  const CustomTextField({Key key, this.hintText, this.controller, this.onSubmitted, this.validator, this.initialValue, this.prefixIcon, this.secureText, this.maxLines, this.suffixIcon, this.secure, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        maxLines: maxLines,
        initialValue: initialValue,
       onChanged: onChanged,
        controller: controller,
    validator: validator,
        cursorColor: Colors.grey,
        textAlign: TextAlign.left,
        obscureText: secureText??false,
        textDirection: TextDirection.ltr,
        decoration: InputDecoration(
          suffixIcon:  suffixIcon,
          prefixIconColor: iconColor,
            prefixIcon: prefixIcon,
            suffixIconColor: iconColor,
            hintText: hintText,hintStyle: const TextStyle(color: iconColor,fontFamily: 'Janna LT Regular',),

        ),
      ),
    );
  }
}
