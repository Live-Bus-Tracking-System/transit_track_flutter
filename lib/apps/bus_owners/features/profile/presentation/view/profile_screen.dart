import 'package:flutter/material.dart';
import 'package:transit_track_flutter/core/constants/colors.dart';
import 'package:transit_track_flutter/core/constants/text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // double h= MediaQuery.of(context).size.height;
      // double w= MediaQuery.of(context).size.height;
      appBar: AppBar(
        title: Text(ConstText.profile),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: double.infinity,
              color: AppColors.bg,
            ),
          )
        ],
      ),
    );
  }
}