

import 'package:flutter/material.dart';
import 'package:transit_track_flutter/apps/user_app/features/profile/presentation/view/profile_edit.dart';
import 'package:transit_track_flutter/apps/user_app/features/profile/presentation/widget/route_card.dart';
import 'package:transit_track_flutter/apps/user_app/features/profile/presentation/widget/setting_tile.dart';
import 'package:transit_track_flutter/core/constants/text.dart';
import 'package:transit_track_flutter/features/profile/presentation/view/profile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.arrow_back),
        title: Row(
          children: const [
            CircleAvatar(
              backgroundColor: Colors.orange,
              child: Icon(Icons.directions_bus, color: Colors.white),
            ),
            SizedBox(width: 10),
            Text(ConstText.profile),
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.settings))
        ],
      ),

      body: SingleChildScrollView(
        padding:  EdgeInsets.all(w*0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                    ),

                     SizedBox(height: 10),

                    const Text(
                      "Full Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Text(
                      "Mobile Number",
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 10),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: StadiumBorder(),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProfileEdit(),
                          ),
                        );
                      },
                      child: const Text("Edit Profile"),
                    ),
                  ],
                ),
              ),
            ),

             SizedBox(height: h*0.03),

            const Text(
              "Saved Routes",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

             SizedBox(height: h*0.03),

            Row(
              children: [
                Expanded(
                  child: routeCard(
                    "KL12",
                    "Krishna",
                    "Vyttila → Aluva",
                    "3 min ago",
                  ),
                ),
                 SizedBox(width: w*0.03),
                Expanded(
                  child: routeCard(
                    "KL40",
                    "Sreelam",
                    "Kollam → Alappuzha",
                    "9 min ago",
                  ),
                ),
              ],
            ),

             SizedBox(height: h*0.03),

            const Text(
              "Support & Legal",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

             SizedBox(height: h*0.3),

            settingTile(
              Icons.security,
              "Privacy & Security",
              "Manage your data",(){},
            ),
            settingTile(
              Icons.help_outline,
              "Help & Support",
              "FAQs and contact",(){},
            ),
            settingTile(Icons.info_outline, "About", "subtitle",(){}),
            settingTile(Icons.share, "Share", "Share this app",(){}),

             SizedBox(height: h*0.03),

            /// LOGOUT
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                "Sign Out",
                style: TextStyle(color: Colors.red),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
