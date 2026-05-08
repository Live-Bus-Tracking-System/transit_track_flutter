import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/dashboard/presentation/view/dashboard.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/view/signup.dart';

import 'package:transit_track_flutter/apps/bus_owners/features/auth/presentation/widget/textfeild.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/view/home.dart';
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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Scaffold(
      body: BlocConsumer<AuthBlocBloc, AuthBlocState>(
        listener: (context, state) {
          if (state is AuthLoading) {
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.red,
                content: Text(
                  'error: ${state.message}',
                  style: GoogleFonts.poppins(color: AppColors.white),
                ),
              ),
            );
          } else if (state is AuthAuthenticated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: const Color.fromARGB(255, 11, 134, 0),
                content: Text(
                  'Success',
                  style: GoogleFonts.poppins(color: AppColors.white),
                ),
              ),
            );
            if (state.role == AuthRole.orgAdmin) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => DashboardScreen()),
              );
            } else {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(w(0.04)),
            child: ListView(
              children: [
                SizedBox(height: 20),
                Center(
                  child: CircleAvatar(
                    backgroundColor: AppTheme.color,
                    radius: 30,
                    child: Icon(
                      Icons.directions_bus,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Welcome Back",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Center(
                  child: Text(''' 
          Track your ride and reach your 
          destination on time. 
              '''),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Text("Phone or Email"),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: CustomTextField(
                    controller: emailController,
                    hint: "E-mail or Phone",
                    icon: Icons.person,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Enter a Phone or email";
                      }
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Text("Password"),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: CustomTextField(
                    controller: passwordController,
                    hint: "Enter a Password",
                    obscure: true,
                    icon: Icons.lock,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Enter a Password";
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (v) {}),
                        Text("Remember me"),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.poppins(
                          fontSize: w(0.03),
                          color: AppTheme.color,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Container(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.color,
                      ),
                      onPressed: () {
                        context.read<AuthBlocBloc>().add(
                          LoginSubmitted(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                      },
                      child: Text(
                        "Sign In →",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Center(child: Text("OR")),

                SizedBox(height: 10),

                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.g_mobiledata, size: 30),
                      SizedBox(width: 10),
                      Text("Continue with Google"),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    TextButton(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: AppTheme.color),
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
          );
        },
      ),
    );
  }
}
