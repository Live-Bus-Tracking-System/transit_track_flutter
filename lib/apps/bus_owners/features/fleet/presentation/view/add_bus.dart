import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/widget/containers.dart';
import 'package:transit_track_flutter/apps/bus_owners/menu.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/containers.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/text_Field.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class Fleet extends StatefulWidget {
  const Fleet({super.key});

  @override
  State<Fleet> createState() => _FleetState();
}

class _FleetState extends State<Fleet> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController busNameController = TextEditingController();
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          'Fleet',
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
            SizedBox(height: h(0.01)),
            Text(
              'Registreation',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: w(0.05),
                color: AppTheme.color,
              ),
            ),
            Text(
              'ADD NEW VEHICLE',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: w(0.08),
              ),
            ),
            SizedBox(
              child: Text(
                'Initialize technical elementary and fleet documentation',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: w(0.04),
                  color: const Color.fromARGB(255, 110, 110, 110),
                ),
              ),
            ),
            SizedBox(height: h(0.04)),
            mainContain(
              w,
              double.infinity,
              h(0.46),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info, size: w(0.05), color: AppTheme.color),
                      SizedBox(width: w(0.014)),
                      Text(
                        'Vehicle Data',
                        style: GoogleFonts.poppins(
                          fontSize: w(0.05),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  commonField(
                    'NAME',
                    'eg: kinetic alpha-0',
                    w,
                    h,
                    busNameController,
                  ),
                  commonField(
                    'LISCENCE PLATE',
                    'KL-98-09-87',
                    w,
                    h,
                    busNameController,
                  ),
                  commonField(
                    'TRACKER ID',
                    'KFT-DGT-111',
                    w,
                    h,
                    busNameController,
                  ),
                  commonField(
                    'SEATING CAPACITY',
                    '56',
                    w,
                    h,
                    busNameController,
                  ),
                ],
              ),
            ),
            SizedBox(height: h(0.04)),
            mainContain(
              w,
              double.infinity,
              h(0.37),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.route, size: w(0.05), color: AppTheme.color),
                      SizedBox(width: w(0.014)),
                      Text(
                        'intended Route',
                        style: GoogleFonts.poppins(
                          fontSize: w(0.05),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  commonField(
                    'ROUTE NAME',
                    'DOWN-TOWN EXPRESS',
                    w,
                    h,
                    busNameController,
                  ),
                  commonField(
                    'START STOP NAME',
                    'CENTRAL',
                    w,
                    h,
                    busNameController,
                  ),
                  commonField(
                    'END STOP NAME',
                    'KOTTA',
                    w,
                    h,
                    busNameController,
                  ),
                ],
              ),
            ),
            SizedBox(height: h(0.04)),
            mainContain(
              w,
              double.infinity,
              h(0.25),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.note_add, size: w(0.05), color: AppTheme.color),
                      SizedBox(width: w(0.014)),
                      Text(
                        'Additional Notes',
                        style: GoogleFonts.poppins(
                          fontSize: w(0.05),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  commonField(
                    '',
                    'eg: kinetic alpha-0',
                    w,
                    h,
                    busNameController,
                    hi: h(0.13),
                    lines: 10
                  ),
                ],
              ),
            ),
            SizedBox(height: h(0.04)),
            certificateCont(w, h),
          ],
        ),
      ),
    );
  }
}
