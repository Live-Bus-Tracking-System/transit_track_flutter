import 'package:flutter/material.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/widget/sidebar.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/widget/top_bar.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Column(
              children: [
                TopBar(),
                Expanded(
                  child: Text(
                    'Users',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
