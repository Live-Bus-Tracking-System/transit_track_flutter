import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/bloc/vehicle_bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/widget/date_field.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/containers.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/text_Field.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';
import 'package:transit_track_flutter/core/validators/vehicle_validator.dart';

Widget registerButton(
  double Function(double) w,
  double Function(double) h,
  BuildContext context, {
  required TextEditingController nameC,
  required TextEditingController licenseC,
  required TextEditingController trackerIdC,
  required TextEditingController capacityC,
  required TextEditingController routeNameC,
  required TextEditingController startStopC,
  required TextEditingController endStopC,
  required TextEditingController additionalNotesC,
  required TextEditingController registerIssuedBy,
  required TextEditingController registerIssuedAt,
  required TextEditingController registrationCertExpiresAt,
  required TextEditingController registerNo,
  required String registerUrl,
  required TextEditingController permitIssuedBy,
  required TextEditingController permitIssuedAt,
  required TextEditingController permitNo,
  required String permitUrl,
  required TextEditingController permitExpiresAt,
}) {
  return Column(
    children: [
      mainContain(
        w,
        double.infinity,
        h(0.57),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.document_scanner,
                  size: w(0.05),
                  color: AppTheme.color,
                ),
                SizedBox(width: w(0.014)),
                Text(
                  'PERMIT CERTIFICATE',
                  style: GoogleFonts.inter(
                    fontSize: w(0.05),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                context.read<VehicleBloc>().add(UploadPermitFileEvent());
              },
              child: Container(
                // padding: EdgeInsets.all(w(0.005)),
                width: double.infinity,
                height: h(0.16),
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
                      'UPLOAD PRMIT DOC',
                      style: GoogleFonts.inter(
                        fontSize: w(0.03),
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 123, 123, 123),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            commonField(
              'CERTIFICATE NUMBER',
              '',
              w,
              h,
              (value) => VehicleValidator.name(value!),
              permitNo,
            ),
            commonField(
              'ISSUED BY',
              '',
              w,
              h,
              (value) => VehicleValidator.name(value!),
              permitIssuedBy,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                dateField(
                  'ISSUED AT',
                  'mm/dd/yyyy',
                  w,
                  h,
                  (value) => VehicleValidator.required(value!, 'date'),
                  context,
                  permitIssuedAt,
                  b: w(0.35),
                ),
                dateField(
                  'EXPIRES AT',
                  'mm/dd/yyyy',
                  w,
                  h,
                  (value) => VehicleValidator.required(value!, 'date'),
                  context,
                  permitExpiresAt,
                  b: w(0.35),
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(height: h(0.04)),
      GestureDetector(
        onTap: () {
          context.read<VehicleBloc>().add(
            CreateVehicleEvent(
              name: nameC.text,
              trackerId: trackerIdC.text,
              licensePlt: licenseC.text,
              capacity: int.tryParse(capacityC.text)!,
              registrationCertificateUrl: registerUrl,
              registrationCertificateNo: permitUrl,
              registrationCertExpiresAt: registrationCertExpiresAt.text,
              registrationCertIssuedAt: registerIssuedAt.text,
              registrationCertIssuedBy: registerIssuedBy.text,
              permitCertificateUrl: permitUrl,
              permitCertificateNo: permitNo.text,
              permitCertExpiresAt: permitExpiresAt.text,
              permitCertIssuedAt: permitIssuedBy.text,
              permitCertIssuedBy: permitIssuedBy.text,
              routeName: routeNameC.text,
              startStopName: startStopC.text,
              endStopName: endStopC.text,
              additionalNotes: additionalNotesC.text,
            ),
          );
        },
        child: Container(
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
      ),
    ],
  );
}
