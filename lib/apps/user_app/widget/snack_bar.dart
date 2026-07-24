import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

void showUserSnackBar(BuildContext context, String text, bool check) {
  final b = AppTheme.isDark(context);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(2),
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: Duration(seconds: 3),
      content: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.snackThemeColor(context),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.ThemeDasrkWhite(context),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            check
                ? Icon(Icons.check_circle, color: Colors.green)
                : Icon(Icons.error, color: AppColors.red),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  color: AppColors.ThemeDasrkWhite(context),
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
