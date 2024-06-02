import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:zarity/constants/colors.dart';
import 'package:zarity/constants/fonts.dart';
import 'package:zarity/screens/home/widgets/tagWidget.dart';

class DetailsCardWidget extends StatelessWidget {
  const DetailsCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550.h,
      width: 334.w,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
          Color.fromARGB(255, 208, 222, 237),
          CustomColors.appPrimaryColor,
          Color.fromARGB(255, 231, 231, 231),
          Colors.white

          ]),
          // color: Colors.amber,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 15.h),
        child: Column(
          children: [
            Container(
              height: 450.h,
              width: 308.w,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 0.408),
                        blurRadius: 5,
                        offset: Offset(-4, 4)),
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0),
                        Color.fromRGBO(255, 255, 255, 0.53),
                      ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 190.h,
                    width: 308.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/details.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        Container(
                          height: 20.h,
                          width: 75.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "Article Tag",
                              style: AppTextStyles.articleTagText,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "January 1st, 2024",
                          style: AppTextStyles.articleTagText,
                        ),
                        SizedBox(
                          width: 90.w,
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
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Container(
                                height: 20,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage("assets/images/save.png"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      "You can choose to add any title to this article which opens in full view on the next page.",
                      style: AppTextStyles.detailsHeadingText,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      "This is the description that can work for any article. It can  begin with one line or it can stretch up to 2 lines or maybe even three, you might need to pay attention to the width or the height of this section.",
                      style:
                          AppTextStyles.articleTagText.copyWith(fontSize: 9.sp),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        TagWidget(tagName: "Tag 1"),
                        TagWidget(tagName: "Tag 2"),
                        TagWidget(tagName: "Tag 3"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Neumorphic(
              style: const NeumorphicStyle(
                // boxShape: NeumorphicBoxShape.circle(),
                depth: 5,
                intensity: 0.6,
                color: CustomColors.appPrimaryColor,
                lightSource: LightSource.topLeft,
              ),
              padding: const EdgeInsets.all(0),
              child: SizedBox(
                width: 100,
                height: 30,
                child: Center(
                  child: Text(
                    "Open List",
                    style: AppTextStyles.taskListText,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
