import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/bloc/fleet_bloc.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';

Widget fleetDropDown(
  double Function(double) w,
  double Function(double) h,
  BuildContext context,
  String id,
) {
  return Container(
    width: w(0.13),
    height: h(0.07),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 227, 235, 238),
      borderRadius: BorderRadius.circular(3),
    ),
    child: DropdownButtonFormField(
      dropdownColor: AppColors.white,
      // validator: (value) {
      //   if (value == null) {
      //     return 'role is required';
      //   }
      //   return null;
      // },
      decoration: InputDecoration(
        hintText: 'Filter Status',

        hintStyle: GoogleFonts.poppins(color: Colors.white, fontSize: w(0.014)),
        // labelText: 'All STates',
        labelStyle: TextStyle(color: Colors.white),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            color: const Color.fromARGB(255, 203, 203, 203),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            color: const Color.fromARGB(255, 203, 203, 203),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            color: const Color.fromARGB(255, 203, 203, 203),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      items: ['Actived', 'InActivated'].map((state) {
        return DropdownMenuItem(
          value: state,
          child: Text(state, style: GoogleFonts.poppins()),
        );
      }).toList(),
      onChanged: (String? newvalue) {
        if (newvalue == 'Actived') {
          context.read<FleetBloc>().add(GetFleetByStatusEvent(id, true));
        } else {
          context.read<FleetBloc>().add(GetFleetByStatusEvent(id, false));
        }
      },
    ),
  );
}
