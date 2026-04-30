import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget otpField(
  double Function(double) w,
  double Function(double) h,
  String? Function(String?) validator,
  List<TextEditingController> controllers,

  BuildContext context,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: List.generate(
      6,
      (index) => Container(
        width: w(0.11),
        height: h(0.07),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 235, 235, 235),
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          maxLength: 1,
          controller: controllers[index],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          validator: validator,
          onChanged: (value) {
            if (value.isNotEmpty) {
              if (index < 5) {
                FocusScope.of(context).nextFocus();
              }
            } else {
              if (index > 0) {
                FocusScope.of(context).previousFocus();
              }
            }
          },
          decoration: InputDecoration(
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
    ),
  );
}
