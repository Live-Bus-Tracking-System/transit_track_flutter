import 'package:flutter/material.dart';

import 'package:transit_track_flutter/core/constants/theme.dart';
import 'package:transit_track_flutter/apps/user_app/presentation/home/view/home.dart';
import 'package:transit_track_flutter/apps/user_app/presentation/root/view/rout.dart';
import 'package:transit_track_flutter/apps/user_app/presentation/profile/view/profile.dart';

import 'package:transit_track_flutter/apps/user_app/presentation/home/view/home.dart';
import 'package:transit_track_flutter/apps/user_app/presentation/profile/view/profile.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;
  List<Widget> pages = [Home(), Rout(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppTheme.colors,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: AppTheme.color,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.route), label: 'Rout'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
