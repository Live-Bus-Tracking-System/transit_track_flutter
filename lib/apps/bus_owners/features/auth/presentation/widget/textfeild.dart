import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool obscure;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.obscure = false,
    required this.validator
  });

  @override
  Widget build(BuildContext context) {
         final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Container(
      width: double.infinity,
      height: h(0.06),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 232, 232, 232)
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
      
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon),
          hintStyle: GoogleFonts.poppins(),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        validator: (validator)
      ),
    );
  }
}