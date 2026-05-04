import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/widget/accept.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/widget/container.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/widget/otp_field.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/widget/text_field.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/containers.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/snack_bar.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/text_Field.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/view/login.dart';
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
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.dltInitStatus == ProfileStatus.error ||
            state.dltOtpStatus == ProfileStatus.error ||
            state.dltConfirmStatus == ProfileStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.red,
              content: Text(
                'error: ${state.error}',
                style: GoogleFonts.poppins(color: AppColors.white),
              ),
            ),
          );
        } else if (state.dltInitStatus == ProfileStatus.success ||
            state.dltOtpStatus == ProfileStatus.success ||
            state.dltConfirmStatus == ProfileStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: const Color.fromARGB(255, 31, 145, 0),
              content: Text(
                'Success',
                style: GoogleFonts.poppins(color: AppColors.white),
              ),
            ),
          );
        }
        if (state.dltConfirmStatus == ProfileStatus.success) {
          Navigator.of(
            context,
          ).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
        }
      },
      child: Scaffold(
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
          children: [
            SizedBox(height: h(0.02)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w(0.04)),
              child: Text(
                'CRITICAL SECURITY PROTOCOL',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: w(0.04),
                  color: const Color.fromARGB(255, 146, 10, 0),
                ),
              ),
            ),
            SizedBox(height: h(0.02)),
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: SizedBox(
                width: w(0.8),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w(0.04)),
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
            ),
            SizedBox(height: h(0.02)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w(0.04)),
              child: Text(
                'You are initiating the permanent decommissioning of kinetic logistics north.',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: w(0.04),
                  color: AppTheme.color,
                ),
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
                  GestureDetector(
                    onTap: () {
                      context.read<ProfileBloc>().add(
                        DeleteInitEvent(passwordC.text),
                      );
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
                          'Verify Identity',
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
                  GestureDetector(
                    onTap: () {
                      context.read<ProfileBloc>().add(
                        OtpVerifyEvent(
                          controllers.map((e) => e.text).toList().join(''),
                        ),
                      );
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
                          'Verify Otp',
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
            SizedBox(height: h(0.02)),
            mainContain(
              w,
              double.infinity,
              h(0.7),
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
                      // busOwnersSanckBar(context: context, text: 'success');
                      context.read<ProfileBloc>().add(ConfirmDeleteEvent());
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
      ),
    );
  }
}
