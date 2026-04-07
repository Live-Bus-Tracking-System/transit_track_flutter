import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showSnackbar(BuildContext context, String text, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        top: 20,
        right: 20,
        left: MediaQuery.of(context).size.width * 0.7,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: Duration(seconds: 3),
      content: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(118, 0, 0, 0),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: const Color.fromARGB(86, 0, 0, 0), blurRadius: 10),
          ],
        ),
        child: Row(
          children: [
            color == Colors.red
                ? Icon(Icons.error, color: color)
                : Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
