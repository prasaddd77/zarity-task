import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarity/constants/fonts.dart';

class TaskBottomSheet extends StatefulWidget {
  final Stream<List<Map<String, dynamic>>> immediateTasksStream;
  final Stream<List<Map<String, dynamic>>> thisWeekTasksStream;
  final Stream<List<Map<String, dynamic>>> thisMonthTasksStream;

  const TaskBottomSheet({
    super.key,
    required this.immediateTasksStream,
    required this.thisWeekTasksStream,
    required this.thisMonthTasksStream,
  });

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTaskCategory(
                context, 'Immediate Tasks', widget.immediateTasksStream),
            _buildTaskCategory(
                context, 'This Week Tasks', widget.thisWeekTasksStream),
            _buildTaskCategory(
                context, 'This Month Tasks', widget.thisMonthTasksStream),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCategory(BuildContext context, String title,
      Stream<List<Map<String, dynamic>>> tasksStream) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: tasksStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No tasks available"));
        }

        final tasks = snapshot.data!;
        return ExpansionTile(
          initiallyExpanded: true,
          title: Text(title,style: AppTextStyles.subHeading1,),
          children: tasks.map((task) {
            return ListTile(
              
              title: Row(
                children: [
                  Text(
                    task['taskName'] ?? 'No task name',
                    style: AppTextStyles.taskListText,
                  ),
                ],
              ),
              subtitle: Text(
                "Created by: Prasad",
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(task['taskName'] ?? 'No task name'),
                      content: Text(task['details'] ?? 'No details'),

                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Close"),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          }).toList(),
        );
      },
    );
  }
}
