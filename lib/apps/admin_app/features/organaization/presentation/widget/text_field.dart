import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/bloc/organaization_bloc.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';

Widget orgTextField(
  double Function(double) w,
  double Function(double) h,
  BuildContext context,
) {
  TextEditingController cotroller = TextEditingController();
  return Container(
    height: h(0.07),
    width: w(0.54),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(3),
    ),

    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: TextField(
        controller: cotroller,
        onChanged: (value) {
          if (value == '') {
            context.read<OrganaizationBloc>().add(GetAllOrgEvent());
            return;
          }
          context.read<OrganaizationBloc>().add(SearchOrgByIdEvent(value));
          debugPrint(value);
        },
        decoration: InputDecoration(
          hintText: 'Search by name, ID, or contact',
          hintStyle: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 122, 122, 122),
            fontSize: w(0.012),
          ),
          prefixIcon: Icon(Icons.search, size: w(0.02)),
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
      ),
    ),
  );
}

Widget orgDropDown(
  double Function(double) w,
  double Function(double) h,
  BuildContext context,
) {
  return Container(
    width: w(0.13),
    height: h(0.07),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(3),
    ),
    child: DropdownButtonFormField(
      dropdownColor: AppColors.white,
      validator: (value) {
        if (value == null) {
          return 'role is required';
        }
        return null;
      },
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
      items: ['Actived', 'Suspended', 'Pending', 'Rejected'].map((state) {
        return DropdownMenuItem(
          value: state,
          child: Text(state, style: GoogleFonts.poppins()),
        );
      }).toList(),
      onChanged: (String? newvalue) {
        if (newvalue == 'Actived') {
          context.read<OrganaizationBloc>().add(GetOrgByStatusEvent(2));
        } else if (newvalue == 'Pending') {
          context.read<OrganaizationBloc>().add(GetOrgByStatusEvent(1));
        } else if (newvalue == 'Suspended') {
          context.read<OrganaizationBloc>().add(GetOrgByStatusEvent(3));
        } else {
          context.read<OrganaizationBloc>().add(GetOrgByStatusEvent(4));
        }
      },
    ),
  );
}
