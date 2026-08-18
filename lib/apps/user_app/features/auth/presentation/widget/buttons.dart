import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class PremiumAuthButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final bool loading;

  const PremiumAuthButton({
    super.key,
    required this.text,
    required this.onTap,
    this.loading = false,
  });

  @override
  State<PremiumAuthButton> createState() => _PremiumAuthButtonState();
}

class _PremiumAuthButtonState extends State<PremiumAuthButton> {
  double scale = 1;

  Future<void> _tap() async {
    setState(() => scale = .95);

    await Future.delayed(const Duration(milliseconds: 100));

    setState(() => scale = 1);

    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return AnimatedScale(
      scale: scale,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutBack,
      child: GestureDetector(
        onTapDown: (_) => setState(() => scale = .95),
        onTapUp: (_) => setState(() => scale = 1),
        onTapCancel: () => setState(() => scale = 1),
        onTap: _tap,
        child: AnimatedContainer(
          margin: EdgeInsets.symmetric(horizontal: w(0.06)),
          duration: const Duration(milliseconds: 250),
          height: 58,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [Color(0xFFFF8A00), AppTheme.color],
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.color.withOpacity(.35),
                blurRadius: 25,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Center(
            child: widget.loading
                ? SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.ThemeDasrkWhite(context),
                    ),
                  )
                : Text(
                    widget.text,
                    style: GoogleFonts.poppins(
                      fontSize: w(0.04),
                      color: AppColors.ThemeDasrkWhite(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class PremiumGoogleButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final bool loading;
  const PremiumGoogleButton({
    super.key,
    required this.text,
    required this.onTap,
    this.loading = false,
  });

  @override
  State<PremiumGoogleButton> createState() => _PremiumGoogleButtonState();
}

class _PremiumGoogleButtonState extends State<PremiumGoogleButton> {
  double scale = 1;

  Future<void> _tap() async {
    setState(() => scale = .95);

    await Future.delayed(const Duration(milliseconds: 100));

    setState(() => scale = 1);

    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return AnimatedScale(
      scale: scale,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutBack,
      child: GestureDetector(
        onTapDown: (_) => setState(() => scale = .95),
        onTapUp: (_) => setState(() => scale = 1),
        onTapCancel: () => setState(() => scale = 1),
        onTap: _tap,
        child: AnimatedContainer(
          margin: EdgeInsets.symmetric(horizontal: w(0.06)),
          duration: const Duration(milliseconds: 250),
          height: h(0.06),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color.fromARGB(255, 221, 221, 221),
          ),
          child: Center(
            child: widget.loading
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("assets/google_icon.png", width: w(0.06)),
                      SizedBox(width: w(0.01)),
                      Text(
                        widget.text,
                        style: GoogleFonts.poppins(
                          fontSize: w(0.03),
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: w(0.13)),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
