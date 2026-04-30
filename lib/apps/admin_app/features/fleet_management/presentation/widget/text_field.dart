import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/bloc/fleet_bloc.dart';

Widget fltTextField(
  double Function(double) w,
  double Function(double) h,
  BuildContext context,
  String id,
) {
  final TextEditingController controller = TextEditingController();
  return Container(
    height: h(0.07),
    width: w(0.74),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(3),
    ),

    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: TextField(
        controller: controller,
        onChanged: (value) {
          if (value == '') {
            context.read<FleetBloc>().add(GetAllFLeetEvent(id));
            return;
          }
          context.read<FleetBloc>().add(GetAllFLeetEvent(value));
        },
        decoration: InputDecoration(
          hintText: 'Search fleet by, ID, asset name',
          hintStyle: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 122, 122, 122),
            fontSize: w(0.011),
          ),
          prefixIcon: Icon(Icons.search, size: w(0.02)),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    ),
  );
}
