import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zarity/constants/colors.dart';
import 'package:zarity/constants/fonts.dart';

class TaskProgressBar extends StatefulWidget {
  TaskProgressBar({Key? key}) : super(key: key);

  @override
  State<TaskProgressBar> createState() => _TaskProgressBarState();
}

class _TaskProgressBarState extends State<TaskProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10.r)),
          depth: 4,
          intensity: 0.5,
          color: CustomColors.appPrimaryColor,
          lightSource: LightSource.topLeft,
          border:
              const NeumorphicBorder(color: Color.fromARGB(255, 216, 232, 250)),
          shadowLightColor: Colors.white,
          shadowDarkColor: const Color.fromRGBO(111, 140, 176, 1)

          // oppositeShadowLightSource: true
          ),
      padding: const EdgeInsets.all(0),
      child: Container(
        height: 100.h,
        width: 328.w,
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: Row(
            children: [
              Container(
                height: 80.w,
                // width: 55.w,
                // color: Colors.green,
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Neumorphic(
                      style: const NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.circle()),
                      child: CircularPercentIndicator(
                        circularStrokeCap: CircularStrokeCap.round,
                        radius: 30.0,
                        lineWidth: 10.0,
                        percent: 0.1,

                        center: Neumorphic(
                            style: const NeumorphicStyle(
                                boxShape: NeumorphicBoxShape.circle()),
                            child: new Text("0%",style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),)),
                        progressColor: Colors.blue,
                        backgroundColor: CustomColors.appPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 19.w,
              ),
              Container(
                height: 50.h,
                width: 220.w,
                child: Center(
                  child: Text(
                    "This is a task list that Opens a dialogue box showing tasks, read more...",
                    overflow: TextOverflow.clip,
                    style: AppTextStyles.taskListText,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: CustomColors.subHeading1Color,
              )
            ],
          ),
        ),
      ),
    );
  }
}
