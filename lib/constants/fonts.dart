import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarity/constants/colors.dart';

class AppTextStyles {


      // Good Morinng 
  static TextStyle get heading1 => TextStyle( 
        fontFamily: 'Outfit',
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: CustomColors.heading1Color,
      );

  // Good Morinng 
  static TextStyle get subHeading1 => TextStyle( 
        fontFamily: 'Outfit',
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: CustomColors.subHeading1Color,
      );

       // Task Completion Text
  static TextStyle get taskListText => TextStyle( 
        fontFamily: 'Outfit',
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: CustomColors.subHeading1Color,
      );

           // banner Text
  static TextStyle get bannerText => TextStyle( 
        fontFamily: 'Outfit',
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(121, 124, 123, 0.5),
      );

               // HyperLink Text
  static TextStyle get hyperLinkText => TextStyle( 
        fontFamily: 'Outfit',
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(6, 102, 235, 1),
      );

      
           // Article Tag
  static TextStyle get articleTagText => TextStyle( 
        fontFamily: 'Outfit',
        fontSize: 8.sp,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(121, 124, 123, 0.5),
      );

             // Details Heading
  static TextStyle get detailsHeadingText => TextStyle( 
        fontFamily: 'Outfit',
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Color.fromRGBO(61, 82, 132, 1),
      );



  static TextStyle get heading2 => TextStyle(
        fontFamily: 'Outfit',
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );

  static TextStyle get heading3 => TextStyle(
        // Radiology
        fontFamily: 'Outfit',
        fontSize: 24.sp,
        fontWeight: FontWeight.w800,
        color: Colors.black,
      );

  static TextStyle get bodyText1 => TextStyle(
        // Tab Bar Titiles
        fontFamily: 'Outfit',
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );

// coaching card heading
  static TextStyle get bodyText3 => TextStyle(
        //
        fontFamily: 'Outfit',
        fontSize: 16.sp,
        fontWeight: FontWeight.w800,
        color: Colors.black,
      );

  static TextStyle get bodyText2 => TextStyle(
        fontFamily: 'Outfit',
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      );

  static TextStyle get caption => TextStyle(
        fontFamily: 'Outfit',
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      );

  // Add more text styles as needed
}
