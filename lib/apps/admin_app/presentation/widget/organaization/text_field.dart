import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget orgTextField(double Function(double) w, double Function(double)h) {
  return Container(
    height: h(0.07),
    width: w(0.57),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(3),
    ),

    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Filter by name, ID, or contact',
          hintStyle: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 122, 122, 122),
            fontSize: w(0.014)
          ),
          prefixIcon: Icon(Icons.filter_1,size: w(0.02),),
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

Widget orgDropDown(double Function(double) w, double Function(double)h) {
  return Container(
    width: w(0.11),
    height: h(0.07),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(3),
    ),
    child: DropdownButtonFormField(
      validator: (value) {
        if (value == null) {
          return 'role is required';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'All STates',

        hintStyle: GoogleFonts.poppins(color: Colors.white,fontSize: w(0.014)),
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
      items: ['admin', 'user'].map((role) {
        return DropdownMenuItem(value: role, child: Text(role));
      }).toList(),
      onChanged: (String? newvalue) {},
    ),
  );
}
