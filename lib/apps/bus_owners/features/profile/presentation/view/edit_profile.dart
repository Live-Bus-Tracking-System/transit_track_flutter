import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/data/model/profile_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/widget/text_field.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';
import 'package:transit_track_flutter/core/validators/org_signup.dart';
import 'package:transit_track_flutter/core/validators/vehicle_validator.dart';

class EditProfile extends StatefulWidget {
  final ProfileModel? model;
  const EditProfile({super.key, required this.model});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    nameC.text = widget.model!.name!;
    emailC.text = widget.model!.email!;
    phoneC.text = widget.model!.phone!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Scaffold(
      backgroundColor: AppColors.ThemeDasrkWhite(context),
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                context.read<ProfileBloc>().add(
                  UpdateOrgEvent(
                    id: widget.model!.id!,
                    name: nameC.text,
                    email: emailC.text,
                    phone: phoneC.text,
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            child: Container(
              margin: EdgeInsets.only(right: w(0.03)),
              width: w(0.25),
              height: h(0.05),
              decoration: BoxDecoration(
                color: AppTheme.color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Save',
                  style: GoogleFonts.poppins(
                    fontSize: w(0.035),
                    color: AppColors.ThemeDasrkWhite(context),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.ThemeDasrkWhite(context),
        title: Text(
          'Edit Profile',
          style: GoogleFonts.poppins(
            fontSize: w(0.05),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: h(0.04)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: w(0.06)),
                padding: EdgeInsets.all(w(0.052)),
                width: double.infinity,
                height: h(0.2),
                decoration: BoxDecoration(
                  color: AppColors.ThemeDasrkWhite(context),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.color.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 0), // IMPORTANT
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: .spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CURRENT PROFILE',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 201, 81, 1),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: w(0.15),
                          height: h(0.08),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 221, 221, 221),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.business,
                              color: const Color.fromARGB(255, 112, 45, 0),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: w(0.4),
                          child: Text(
                            'Kinetic Logistics HQ',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w800,
                              fontSize: w(0.045),
                            ),
                          ),
                        ),
                        SizedBox(),
                        SizedBox(),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: h(0.04)),

              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: w(0.06)),
                child: Text(
                  'Organization Essential',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: w(0.04),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: w(0.06)),
                child: Divider(),
              ),
              SizedBox(height: h(0.04)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.only(
                      left: w(0.06),
                      bottom: h(0.01),
                    ),
                    child: Text(
                      'ORGANIZATION ID (SYSTEM LOCKED)',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 168, 67, 0),
                        fontSize: w(0.03),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: w(0.06)),

                    width: double.infinity,
                    height: h(0.1),
                    decoration: BoxDecoration(
                      color: AppColors.bg,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(width: w(0.04)),
                          Icon(
                            Icons.lock_outlined,
                            color: const Color.fromARGB(255, 86, 43, 14),
                          ),
                          SizedBox(width: w(0.04)),
                          SizedBox(
                            width: w(0.6),
                            child: Text(
                              widget.model!.id!,
                              style: GoogleFonts.inter(
                                color: const Color.fromARGB(255, 77, 38, 12),
                                fontSize: w(0.035),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h(0.04)),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: w(0.06)),
                child: deleteField(
                  'LEGAL ORGANIZATION NAME',
                  'enter name',
                  w,
                  h,
                  (value) => OrgSignupValidator.name(value!),
                  nameC,
                ),
              ),
              SizedBox(height: h(0.04)),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: w(0.06)),
                child: deleteField(
                  'ADMIN EMAIL ADDRESS',
                  'enter email',
                  w,
                  h,
                  (value) => OrgSignupValidator.email(value!),
                  emailC,
                ),
              ),
              SizedBox(height: h(0.04)),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: w(0.06)),
                child: deleteField(
                  'CONTACT PHONE NUMBER',
                  'enter phone',
                  w,
                  h,
                  (value) => OrgSignupValidator.phone(value!),
                  phoneC,
                ),
              ),
              SizedBox(height: h(0.04)),
            ],
          ),
        ),
      ),
    );
  }
}
