import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:zarity/constants/colors.dart';
import 'package:zarity/constants/fonts.dart';
import 'package:badges/badges.dart' as badges;

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key, required this.onAvatarTap}) : super(key: key);
  final VoidCallback onAvatarTap;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 320.w,
            height: 100.h,
            child: Padding(
              padding: EdgeInsets.only(left: 3.w, top: 10.h, bottom: 0.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      widget.onAvatarTap();
                    },
                    child: CircleAvatar(
                      radius: 25.r,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image(
                          image: const AssetImage("assets/images/avatar.png"),
                          height: 40.5.h,
                          width: 40.5.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 13.w),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good afternoon,",
                        style: AppTextStyles.subHeading1,
                      ),
                      Text(
                        "John Doe",
                        style: AppTextStyles.heading1,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 70.w,
                  ),
                  Neumorphic(
                    style: const NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.circle(),
                      depth: 5,
                      intensity: 0.6,
                      color: CustomColors.appPrimaryColor,
                      lightSource: LightSource.topLeft,
                    ),
                    padding: const EdgeInsets.all(0),
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Center(
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/Send.png"))),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  badges.Badge(
                    badgeContent: Text("1",style: TextStyle(color: Colors.white,fontSize: 13),),
                    badgeStyle: badges.BadgeStyle(badgeColor: Colors.blue,),
                    position: badges.BadgePosition.bottomEnd(),

                    child: Neumorphic(
                      style: const NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.circle(),
                        depth: 5,
                        intensity: 0.6,
                        color: CustomColors.appPrimaryColor,
                        lightSource: LightSource.topLeft,
                      ),
                      padding: const EdgeInsets.all(0),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: Container(
                            height: 20,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("assets/images/bell.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
