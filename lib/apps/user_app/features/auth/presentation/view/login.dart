import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/dashboard/presentation/view/dashboard.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/view/forgot_page.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/view/signup.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/widget/buttons.dart';
import 'package:transit_track_flutter/core/widget/logo.dart';

import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/widget/text_field.dart';
import 'package:transit_track_flutter/apps/user_app/features/bottom/view/bottom_bar.dart';

import 'package:transit_track_flutter/apps/user_app/widget/snack_bar.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool remember = false;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Scaffold(
      backgroundColor: AppColors.ThemeDasrkWhite(context),
      body: BlocConsumer<AuthUserBloc, AuthUserState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            loading = true;
          } else if (state is AuthError) {
            loading = false;
            showUserSnackBar(context, "${state.message}", false);
          } else if (state is AuthSuccess) {
            loading = false;
            showUserSnackBar(context, "Successfully logined", true);
            if (state.role == AuthRole.orgAdmin) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => DashboardScreen()),
              );
            } else {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => BottomBarApp()),
              );
            }
          }
        },
        builder: (context, state) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: h(0.005),
                children: [
                  SizedBox(height: h(0.08)),
                  logoIcon(w),
                  Center(
                    child: Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: w(0.06),
                        color: AppColors.ThemeWhiteDark(context),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Track your ride and reach your\n destination on time.',
                      style: GoogleFonts.inter(
                        fontSize: w(0.034),
                        color: const Color.fromARGB(255, 139, 139, 139),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10),

                  CustomTextField(
                    title: "Phone or E-Mail",
                    controller: emailController,
                    hint: "E-mail or Phone",
                    icon: Icons.person_outline,
                    validator: (v) => null,
                  ),

                  CustomTextField(
                    title: "Password",
                    controller: passwordController,
                    hint: "Password",

                    icon: Icons.lock_outline,
                    validator: (v) => null,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w(0.06)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              checkColor: AppColors.ThemeDasrkWhite(context),
                              activeColor: AppColors.ThemeWhiteDark(context),
                              side: BorderSide(
                                color: AppColors.ThemeWhiteDark(context),
                              ),
                              value: remember,
                              onChanged: (v) {
                                setState(() {
                                  remember = !remember;
                                });
                              },
                            ),
                            Text(
                              "Remember me",
                              style: GoogleFonts.inter(
                                fontSize: w(0.03),
                                color: AppColors.ThemeWhiteDark(context),
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Forgot Password?",
                              style: GoogleFonts.poppins(
                                fontSize: w(0.03),
                                color: AppTheme.color,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  PremiumAuthButton(
                    loading: loading,
                    text: "Sign In",
                    onTap: () {
                      // context.read<AuthUserBloc>().add(
                      //   AuthLoginEvent(
                      //     email: emailController.text,
                      //     password: passwordController.text,
                      //   ),
                      // );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => BottomBarApp()),
                      );
                    },
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
                        "Don't have an account? ",
                        style: GoogleFonts.inter(
                          fontSize: w(0.035),
                          color: AppColors.ThemeWhiteDark(context),
                        ),
                      ),
                      TextButton(
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.poppins(
                            fontSize: w(0.035),
                            color: AppTheme.color,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => Signup()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
