import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * .04,
            vertical: size.height * .015,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// APP BAR
              Row(
                children: [
                  const Icon(Icons.arrow_back_ios_new),
                  SizedBox(width: size.width * .03),

                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.directions_bus,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(width: size.width * .04),

                  const Text(
                    "Profile",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                ],
              ),

              SizedBox(height: size.height * .04),

              /// PROFILE CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xffEDEDED),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: size.width * .12,
                      backgroundColor: Colors.white,
                    ),

                    SizedBox(height: size.height * .02),

                    const Text(
                      "Full Name",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      "Mobile Number",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 18,
                      ),
                    ),

                    SizedBox(height: size.height * .025),

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 10,
                        ),
                      ),
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * .04),

              /// SAVED ROUTES
              const Text(
                "Saved Routes",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: size.height * .02),

              Row(
                children: [
                  Expanded(
                    child: _routeCard(
                      busNo: "KL12",
                      name: "Krishna",
                      route: "Vyttila → Aluva",
                      time: "3 min ago",
                    ),
                  ),

                  SizedBox(width: size.width * .04),

                  Expanded(
                    child: _routeCard(
                      busNo: "KL40",
                      name: "Sreelam",
                      route: "Kollam → Alappuzha",
                      time: "9 min ago",
                    ),
                  ),
                ],
              ),

              SizedBox(height: size.height * .04),

              const Text(
                "Support & Legal",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: size.height * .02),

              _settingTile(
                Icons.verified_user_outlined,
                "Privacy & Security",
                "Manage your data and privacy",
              ),

              _settingTile(
                Icons.help_outline,
                "Help & Support",
                "FAQs and contact center",
              ),

              SizedBox(height: size.height * .02),

              /// SIGN OUT
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red),
                    Spacer(),
                    Text(
                      "SignOut",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),

              SizedBox(height: size.height * .04),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _routeCard({
    required String busNo,
    required String name,
    required String route,
    required String time,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              busNo,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 12),

          Text(
            name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(route),

          const SizedBox(height: 12),

          Text(time, style: const TextStyle(color: Colors.orange)),
        ],
      ),
    );
  }

  static Widget _settingTile(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(subtitle, style: TextStyle(color: Colors.grey.shade600)),
              ],
            ),
          ),

          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
