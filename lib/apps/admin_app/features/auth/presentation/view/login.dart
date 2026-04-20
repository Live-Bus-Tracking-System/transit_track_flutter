import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/presentation/bloc/auth_admin_bloc.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/presentation/widget/text.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/presentation/widget/text_field.dart';
import 'package:transit_track_flutter/apps/admin_app/features/route/presentation/widget/row.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/snack_bar.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/strings/auth_string.dart';
import 'package:transit_track_flutter/core/constants/strings/system_strings.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  Future<void> setB() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AuthString.isLogged, true);
  }



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();
    return BlocListener<AuthAdminBloc, AuthAdminState>(
      listener: (context, state) async {
        if (state.status == AuthAdminStatus.loading) {
          CircularProgressIndicator();
        } else if (state.status == AuthAdminStatus.success) {
          await setB();
       
          showSnackbar(
            context,
            'Success',
            const Color.fromARGB(255, 28, 154, 0),
          );
          context.go('/dashboard');
        } else if (state.status == AuthAdminStatus.error) {
          showSnackbar(context, state.error!, Colors.red);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.bg,
        body: Center(
          child: Container(
            width: w(0.8),
            height: h(0.85),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(
                    255,
                    102,
                    102,
                    102,
                  ).withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(w(0.03)),
                  width: w(0.3),
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 227, 227, 227),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: w(0.038),
                            height: h(0.078),
                            decoration: BoxDecoration(
                              color: AppTheme.color,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/bus-removebg-preview.png',
                                width: w(0.02),
                              ),
                            ),
                          ),
                          SizedBox(width: w(0.01)),

                          logHead1(SystemStrings.transitTrack, w),
                        ],
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AuthString.content1,
                              style: GoogleFonts.poppins(
                                fontSize: w(0.025),
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                            Text(
                              AuthString.content2,
                              style: GoogleFonts.poppins(
                                fontSize: w(0.025),
                                fontWeight: FontWeight.w600,
                                color: AppTheme.color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: w(0.22),
                        child: loghead3(AuthString.subContent1, w),
                      ),
                      SizedBox(height: h(0.32)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: w(0.065),
                    horizontal: w(0.13),
                  ),
                  width: w(0.5),
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AuthString.welcome,
                            style: GoogleFonts.poppins(
                              fontSize: w(0.018),
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                          loghead3(AuthString.subContent2, w),
                        ],
                      ),

                      logTextField(
                        AuthString.email,
                        AuthString.dummyEmail,
                        Icons.email_outlined,
                        w,
                        h,
                        _email,
                      ),
                      logTextField(
                        AuthString.key,
                        AuthString.password,
                        Icons.lock,
                        w,
                        h,
                        _password,
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            Text(
                              AuthString.remember,
                              style: GoogleFonts.poppins(
                                fontSize: w(0.012),
                                color: const Color.fromARGB(255, 101, 101, 101),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<AuthAdminBloc>().add(
                            LoginAuthAdminEvent(
                              email: _email.text.trim(),
                              password: _password.text.trim(),
                            ),
                          );
                        },
                        child: Container(
                          width: w(0.24),
                          height: h(0.07),
                          decoration: BoxDecoration(
                            color: AppTheme.color,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(
                                  255,
                                  102,
                                  102,
                                  102,
                                ).withOpacity(0.2),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              AuthString.login,
                              style: GoogleFonts.poppins(
                                fontSize: w(0.01),
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
