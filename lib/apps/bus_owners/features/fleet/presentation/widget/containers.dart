import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/snack_bar.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/bloc/vehicle_bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/widget/date_field.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/widget/register_button.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/containers.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/text_Field.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';
import 'package:transit_track_flutter/core/validators/vehicle_validator.dart';

Widget certificateCont(
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
  required TextEditingController registerIssuedAtC,
  required TextEditingController permitIssuedAtC,
  required TextEditingController registerExpiresAtC,
  required TextEditingController permitExpiresAtC,
  required TextEditingController registerNo,
  required TextEditingController permitNo,
  required TextEditingController registerIssuedBy,
  required TextEditingController permitIssuedBy,
  required TextEditingController controller,
  required String registrationUrl,
  required String permitUrl,
}) {
  // final TextEditingController registerIssuedAtC = TextEditingController();
  // final TextEditingController permitIssuedAtC = TextEditingController();
  // final TextEditingController registerExpiresAtC = TextEditingController();
  // final TextEditingController permitExpiresAtC = TextEditingController();
  // final TextEditingController registerNo = TextEditingController();
  // final TextEditingController permitNo = TextEditingController();
  // final TextEditingController registerIssuedBy = TextEditingController();
  // final TextEditingController permitIssuedBy = TextEditingController();
  // final TextEditingController controller = TextEditingController();
  // String registrationUrl = '';
  // String permitUrl = '';
  return BlocListener<VehicleBloc, VehicleState>(
    listener: (context, state) {
      if (state.uploadPtStatus == VehicleStatus.error ||
          state.uploadRgStatus == VehicleStatus.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color.fromARGB(255, 134, 0, 0),
            content: Text(
              'error: ${state.error}',
              style: GoogleFonts.poppins(color: AppColors.white),
            ),
          ),
        );
      } else if (state.uploadRgStatus == VehicleStatus.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color.fromARGB(255, 11, 134, 0),
            content: Text(
              'Success',
              style: GoogleFonts.poppins(color: AppColors.white),
            ),
          ),
        );
        registrationUrl = state.url!;
      } else if (state.uploadPtStatus == VehicleStatus.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color.fromARGB(255, 11, 134, 0),
            content: Text(
              'Success',
              style: GoogleFonts.poppins(color: AppColors.white),
            ),
          ),
        );
        permitUrl = state.url!;
      }
    },
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(w(0.06)),
          margin: EdgeInsets.symmetric(horizontal: w(0.04)),
          width: double.infinity,
          height: h(0.57),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppTheme.color,
                // blurRadius: 8,
                offset: Offset(-4, 0),
              ),
            ],
          ),
          child: Column(
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
                    'Registration Certificate',
                    style: GoogleFonts.inter(
                      fontSize: w(0.05),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  context.read<VehicleBloc>().add(
                    UploadRegistartionFileEvent(),
                  );
                },
                child: Container(
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
                        'UPLOAD RC PDF/IMAGE',
                        style: GoogleFonts.poppins(
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
                (value) => VehicleValidator.certificateNo(value!, ''),
                registerNo,
              ),
              commonField(
                'ISSUED BY',
                '',
                w,
                h,
                (value) => VehicleValidator.issuedBy(value!, ''),
                registerIssuedBy,
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
                    registerIssuedAtC,
                    b: w(0.35),
                  ),
                  dateField(
                    'EXPIRES AT',
                    'mm/dd/yyyy',
                    w,
                    h,
                    (value) => VehicleValidator.required(value!, 'date'),
                    context,
                    registerExpiresAtC,
                    b: w(0.35),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: h(0.04)),
        registerButton(
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
          registerIssuedBy: registerIssuedBy,
          registerIssuedAt: registerIssuedAtC,
          registrationCertExpiresAt: registerExpiresAtC,
          registerNo: registerNo,
          registerUrl: registrationUrl,
          permitIssuedBy: permitIssuedBy,
          permitIssuedAt: permitIssuedAtC,
          permitNo: permitNo,
          permitUrl: permitUrl,
          permitExpiresAt: permitExpiresAtC,
        ),
      ],
    ),
  );
}
