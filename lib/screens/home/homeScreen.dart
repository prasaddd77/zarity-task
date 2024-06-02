import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:provider/provider.dart';
import 'package:zarity/constants/colors.dart';
import 'package:zarity/constants/fonts.dart';
import 'package:neumorphic_button/neumorphic_button.dart';
import 'package:zarity/provider/firebaseProvider.dart';
import 'package:zarity/screens/home/widgets/appBar.dart';
import 'package:zarity/screens/home/widgets/banner.dart';
import 'package:zarity/screens/home/widgets/detailsCard.dart';
import 'package:zarity/screens/home/widgets/drawerWidget.dart';
import 'package:zarity/screens/home/widgets/taskButton.dart';
import 'package:zarity/screens/home/widgets/taskBottomSheet.dart';
import 'package:zarity/screens/home/widgets/taskProgressBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

    bool _isDrawerOpen = false;

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                   AppBarWidget(onAvatarTap: _toggleDrawer),
                  SizedBox(height: 15.h),
                  InkWell(
                      onTap:_showTaskBottomSheet,
                      child: TaskProgressBar()),
                  SizedBox(height: 20.h),
                  Text(
                    "Immediate Tasks",
                    style: AppTextStyles.heading1,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                   Consumer<FirestoreProvider>(
                    builder: (context, firestoreProvider, child) {
                      return StreamBuilder<List<Map<String, dynamic>>>(
                        stream: firestoreProvider.getTasks('immediate'),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return Center(child: Text("Error: ${snapshot.error}"));
                          }
                          if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return Center(child: Text("No immediate tasks available"));
                          }
          
                          final tasks = snapshot.data!;
                          return Row(
                            children: tasks.map((task) {
                              return Padding(
                                padding: EdgeInsets.only(right: 20.w),
                                child: InkWell(
                                  onTap: (){ _showTaskDetailsDialog(context, task);},
                                  child: TaskButtonWidget(taskName:task['taskName'] ,))
                                  // task: task,
                                  // onTap: () {
                                  //   _showTaskDetailsDialog(context, task);
                                  // },
                                
                              );
                            }).toList(),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    "Ordinary Title 2",
                    style: AppTextStyles.heading1,
                  ),
                  SizedBox(height: 20.h),
                  const BannerWidget(),
                  SizedBox(height: 20.h),
                  Text(
                    "Ordinary Title 3",
                    style: AppTextStyles.heading1,
                  ),
                  SizedBox(height: 20.h),
                  const DetailsCardWidget(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "this is a random photo note with nothing specific, but could contain details that end this page",
                    style: AppTextStyles.bannerText,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Privacy",
                        style: AppTextStyles.hyperLinkText.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppTextStyles.hyperLinkText.color,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "Terms",
                        style: AppTextStyles.hyperLinkText.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppTextStyles.hyperLinkText.color,
                        ),
                      )
                    ],
                  ),
                ],
              ),  
            ),
          ),
           if (_isDrawerOpen)
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              child: GestureDetector(
                onTap: _toggleDrawer,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black54,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CustomDrawer(
                      onProfileTap: () {
                        _toggleDrawer();
                      },
                      onAddressTap: () {
                        _toggleDrawer();
                      },
                      onLogoutTap: () {
                        _toggleDrawer();
                      },
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showTaskBottomSheet() {
        final firestoreProvider = Provider.of<FirestoreProvider>(context, listen: false);

    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return TaskBottomSheet(
          immediateTasksStream:firestoreProvider.getTasks('immediate'),
          thisWeekTasksStream:firestoreProvider.getTasks('thisWeek'),
          thisMonthTasksStream:firestoreProvider.getTasks('thisMonth'),
        );
      },
    );
  }
  
   void _showTaskDetailsDialog(BuildContext context, Map<String, dynamic> task) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(task['taskName'] ?? 'No task name'),
          content: Text(task['details'] ?? 'No details available'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}

