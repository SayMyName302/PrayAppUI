


import 'package:flutter/material.dart';
import 'package:my_flutterapp/consts/const.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:marquee/marquee.dart';

Widget cardView({width, height, image}) {
  return Expanded(
    child: SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/icons/thumbnail.jpg',
                  width: 80,
                  height: 80,
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 0,
            bottom: 10,
            child: Padding(
              padding: EdgeInsets.only(right: 200),
              child: prayRadio.text.white.bold.size(15).make(),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            bottom: 10,
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Container(
                width: 240,
                height: 18,
                child: Marquee(
                  text: "lorem impsum grapes the wolf jumped over the brown dog",
                  scrollAxis: Axis.horizontal,
                  startAfter: const Duration(seconds: 2),
                  style: const TextStyle(color: Colors.white),
                  decelerationCurve: Curves.easeOut,
                  accelerationCurve: Curves.linear,
                ),
              ),
            ),
          ),
          Positioned(
            top: 69,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(right: 238),
              child: SpinKitRipple(
                color: Colors.red,
                size: 30,
              ),
            ),
          ),
            Positioned(
            top: 75,
            right: 0,
            bottom: 10,
            child: Padding(
              padding: EdgeInsets.only(right: 200),
              child: live.text.white.bold.size(15).make(),
            ),
          ),
              Positioned(
            top: 75,
            right: 0,
            bottom: 10,
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: share.text.white.bold.size(15).make(),
            ),
          ),
        ],
      ).box.rounded.hexColor("#474747").size(width, height).make(),
    ),
  );
}
