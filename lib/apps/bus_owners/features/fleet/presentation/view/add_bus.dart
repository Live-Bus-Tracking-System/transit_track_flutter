import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/widget/containers.dart';
import 'package:transit_track_flutter/apps/bus_owners/menu.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/containers.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/text_Field.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';
import 'package:transit_track_flutter/core/validators/vehicle_validator.dart';

class Fleet extends StatefulWidget {
  const Fleet({super.key});

  @override
  State<Fleet> createState() => _FleetState();
}

class _FleetState extends State<Fleet> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameC = TextEditingController();
    final TextEditingController licenseC = TextEditingController();
    final TextEditingController trackerIdC = TextEditingController();
    final TextEditingController capacityC = TextEditingController();
    final TextEditingController routeNameC = TextEditingController();
    final TextEditingController startStopC = TextEditingController();
    final TextEditingController endStopC = TextEditingController();
    final TextEditingController additionalNotesC = TextEditingController();
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
                fontSize: w(0.07),
              ),
            ),
            SizedBox(
              child: Text(
                'Initialize technical elementary and fleet documentation',
                style: GoogleFonts.inter(
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
                        style: GoogleFonts.inter(
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
                    (value) => VehicleValidator.name(value!),
                    nameC,
                  ),
                  commonField(
                    'LISCENCE PLATE',
                    'KL-98-09-87',
                    w,
                    h,
                    (value) => VehicleValidator.licensePlt(value!),
                    licenseC,
                  ),
                  commonField(
                    'TRACKER ID',
                    'KFT-DGT-111',
                    w,
                    h,
                    (value) => VehicleValidator.trackerId(value!),
                    trackerIdC,
                  ),
                  commonField(
                    'SEATING CAPACITY',
                    '56',
                    w,
                    h,
                    (value) => VehicleValidator.capacity(value!),
                    capacityC,
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
                        'Intended Route',
                        style: GoogleFonts.inter(
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
                    (value) => VehicleValidator.required(value!, 'Route'),
                    routeNameC,
                  ),
                  commonField(
                    'START STOP NAME',
                    'CENTRAL',
                    w,
                    h,
                    (value) => VehicleValidator.required(value!, 'Start stop'),
                    startStopC,
                  ),
                  commonField(
                    'END STOP NAME',
                    'KOTTA',
                    w,
                    h,
                    (value) => VehicleValidator.required(value!, 'End stop'),
                    endStopC,
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
                      Icon(
                        Icons.note_add,
                        size: w(0.05),
                        color: AppTheme.color,
                      ),
                      SizedBox(width: w(0.014)),
                      Text(
                        'Additional Notes',
                        style: GoogleFonts.inter(
                          fontSize: w(0.05),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  commonField(
                    '',
                    'eg: this has new experience...',
                    w,
                    h,
                    (value) => VehicleValidator.notes(value!),
                    additionalNotesC,
                    hi: h(0.13),
                    lines: 10,
                  ),
                ],
              ),
            ),
            SizedBox(height: h(0.04)),
            certificateCont(
              w,
              h,
              context,
              nameC: nameC,
              licenseC: licenseC,
              trackerIdC: trackerIdC,
              capacityC: capacityC,
              routeNameC: routeNameC,
              startStopC: startStopC,
              endStopC: endStopC,
              additionalNotesC: additionalNotesC,
            ),
          ],
        ),
      ),
    );
  }
}
