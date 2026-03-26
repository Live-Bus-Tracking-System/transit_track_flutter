import 'package:flutter/material.dart';
import 'package:transit_track_flutter/features/profile/presentation/view/profile_edit.dart';
import 'package:transit_track_flutter/features/profile/presentation/widget/route_card.dart';
import 'package:transit_track_flutter/features/profile/presentation/widget/setting_tile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
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
            Text("Profile"),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
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

                    const SizedBox(height: 10),

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

            const SizedBox(height: 20),

            const Text(
              "Saved Routes",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

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
                const SizedBox(width: 10),
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

            const SizedBox(height: 20),

            
            const Text(
              "Support & Legal",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            /// LIST ITEMS
            settingTile(
              Icons.security,
              "Privacy & Security",
              "Manage your data",
            ),
            settingTile(
              Icons.help_outline,
              "Help & Support",
              "FAQs and contact",
            ),

            const SizedBox(height: 10),

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
