import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/containers.dart';

Widget infoCard(double Function(double) w,double Function(double) h) {
  return mainContain(
    w,
    double.infinity,
    h(0.37),
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: ListTile(
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
            leading: Icon(Icons.notifications, size: w(0.058)),
            title: Text(
              'Notification Prefernces',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: w(0.04),
              ),
            ),
          ),
        ),
        SizedBox(
          child: ListTile(
            leading: Icon(Icons.security, size: w(0.058)),
            title: Text(
              'Security & Privacy',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: w(0.04),
              ),
            ),
          ),
        ),
        SizedBox(
          child: ListTile(
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
