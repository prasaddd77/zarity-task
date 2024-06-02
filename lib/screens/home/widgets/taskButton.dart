import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:zarity/constants/colors.dart';
import 'package:zarity/constants/fonts.dart';

class TaskButtonWidget extends StatelessWidget {
   TaskButtonWidget({Key? key, required this.taskName}) : super(key: key);
  String taskName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.appPrimaryColor,
      // color: Colors.green,
      height: 110.h,
      width: 80.w,
      child: Neumorphic(
        style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20.r)),
            depth: 4,
            intensity: 0.5,
            color: CustomColors.appPrimaryColor,
            lightSource: LightSource.topLeft,
            border: const NeumorphicBorder(
                color: Color.fromARGB(255, 216, 232, 250)),
            shadowLightColor: Colors.white,
            shadowDarkColor: const Color.fromRGBO(111, 140, 176, 1)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10.w, top: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/avatar2.png"))),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.green,
                    // height: 60,
                    width: 60,
                    child: Center(
                        child: Text(
                      taskName,
                      style: AppTextStyles.taskListText,
                    )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
