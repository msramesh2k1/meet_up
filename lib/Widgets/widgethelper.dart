import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetHelper {
 static Widget text(String msg, int size, Color color) {
    return Text(
      msg,
      style: GoogleFonts.josefinSans(
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
            fontSize: size.toDouble(), color: color, letterSpacing: 0),
      ),
    );
  }
   static Widget subtext(String msg, int size, Color color) {
    return Text(
      
      msg,
      textAlign: TextAlign.center,
      style: GoogleFonts.josefinSans(
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
            fontSize: size.toDouble(), color: color, letterSpacing: 0),
      ),
    );
  }
   static Widget cont(Widget child,int width,
     int radius, int height, Color color) {
    return 
    Container(
      child: child,
      width: width.toDouble(),
      height: height.toDouble(),decoration:
     BoxDecoration(
       color: color,borderRadius: BorderRadius.circular(radius.toDouble())),);
  }
}


  //             SizedBox(
  // width: 200.0,
  // height: 100.0,
  // child: Shimmer.fromColors(
  //   baseColor: kPrimaryColor,
  //   highlightColor:kbgPrimaryColor,
  //   child:WidgetHelper.text("Meet-Up", 40, Colors.white70)),
  // ),