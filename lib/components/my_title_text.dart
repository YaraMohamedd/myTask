import 'package:flutter/material.dart';

class MyTitleText extends StatelessWidget {
  final String text;
  final String trText;
  final Color color;
  final double fontSize;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final TextOverflow isOverflow;
  final int lines;

  const MyTitleText(
      {Key key,
        this.text,
        this.trText,
        this.color,
        this.fontSize,
        this.textAlign,
        this.fontWeight,
        this.isOverflow,
        this.lines})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
    text ?? trText,
    textAlign: textAlign ?? TextAlign.start,
    textScaleFactor: 1.0,
    softWrap: false,
    overflow: isOverflow ?? TextOverflow.ellipsis,
    maxLines: lines ?? 1,
    style: TextStyle(
      color: color ,
      fontSize: fontSize ?? 12.0,
      fontFamily: "montserrat",
      fontWeight: fontWeight ?? FontWeight.w400,
    ),
  );
}