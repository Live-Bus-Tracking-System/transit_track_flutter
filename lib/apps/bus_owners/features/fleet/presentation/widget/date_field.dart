import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/services/date_picker.dart';

Widget dateField(
  String label,
  String hint,
  double Function(double) w,
  double Function(double) h,
  String? Function(String?) validator,
  BuildContext context,
  TextEditingController controller, {
  double? b,

  double? hi,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: w(0.032),
          fontWeight: FontWeight.w600,
          color: const Color.fromARGB(255, 135, 135, 135),
        ),
      ),
      SizedBox(height: h(0.008)),
      Container(
        width: b ?? double.infinity,
        height: hi ?? h(0.05),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 235, 235, 235),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: controller,
          validator: validator,
          readOnly: true,
          onTap: () => datePicker(context, controller),
          decoration: InputDecoration(
            hintText: hint,
            // suffixIcon: Icon(Icons.calendar_today, color: const Color.fromARGB(255, 148, 148, 148),size: w(0.04),),
            hintStyle: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 122, 122, 122),
              fontSize: w(0.031),
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
      ),
    ],
  );
}
