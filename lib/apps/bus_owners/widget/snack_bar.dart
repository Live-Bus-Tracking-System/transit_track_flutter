import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';

void busOwnersSanckBar({
  required BuildContext context,
  required String text,
  Color bgColor = const Color.fromARGB(255, 0, 135, 4),
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 8,
      backgroundColor: AppColors.ThemeDasrkWhite(context),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      content: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: bgColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, color: bgColor),
          ),
          SizedBox(width: 12),
          Text(
            text,
            style: GoogleFonts.poppins(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}

void orgSnackbar(BuildContext context, String text, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(top: 15, right: 15, left: 15),
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      elevation: 0,
      duration: Duration(seconds: 3),
      content: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: const Color.fromARGB(86, 0, 0, 0), blurRadius: 10),
          ],
        ),
        child: Row(
          children: [
            color == AppColors.red
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
