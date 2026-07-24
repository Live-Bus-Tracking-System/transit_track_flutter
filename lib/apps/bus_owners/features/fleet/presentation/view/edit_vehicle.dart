import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/model/vehicle_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/bloc/vehicle_bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/widget/containers.dart';
import 'package:transit_track_flutter/apps/bus_owners/menu.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/containers.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/text_Field.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';
import 'package:transit_track_flutter/core/validators/vehicle_validator.dart';

class EditVehicle extends StatefulWidget {
  final VehicleModel model;
  const EditVehicle({super.key, required this.model});

  @override
  State<EditVehicle> createState() => _EditVehicleState();
}

class _EditVehicleState extends State<EditVehicle> {
  final TextEditingController nameC = TextEditingController();
  final TextEditingController licenseC = TextEditingController();
  final TextEditingController trackerIdC = TextEditingController();
  final TextEditingController capacityC = TextEditingController();
  final TextEditingController routeNameC = TextEditingController();
  final TextEditingController startStopC = TextEditingController();
  final TextEditingController endStopC = TextEditingController();
  final TextEditingController additionalNotesC = TextEditingController();
  final TextEditingController busNameController = TextEditingController();
  final TextEditingController registerIssuedAtC = TextEditingController();
  final TextEditingController permitIssuedAtC = TextEditingController();
  final TextEditingController registerExpiresAtC = TextEditingController();
  final TextEditingController permitExpiresAtC = TextEditingController();
  final TextEditingController registerNo = TextEditingController();
  final TextEditingController permitNo = TextEditingController();
  final TextEditingController registerIssuedBy = TextEditingController();
  final TextEditingController permitIssuedBy = TextEditingController();
  final TextEditingController controller = TextEditingController();
  String registrationUrl = '';
  String permitUrl = '';
  @override
  Widget build(BuildContext context) {
    VehicleModel data = widget.model;
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.ThemeDasrkWhite(context),
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
          children: [
            SizedBox(height: h(0.01)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w(0.04)),
              child: Text(
                'Registreation',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: w(0.05),
                  color: AppTheme.color,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w(0.04)),
              child: Text(
                'EDIT VEHICLE',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: w(0.07),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w(0.04)),
              child: SizedBox(
                child: Text(
                  'Initialize technical elementary and fleet documentation',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: w(0.04),
                    color: const Color.fromARGB(255, 110, 110, 110),
                  ),
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
              h(0.26),
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
              () {
                context.read<VehicleBloc>().add(
                  EditVehicleEvent(
                    widget.model.id!,
                    name: nameC.text,
                    trackerId: trackerIdC.text,
                    licensePlt: licenseC.text,
                    capacity: int.tryParse(capacityC.text)!,
                    registrationCertificateUrl: registrationUrl,
                    registrationCertificateNo: permitUrl,
                    registrationCertExpiresAt: registerExpiresAtC.text,
                    registrationCertIssuedAt: registerIssuedAtC.text,
                    registrationCertIssuedBy: registerIssuedBy.text,
                    permitCertificateUrl: permitUrl,
                    permitCertificateNo: permitNo.text,
                    permitCertExpiresAt: permitExpiresAtC.text,
                    permitCertIssuedAt: permitIssuedBy.text,
                    permitCertIssuedBy: permitIssuedBy.text,
                    routeName: routeNameC.text,
                    startStopName: startStopC.text,
                    endStopName: endStopC.text,
                    additionalNotes: additionalNotesC.text,
                  ),
                );
              },
              context,
              nameC: nameC,
              licenseC: licenseC,
              trackerIdC: trackerIdC,
              capacityC: capacityC,
              routeNameC: routeNameC,
              startStopC: startStopC,
              endStopC: endStopC,
              additionalNotesC: additionalNotesC,
              registerIssuedAtC: registerIssuedAtC,
              permitIssuedAtC: permitIssuedAtC,
              registerExpiresAtC: registerExpiresAtC,
              permitExpiresAtC: permitExpiresAtC,
              registerNo: registerNo,
              permitNo: permitNo,
              registerIssuedBy: registerIssuedBy,
              permitIssuedBy: permitIssuedBy,
              controller: controller,
              registrationUrl: registrationUrl,
              permitUrl: permitUrl,
            ),
          ],
        ),
      ),
    );
  }
}
