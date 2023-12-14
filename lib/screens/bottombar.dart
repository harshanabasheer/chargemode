import 'package:chargemode/screens/home_page.dart';
import 'package:chargemode/screens/profile_page.dart';
import 'package:chargemode/utils/constants/app_color.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final String firstName;

  BottomBar({
    required this.currentIndex,
    required this.onTap,
    required this.firstName,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: AppColor.black_l,
      unselectedItemColor: AppColor.black_l,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: AppColor.black_l),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard, color: AppColor.black_l),
          label: 'Activity',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group, color: AppColor.black_l),
          label: 'Community',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: AppColor.primaryColor,
          ),
          label: 'Profile',
        ),
      ],
      onTap: (int index) {
        if (index == 0) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePage()));
        } else if (index == 3) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProfilePage(
                    firstName: firstName,
                  )));
        }
      },
    );
  }
}
