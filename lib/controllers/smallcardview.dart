import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutterapp/consts/const.dart';
import 'package:velocity_x/velocity_x.dart';

Widget smallScroll({
  image,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    child: Image.asset(image, width: 140, height: 80, fit: BoxFit.fill),
  )
      .box
      .margin(EdgeInsets.only(left: 15))
      
      .make();
}
