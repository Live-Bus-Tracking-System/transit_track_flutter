import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/view/login.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/widget/buttons.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/widget/logo.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/widget/text_field.dart';
import 'package:transit_track_flutter/apps/user_app/features/bottom/view/bottom_bar.dart';
import 'package:transit_track_flutter/apps/user_app/widget/snack_bar.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';
import 'package:transit_track_flutter/core/validators/user_signup.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool scalee = false;
  bool agree = false;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return BlocConsumer<AuthUserBloc, AuthUserState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          loading = true;
        } else if (state is AuthError) {
          loading = false;
          showUserSnackBar(context, state.message, false);
        } else if (state is AuthSuccess) {
          loading = false;
          showUserSnackBar(context, "Successfully registered", true);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomBarApp()),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.ThemeDasrkWhite(context),
          body: ListView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              Form(
                key: _key,
                child: Column(
                  spacing: h(0.005),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: h(0.08)),
                    logoIcon(w),

                    Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: AppColors.ThemeWhiteDark(context),
                          fontWeight: FontWeight.bold,
                          fontSize: w(0.06),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        ' Join thousands of commuters tracking\n their city in real-time.',
                        style: GoogleFonts.inter(
                          fontSize: w(0.034),
                          color: const Color.fromARGB(255, 160, 160, 160),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    CustomTextField(
                      kbType: TextInputType.name,
                      title: "Full Name",
                      controller: nameController,
                      hint: "Full Name",
                      icon: Icons.person_outline,
                      validator: (value) => UserSignupValidator.name(value!),
                    ),

                    CustomTextField(
                      kbType: TextInputType.phone,
                      title: "Phone Number",
                      controller: phoneController,
                      hint: "+91XXXXXXXXXX",

                      icon: Icons.phone_outlined,
                      validator: (value) => UserSignupValidator.phone(value!),
                    ),

                    CustomTextField(
                      kbType: TextInputType.emailAddress,
                      title: "E-Mail Address",
                      controller: emailController,
                      hint: "example@gmail.com",
                      icon: Icons.mail_outline,
                      validator: (value) => UserSignupValidator.email(value!),
                    ),

                    CustomTextField(
                      
                      title: "Password",
                      controller: passwordController,
                      hint: "Password",

                      icon: Icons.lock_outline,
                      validator: (value) =>
                          UserSignupValidator.password(value!),
                    ),

                    CustomTextField(
                      title: "Confirm Password",
                      controller: confirmController,
                      hint: "Confirm Password",

                      icon: Icons.lock_outline,
                      validator: (v) => null,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: w(0.06)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                            checkColor: AppColors.ThemeDasrkWhite(context),
                            activeColor: AppColors.ThemeWhiteDark(context),
                            side: BorderSide(
                              color: AppColors.ThemeWhiteDark(context),
                            ),
                            value: agree,
                            onChanged: (v) {
                              setState(() {
                                agree = !agree;
                              });
                            },
                          ),
                          SizedBox(
                            width: w(0.71),
                            child: Text(
                              "I agree to the Terms of Service and Privacy Policy.",
                              style: GoogleFonts.inter(
                                fontSize: w(0.03),
                                color: AppColors.ThemeWhiteDark(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    AnimatedOpacity(
                      duration: Duration(milliseconds: 350),
                      curve: Curves.easeInOut,
                      opacity: agree ? 1 : .5,
                      child: IgnorePointer(
                        ignoring: !agree,
                        child: PremiumAuthButton(
                          loading: loading,
                          text: "Create Account",
                          onTap: () {
                            if (_key.currentState!.validate()) {
                              if (passwordController.text !=
                                  confirmController.text) {
                                showUserSnackBar(
                                  context,
                                  "confirm password doesn't match",
                                  false,
                                );
                                return;
                              }

                              context.read<AuthUserBloc>().add(
                                AuthRegisterEvent(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),

                    Center(
                      child: Text(
                        "OR",
                        style: GoogleFonts.inter(
                          fontSize: w(0.035),
                          color: AppColors.ThemeWhiteDark(context),
                        ),
                      ),
                    ),

                    PremiumGoogleButton(
                      text: "Continue with google",
                      onTap: () {},
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: GoogleFonts.inter(
                            fontSize: w(0.035),
                            color: AppColors.ThemeWhiteDark(context),
                          ),
                        ),
                        TextButton(
                          child: Text(
                            "Sign In",
                            style: GoogleFonts.poppins(
                              fontSize: w(0.035),
                              color: AppTheme.color,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => Login()),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
