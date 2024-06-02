import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarity/constants/fonts.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328.w,
      height: 90.h,
      decoration: BoxDecoration(
          color: Color.fromRGBO(237, 243, 250, 1),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Center(
            child: Text(
          "This is a state box with a message, showing that the section is empty right now",
          style: AppTextStyles.bannerText,
        )),
      ),
    );
  }
}
