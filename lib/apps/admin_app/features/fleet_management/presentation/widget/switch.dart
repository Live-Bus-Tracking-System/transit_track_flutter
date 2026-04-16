import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class SwitchFleet extends StatelessWidget {
  final bool check;
  const SwitchFleet({super.key, required this.check});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Container(
      width: w(0.21),
      height: h(0.07),
      padding: EdgeInsets.all(w(0.003)),
      decoration: BoxDecoration(
        color: AppTheme.color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Align(
            alignment: check
                ? AlignmentGeometry.centerRight
                : AlignmentGeometry.centerLeft,
            child: check
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Public',
                      style: GoogleFonts.poppins(
                        fontSize: w(0.012),
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Private',
                      style: GoogleFonts.poppins(
                        fontSize: w(0.012),
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ),
          ),
          AnimatedAlign(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: check
                ? AlignmentGeometry.centerLeft
                : AlignmentGeometry.centerRight,
            child: Container(
              width: w(0.10),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: check
                    ? Text(
                        'Private',
                        style: GoogleFonts.poppins(
                          fontSize: w(0.012),
                          fontWeight: FontWeight.w600,
                          color: AppTheme.color,
                        ),
                      )
                    : Text(
                        'Public',
                        style: GoogleFonts.poppins(
                          fontSize: w(0.012),
                          fontWeight: FontWeight.w600,
                          color: AppTheme.color,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
