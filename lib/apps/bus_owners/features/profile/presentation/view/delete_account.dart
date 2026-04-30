import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/widget/accept.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/widget/container.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/widget/otp_field.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/widget/text_field.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/containers.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/snack_bar.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/text_Field.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  final List<TextEditingController> controllers = List.generate(
    6,
    (value) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    final passwordC = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          'Delete Account',
          style: GoogleFonts.poppins(
            fontSize: w(0.05),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(w(0.052)),
        children: [
          Text(
            'CRITICAL SECURITY PROTOCOL',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: w(0.04),
              color: const Color.fromARGB(255, 146, 10, 0),
            ),
          ),
          SizedBox(height: h(0.02)),
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: SizedBox(
              width: w(0.8),
              child: Text(
                'Delete Organaization Account',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w800,
                  fontSize: w(0.08),
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: h(0.02)),
          Text(
            'You are initiating the permanent decommissioning of kinetic logistics north.',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: w(0.04),
              color: AppTheme.color,
            ),
          ),
          SizedBox(height: h(0.02)),
          deleteContain(
            w,
            double.infinity,
            h(0.45),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'STEP 01',
                  style: GoogleFonts.inter(
                    color: AppColors.black,
                    fontSize: w(0.04),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: w(0.5),
                  child: Text(
                    'Security Verification',
                    style: GoogleFonts.inter(
                      color: AppColors.black,
                      fontSize: w(0.07),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                deleteField(
                  'DIRECTOR PASSWORD',
                  'Enter Password',
                  w,
                  h,
                  (v) => null,
                  passwordC,
                ),
                Container(
                  width: double.infinity,
                  height: h(0.07),
                  decoration: BoxDecoration(
                    color: AppTheme.color,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(
                          255,
                          102,
                          102,
                          102,
                        ).withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Verify Identity',
                      style: GoogleFonts.poppins(
                        fontSize: w(0.05),
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: h(0.02)),
          mainContain(
            w,
            double.infinity,
            h(0.4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'STEP 02',
                  style: GoogleFonts.inter(
                    color: AppColors.black,
                    fontSize: w(0.04),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Verify Otp',
                  style: GoogleFonts.inter(
                    color: AppColors.black,
                    fontSize: w(0.07),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'A 6-digit verification code was sent to your mobilr device',
                  style: GoogleFonts.inter(
                    color: const Color.fromARGB(255, 152, 56, 0),
                    fontSize: w(0.04),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                otpField(w, h, (value) => null, controllers, context),
                Container(
                  width: double.infinity,
                  height: h(0.07),
                  decoration: BoxDecoration(
                    color: AppTheme.color,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(
                          255,
                          102,
                          102,
                          102,
                        ).withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Verify Otp',
                      style: GoogleFonts.poppins(
                        fontSize: w(0.05),
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: h(0.02)),
          mainContain(
            w,
            double.infinity,
            h(0.6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'STEP 03',
                  style: GoogleFonts.inter(
                    color: AppColors.black,
                    fontSize: w(0.04),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: w(0.5),
                  child: Text(
                    'Permanent Deletion',
                    style: GoogleFonts.inter(
                      color: AppColors.black,
                      fontSize: w(0.07),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                acceptRequire(
                  w,
                  h,
                  'I understand all data will be scrubbed from production and backup nodes',
                ),
                acceptRequire(
                  w,
                  h,
                  'I have verified that all required reports have been backed up externally',
                ),
                acceptRequire(
                  w,
                  h,
                  'I am legally authorized to perform this organization deletion',
                ),

                GestureDetector(
                  onTap: () {
                    busOwnersSanckBar(context: context, text: 'success');
                  },
                  child: Container(
                    width: double.infinity,
                    height: h(0.07),
                    decoration: BoxDecoration(
                      color: AppTheme.color,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(
                            255,
                            102,
                            102,
                            102,
                          ).withOpacity(0.2),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Delete Permanently',
                        style: GoogleFonts.poppins(
                          fontSize: w(0.05),
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
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
