import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const Color scaffoldBackgroundColor = Color.fromARGB(255, 1, 42, 75);

final TextStyle defaultTextStyle = GoogleFonts.inter(
  fontWeight: FontWeight.w900,
  fontStyle: FontStyle.italic,
  color: Colors.white,
);
final TextStyle titleTextStyle = GoogleFonts.inter(
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.italic,
  fontSize: 30.sp,
  color: Colors.white,
);
final TextStyle textFieldTextStyle = GoogleFonts.inter(
  fontWeight: FontWeight.w400,
  fontSize: 15.sp,
  color: Colors.black,
);

BorderRadius borderRadius(double radius) {
  return BorderRadius.all(
    Radius.circular(radius),
  );
}
