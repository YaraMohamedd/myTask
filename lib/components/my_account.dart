import 'package:flutter/material.dart';
import 'package:task/components/my_title_text.dart';
import 'package:task/constants.dart';

class MyAccount extends StatelessWidget {
  final String text;
  final String value;
  const MyAccount({Key key, this.text, this.value}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTitleText(
            trText:text ,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.06,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(
                color: buttonColor,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              child: MyTitleText(
                text: value,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
