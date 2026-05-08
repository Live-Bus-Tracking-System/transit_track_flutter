import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/bloc/vehicle_bloc.dart';

Widget searchField(
  double Function(double) w,
  double Function(double) h,
  BuildContext context,
  TextEditingController controller,
) {
  return Container(
    // padding: EdgeInsets.all(w(0.00)),
    width: double.infinity,
    height: h(0.07),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 212, 212, 212),
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextFormField(
      controller: controller,
      onChanged: (value) {
        if (value == '') {
          context.read<VehicleBloc>().add(GetAllFleetEvent());
          return;
        }
        context.read<VehicleBloc>().add(SearchVehicleByIdEvent(value));
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: const Color.fromARGB(255, 122, 122, 122),
          size: w(0.06),
        ),
        hintText: 'Serach ID, License Plate or Name..',
        hintStyle: GoogleFonts.poppins(
          color: const Color.fromARGB(255, 122, 122, 122),
          fontSize: w(0.04),
        ),

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
  );
}
