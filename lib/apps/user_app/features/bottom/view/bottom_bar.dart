import 'package:flutter/material.dart';
import 'package:transit_track_flutter/apps/user_app/features/save/presentation/view/save.dart';
import 'package:transit_track_flutter/core/constants/text.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/view/home.dart';
import 'package:transit_track_flutter/apps/user_app/features/root/presentation/view/rout.dart';
import 'package:transit_track_flutter/apps/user_app/features/profile/presentation/view/profile.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;
  List<Widget> pages = [HomePage(), Rout(), Profile()];
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
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ConstText.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.route),
            label: ConstText.rout,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: ConstText.save,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: ConstText.profile,
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
