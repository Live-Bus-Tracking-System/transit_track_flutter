import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      drawer: Drawer(),
      body: ListView(
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
            h(0.43),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: w(0.02),
                      backgroundColor: AppTheme.color,
                    ),
                    SizedBox(width: w(0.014)),
                    Text(
                      'Vehicle Data',
                      style: GoogleFonts.poppins(
                        fontSize: w(0.07),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                commonField(
                  'Bus Name',
                  'eg: kinetic alpha-0',
                  w,
                  h,
                  busNameController,
                ),
                commonField('Vehicle Code', 'KN-9909', w, h, busNameController),
                commonField(
                  'Number Plate',
                  'KL-98-09-87',
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
            h(0.43),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: w(0.02),
                      backgroundColor: AppTheme.color,
                    ),
                    SizedBox(width: w(0.014)),
                    Text(
                      'Documentation',
                      style: GoogleFonts.poppins(
                        fontSize: w(0.07),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(),
                    Text(
                      'PERMIT DOCUMENT',
                      style: GoogleFonts.poppins(
                        fontSize: w(0.032),
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 135, 135, 135),
                      ),
                    ),
                    SizedBox(height: h(0.008)),
                    Container(
                      // padding: EdgeInsets.all(w(0.005)),
                      width: double.infinity,
                      height: h(0.17),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(255, 213, 168, 138),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.file_upload,
                            color: const Color.fromARGB(255, 123, 123, 123),
                            size: w(0.09),
                          ),
                          Text(
                            'Upload Permit',
                            style: GoogleFonts.poppins(
                              fontSize: w(0.04),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'PDF, JPG, UP TO 10MB',
                            style: GoogleFonts.poppins(
                              fontSize: w(0.03),
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(255, 123, 123, 123),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: h(0.07),
                  decoration: BoxDecoration(
                    color: AppTheme.color,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(
                          255,
                          109,
                          109,
                          109,
                        ).withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'REGISTER VEHICLE',
                      style: GoogleFonts.poppins(
                        fontSize: w(0.05),
                        fontWeight: FontWeight.w800,
                        color: AppColors.white,
                      ),
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
}
