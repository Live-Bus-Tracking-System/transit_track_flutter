import 'package:flutter/material.dart';
import 'package:transit_track_flutter/core/constants/colors.dart';
import 'package:transit_track_flutter/core/constants/text.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ConstText.dashboard,
          style: TextStyle(color: AppTheme.color, fontWeight: FontWeight(20)),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: h * 0.03,
                width: w * 0.5,
                child: Column(
                  children: [
                    Text(
                      ConstText.operational,
                      style: TextStyle(color: AppColors.bg),
                    ),
                    Text("data"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
