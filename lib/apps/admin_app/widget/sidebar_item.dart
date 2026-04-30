import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/hover.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

Widget sideBarItem(
  IconData icon,
  String text,
  bool active,
  VoidCallback onTap,
  double Function(double) h,
  double Function(double) w,
) {
  return HoverWidget(
    child: GestureDetector(
      onTap: onTap,
    
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          width: w(0.2),
          height: h(0.09),
          decoration: BoxDecoration(
            boxShadow: [
              active
                  ? BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    )
                  : BoxShadow(
                      color: const Color.fromARGB(255, 249, 249, 249).withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
            ],
            color: active ? Colors.white : null,
            borderRadius: BorderRadius.circular(12),
          ),
    
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: ListTile(
              leading: Icon(
                icon,
                color: active ? AppTheme.color : Colors.black,
                size: w(0.014),
              ),
              title: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: w(0.012),
                  fontWeight: FontWeight.w600,
                  color: active ? AppTheme.color : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
