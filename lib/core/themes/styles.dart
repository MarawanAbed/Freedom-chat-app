import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font24Black700Weight = TextStyle(
      fontSize: 24.sp, fontWeight: FontWeight.w700, color: Colors.black);

  //another way to write the same code above
  //if he give you in design regular light bold and so on you can use this
  static TextStyle font32BlueRegularWeight = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w400,
    color: Colors.blue,//here replace the color with the color you want after add it in app colors
  );
}
