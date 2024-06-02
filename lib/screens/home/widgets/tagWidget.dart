import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarity/constants/fonts.dart';

class TagWidget extends StatelessWidget {
   TagWidget({Key? key, required this.tagName}) : super(key: key);
  String tagName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color.fromARGB(115, 151, 151, 151))
      ),
      child: Center(
        child: Text(tagName,style: AppTextStyles.articleTagText,),
      ),
    );
  }
}
