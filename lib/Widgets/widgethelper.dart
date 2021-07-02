import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetup/Helper/Colors.dart';
final Shader linearGradient = LinearGradient(
  colors: <Color>[Colors.white,Colors.white10.withOpacity(0.5)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
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
   static Widget logo(String msg, int space,
   int size, Color color) {
    return Text(
      
      msg,
      textAlign: TextAlign.left,
      style: GoogleFonts.poppins(
        
        letterSpacing: space.toDouble(),
        textStyle: TextStyle(
          
          foreground: Paint()..shader = linearGradient,
          fontWeight: FontWeight.bold,
            fontSize: size.toDouble(), 
          letterSpacing: 0),
      ),
    );
  }

   static Widget poppin(String msg, int space,
   int size, Color color) {
    return Text(
      
      msg,
      textAlign: TextAlign.left,
      style: GoogleFonts.poppins(
        
        letterSpacing: space.toDouble(),
        textStyle: TextStyle(
          
         
          fontWeight: FontWeight.bold,
            fontSize: size.toDouble(),color: color, 
          letterSpacing: 0),
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