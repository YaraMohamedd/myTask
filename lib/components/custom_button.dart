import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final Function onPressed;
    final double height;
  const CustomButton({Key key, this.buttonName, this.onPressed, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Align(
     alignment: Alignment.bottomCenter,
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Container(
          height: height,
          child: Align(
            alignment: Alignment.bottomCenter,
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: onPressed,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
              child: Text(buttonName, style: const TextStyle(color:containerColor)),
              color: buttonColor,
            ),
          ),
        ),
     ),
   );
  }
}
