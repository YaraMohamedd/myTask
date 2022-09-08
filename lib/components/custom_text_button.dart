import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonText;
  final Color color;
  final Function onPressed;
  const CustomTextButton({Key key, this.buttonText, this.color, this.onPressed}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
child:   Align(
    alignment: Alignment.bottomRight,
    child: TextButton(
        onPressed: onPressed, child: Text(buttonText,style: TextStyle(color: color),))),
    );
  }
}
