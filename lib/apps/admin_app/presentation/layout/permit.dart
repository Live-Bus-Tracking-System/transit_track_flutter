import 'package:flutter/material.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/widget/sidebar.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/widget/top_bar.dart';

class Permit extends StatelessWidget {
  const Permit({super.key});

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
                    'Permit',
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
