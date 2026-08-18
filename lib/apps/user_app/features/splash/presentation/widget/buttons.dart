import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class IntroActionButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const IntroActionButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  State<IntroActionButton> createState() => _IntroActionButtonState();
}

class _IntroActionButtonState extends State<IntroActionButton> {
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
            child: Text(
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
