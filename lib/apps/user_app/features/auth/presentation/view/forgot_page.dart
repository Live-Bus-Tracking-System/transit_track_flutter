import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/widget/buttons.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/widget/text_field.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/validators/user_signup.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;

    return Scaffold(
      backgroundColor: AppColors.ThemeDasrkWhite(context),
      appBar: AppBar(
        backgroundColor: AppColors.ThemeDasrkWhite(context),
        centerTitle: true,
        title: Text(
          "Forgot Password",
          style: GoogleFonts.poppins(
            fontSize: w(0.045),
            color: AppColors.ThemeWhiteDark(context),
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: h(0.1)),
              Image.asset('assets/lock.png', width: w(0.37)),
              SizedBox(height: h(0.03)),
              Text(
                "Forgot Password?",
                style: GoogleFonts.poppins(
                  color: AppColors.ThemeWhiteDark(context),
                  fontSize: w(0.06),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: h(0.02)),
              Text(
                textAlign: TextAlign.center,
                "Enter your email address for recovery\n your account",
                style: GoogleFonts.inter(
                  fontSize: w(0.034),
                  color: const Color.fromARGB(255, 139, 139, 139),
                ),
              ),
              SizedBox(height: h(0.02)),
              CustomTextField(
                controller: _email,
                title: "E-Mail",
                hint: "example@gmail.com",
                icon: Icons.mail_outline,
                validator: (v) => UserSignupValidator.email(v!),
              ),
              SizedBox(height: h(0.02)),
              PremiumAuthButton(text: "Submit", onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
