import 'package:flutter/material.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/view/login.dart';
import 'package:transit_track_flutter/apps/user_app/features/details/presentation/view/details.dart';
import 'package:transit_track_flutter/apps/user_app/features/profile/presentation/view/profile_edit.dart';
import 'package:transit_track_flutter/apps/user_app/features/profile/presentation/widget/route_card.dart';
import 'package:transit_track_flutter/apps/user_app/features/profile/presentation/widget/title_handing.dart';
import 'package:transit_track_flutter/apps/user_app/features/save/presentation/view/save.dart';
import 'package:transit_track_flutter/core/constants/text.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class Profile extends StatelessWidget {
  final String? name;
  final String? email;
  final int? trips;
  final int? savedRoutes;
  const Profile({
    super.key,
    this.name,
    this.email,
    this.trips,
    this.savedRoutes,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Container(
            height: h * 0.8,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppTheme.color,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.2),
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person_rounded,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: h * 0.05),
                Text(
                  name ?? "user name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                SizedBox(height: h * 0.01),
                Text(
                  email ?? "user email",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),

                SizedBox(height: h * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TitleHanding(trips?.toString() ?? "0", "Trips"),
                    SizedBox(width: w * 0.05),
                    TitleHanding(
                      savedRoutes?.toString() ?? "0",
                      "Saved Routes",
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 8),
                Text(
                  'Account',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    color: AppTheme.textHint,
                  ),
                ),
                const SizedBox(height: 12),
                buildMenuGroup([
                  MenuItem(
                    icon: Icons.person_outline_rounded,
                    label: 'Edit Profile',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ProfileEdit()),
                      );
                    },
                  ),
                  MenuItem(
                    icon: Icons.bookmark_outline_rounded,
                    label: ConstText.savedBuses,
                    onTap: () {},
                  ),
                  MenuItem(
                    icon: Icons.history_rounded,
                    label: 'Trip History',
                    onTap: () {},
                  ),
                ]),
                const SizedBox(height: 24),
                Text(
                  'Preferences',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    color: AppTheme.textHint,
                  ),
                ),
                const SizedBox(height: 12),
                buildMenuGroup([
                  MenuItem(
                    icon: Icons.notifications_outlined,
                    label: 'Notifications',
                    onTap: () {},
                    trailing: Switch(
                      value: true,
                      onChanged: (_) {},
                      activeColor: AppTheme.color,
                    ),
                  ),
                  MenuItem(
                    icon: Icons.language_rounded,
                    label: 'Language',
                    onTap: () {},
                    trailingText: 'English',
                  ),
                ]),
                const SizedBox(height: 24),
                Text(
                  'Support',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    color: AppTheme.textHint,
                  ),
                ),
                const SizedBox(height: 12),
                buildMenuGroup([
                  MenuItem(
                    icon: Icons.help_outline_rounded,
                    label: "help",
                    onTap: () {},
                  ),
                  MenuItem(
                    icon: Icons.privacy_tip_outlined,
                    label: 'Privacy Policy',
                    onTap: () {},
                  ),
                ]),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () => showLogoutDialog(context),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.error.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: AppTheme.error.withOpacity(0.2),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout_rounded,
                          color: AppTheme.error,
                          size: 22,
                        ),
                        const SizedBox(width: 14),
                        Text(
                          "logout",
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: AppTheme.error,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(ctx, MaterialPageRoute(builder: (_) => Login()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.error,
              minimumSize: Size.zero,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: const Text("logout"),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:transit_track_flutter/apps/user_app/features/profile/presentation/view/profile_edit.dart';
// import 'package:transit_track_flutter/apps/user_app/features/profile/presentation/widget/route_card.dart';
// import 'package:transit_track_flutter/apps/user_app/features/profile/presentation/widget/setting_tile.dart';
// import 'package:transit_track_flutter/core/constants/text.dart';

// class Profile extends StatelessWidget {
//   const Profile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double w=MediaQuery.of(context).size.width;
//     double h=MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         leading: Icon(Icons.arrow_back),
//         title: Row(
//           children: const [
//             CircleAvatar(
//               backgroundColor: Colors.orange,
//               child: Icon(Icons.directions_bus, color: Colors.white),
//             ),
//             SizedBox(width: 10),
//             Text(ConstText.profile),
//           ],
//         ),
//         actions: [
//           IconButton(
//             onPressed: (){},
//             icon: Icon(Icons.settings))
//         ],
//       ),

//       body: SingleChildScrollView(
//         padding:  EdgeInsets.all(w*0.03),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[800],
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   children: [
//                     const CircleAvatar(
//                       radius: 40,
//                       backgroundColor: Colors.white,
//                     ),

//                      SizedBox(height: 10),

//                     const Text(
//                       "Full Name",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),

//                     const Text(
//                       "Mobile Number",
//                       style: TextStyle(color: Colors.grey),
//                     ),

//                     const SizedBox(height: 10),

//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.orange,
//                         shape: StadiumBorder(),
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const ProfileEdit(),
//                           ),
//                         );
//                       },
//                       child: const Text("Edit Profile"),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//              SizedBox(height: h*0.03),

//             const Text(
//               "Saved Routes",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//              SizedBox(height: h*0.03),

//             Row(
//               children: [
//                 Expanded(
//                   child: routeCard(
//                     "KL12",
//                     "Krishna",
//                     "Vyttila → Aluva",
//                     "3 min ago",
//                   ),
//                 ),
//                  SizedBox(width: w*0.03),
//                 Expanded(
//                   child: routeCard(
//                     "KL40",
//                     "Sreelam",
//                     "Kollam → Alappuzha",
//                     "9 min ago",
//                   ),
//                 ),
//               ],
//             ),

//              SizedBox(height: h*0.03),

//             const Text(
//               "Support & Legal",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//              SizedBox(height: h*0.3),

//             settingTile(
//               Icons.security,
//               "Privacy & Security",
//               "Manage your data",(){},
//             ),
//             settingTile(
//               Icons.help_outline,
//               "Help & Support",
//               "FAQs and contact",(){},
//             ),
//             settingTile(Icons.info_outline, "About", "subtitle",(){}),
//             settingTile(Icons.share, "Share", "Share this app",(){}),

//              SizedBox(height: h*0.03),

//             /// LOGOUT
//             ListTile(
//               leading: const Icon(Icons.logout, color: Colors.red),
//               title: const Text(
//                 "Sign Out",
//                 style: TextStyle(color: Colors.red),
//               ),
//               trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//               onTap: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
