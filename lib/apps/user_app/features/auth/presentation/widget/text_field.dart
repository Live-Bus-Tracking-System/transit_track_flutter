import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? kbType;
  final String title;
  final String hint;
  final IconData icon;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    this.kbType,
    required this.controller,
    required this.title,
    required this.hint,
    required this.icon,

    required this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscure = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w(0.06)),
          child: Text(
            widget.title,
            style: GoogleFonts.inter(
              fontSize: w(0.037),
              color: AppColors.ThemeWhiteDark(context),
            ),
          ),
        ),
        SizedBox(height: h(0.01)),
        AnimatedContainer(
          duration: Duration(microseconds: 250),
          margin: EdgeInsets.symmetric(horizontal: w(0.06)),
          child: TextFormField(
            controller: widget.controller,
            obscureText: obscure,
           keyboardType: widget.kbType,
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(
                  color: Color(0xFFFF4D4F),
                  width: 1.5,
                ),
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(
                  color: Color(0xFFFF4D4F),
                  width: 2,
                ),
              ),

              errorStyle: TextStyle(
                color: Color(0xFFFF4D4F),
                fontSize: w(0.035),
                fontWeight: FontWeight.w500,
                height: 1.3,
              ),
              hintText: widget.hint,
              hintStyle: GoogleFonts.inter(
                fontSize: w(0.036),
                color: const Color.fromARGB(255, 135, 135, 135),
              ),
              suffixIcon: widget.icon == Icons.lock_outline
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      icon: obscure
                          ? Icon(Icons.visibility_off)
                          : Icon(
                              Icons.visibility,
                              color: AppColors.ThemeWhiteDark(context),
                            ),
                    )
                  : null,
              prefixIcon: Icon(
                widget.icon,
                color: const Color.fromARGB(255, 135, 135, 135),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppTheme.color),
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            validator: (widget.validator),
          ),
        ),
      ],
    );
  }
}
