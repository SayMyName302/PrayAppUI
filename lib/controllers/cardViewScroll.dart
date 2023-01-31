import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutterapp/consts/const.dart';
import 'package:velocity_x/velocity_x.dart';

Widget HorizontalScroll({
  image,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    child: Image.asset(image, width: 360, height: 200, fit: BoxFit.fill),
  )
      .box
      .margin(EdgeInsets.symmetric(horizontal: 15))
      .padding(const EdgeInsets.all(2))
      .make();
}
