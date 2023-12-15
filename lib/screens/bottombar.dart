import 'package:chargemode/controller/bottomBarController.dart';
import 'package:chargemode/screens/home_page.dart';
import 'package:chargemode/screens/profile_page.dart';
import 'package:chargemode/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  List<Widget> pages = [
    HomePage(),
    Center(
      child: Text("Activity"),
    ),
    Center(
      child: Text("Community"),
    ),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<BottomBarController>();
    return Scaffold(
      body: pages[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: AppColor.black_l,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: AppColor.black_l),
            activeIcon: Icon(Icons.home, color: AppColor.primaryColor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard, color: AppColor.black_l),
            activeIcon: Icon(Icons.leaderboard, color: AppColor.primaryColor),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group, color: AppColor.black_l),
            activeIcon: Icon(Icons.group, color: AppColor.primaryColor),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: AppColor.black_l,
            ),
            activeIcon: Icon(
              Icons.person,
              color: AppColor.primaryColor,
            ),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          provider.setIndex(index);
        },
      ),
    );
  }
}
