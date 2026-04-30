import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/view/delete_account.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/widget/card.dart';
import 'package:transit_track_flutter/apps/bus_owners/menu.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/containers.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // context.read<ProfileBloc>().add(FetchDetailsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            fontSize: w(0.05),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Menu(h: h, w: w),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(w(0.052)),
          children: [
            SizedBox(height: h(0.04)),
            mainContain(w, w(0.25), h(0.1), SizedBox(), AppColors.black),
            SizedBox(height: h(0.02)),
            Align(
              alignment: AlignmentGeometry.center,
              child: Text(
                'FLeet Director',
                style: GoogleFonts.poppins(
                  fontSize: w(0.05),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Align(
              alignment: AlignmentGeometry.center,
              child: Text(
                'ORGANAIZATION ADMIN',
                style: GoogleFonts.poppins(
                  fontSize: w(0.03),
                  fontWeight: FontWeight.w500,
                  color: AppTheme.color,
                ),
              ),
            ),
            SizedBox(height: h(0.02)),
            infoCard(w, h),
            SizedBox(height: h(0.02)),
            mainContain(
              w,
              double.infinity,
              h(0.17),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SYSTEM STATUS',
                    style: GoogleFonts.poppins(
                      fontSize: w(0.035),
                      color: const Color.fromARGB(255, 193, 193, 193),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Active Sessions',
                        style: GoogleFonts.poppins(
                          fontSize: w(0.035),
                          color: const Color.fromARGB(255, 193, 193, 193),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        '19',
                        style: GoogleFonts.poppins(
                          fontSize: w(0.05),
                          color: const Color.fromARGB(255, 193, 193, 193),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Positioned(
                        // left: 0,
                        child: mainContain(
                          w,
                          double.infinity,
                          h(0.007),
                          SizedBox(),
                          const Color.fromARGB(255, 171, 171, 171),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: mainContain(
                          w,
                          w(0.6),
                          h(0.007),
                          SizedBox(),
                          AppTheme.color,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Color.fromARGB(255, 0, 10, 36),
            ),
            SizedBox(height: h(0.02)),
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: SizedBox(
                width: w(0.4),
                child: Text(
                  'Profile Details',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: w(0.08),
                  ),
                ),
              ),
            ),
            SizedBox(height: h(0.02)),
            mainContain(
              w,
              double.infinity,
              h(0.14),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FULL NAME',
                    style: GoogleFonts.poppins(
                      fontSize: w(0.035),
                      color: const Color.fromARGB(255, 146, 146, 146),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Alexander Afthab',
                    style: GoogleFonts.poppins(
                      fontSize: w(0.04),
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: h(0.02)),
            mainContain(
              w,
              double.infinity,
              h(0.14),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'EMAIL ADDRESS',
                    style: GoogleFonts.poppins(
                      fontSize: w(0.035),
                      color: const Color.fromARGB(255, 146, 146, 146),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'alexander@gmail.com',
                    style: GoogleFonts.poppins(
                      fontSize: w(0.04),
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: h(0.02)),
            mainContain(
              w,
              double.infinity,
              h(0.14),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PHONE',
                    style: GoogleFonts.poppins(
                      fontSize: w(0.035),
                      color: const Color.fromARGB(255, 146, 146, 146),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '+918891912383',
                    style: GoogleFonts.poppins(
                      fontSize: w(0.04),
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: h(0.02)),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeleteAccount()),
                );
              },
              leading: Icon(Icons.delete, color: AppColors.red),
              title: Text(
                'Delete Account',
                style: GoogleFonts.inter(
                  fontSize: w(0.04),
                  fontWeight: FontWeight.w600,
                  color: AppColors.red,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: AppColors.red,
                size: w(0.06),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
