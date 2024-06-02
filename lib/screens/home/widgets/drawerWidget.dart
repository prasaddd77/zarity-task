import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarity/constants/colors.dart';
import 'package:zarity/constants/fonts.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onProfileTap;
  final VoidCallback onAddressTap;
  final VoidCallback onLogoutTap;

  CustomDrawer({
    required this.onProfileTap,
    required this.onAddressTap,
    required this.onLogoutTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 250.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           DrawerHeader(
            decoration: const BoxDecoration(
              color: CustomColors.appPrimaryColor,
            ),
            child: Center(
              child: Text(
                'Zarity',
                style:AppTextStyles.heading1

              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: onProfileTap,
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Address'),
            onTap: onAddressTap,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: onLogoutTap,
          ),
        ],
      ),
    );
  }
}
