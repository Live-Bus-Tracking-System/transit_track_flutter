import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/data/model/profile_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/view/edit_profile.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/containers.dart';

Widget infoCard(
  double Function(double) w,
  double Function(double) h,
  BuildContext context,
  ProfileModel? model, {
  required Function() onTap,
}) {
  return mainContain(
    w,
    double.infinity,
    h(0.37),
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: ListTile(
            onTap: onTap,
            leading: Icon(Icons.person, size: w(0.058)),
            title: Text(
              'Profile Details',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: w(0.04),
              ),
            ),
          ),
        ),
        SizedBox(
          child: ListTile(
            onTap: () {
              context.read<ProfileBloc>().add(SetDpProfileEvent());
            },
            leading: Icon(Icons.camera_alt, size: w(0.058)),
            title: Text(
              'Set Profile Dp',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: w(0.04),
              ),
            ),
          ),
        ),
        SizedBox(
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditProfile(model: model),
                ),
              );
            },
            leading: Icon(Icons.edit, size: w(0.058)),
            title: Text(
              'Edit Details',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: w(0.04),
              ),
            ),
          ),
        ),
        SizedBox(
          child: ListTile(
            onTap: () {},
            leading: Icon(Icons.directions_bus, size: w(0.058)),
            title: Text(
              'Security & Privacy',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: w(0.04),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
