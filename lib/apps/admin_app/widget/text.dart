import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget head1(String text, double size) {
  return Text(
    text,
    style: GoogleFonts.poppins(fontSize: size, fontWeight: FontWeight.w600),
  );
}

Widget head3(String text,double size,[Color bg=const Color.fromARGB(255, 88, 88, 88)]) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontSize:size ,
      color: bg,
    ),
  );
}
