import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/presentation/view/dashboard.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/presentation/bloc/bus_owner_auth_bloc.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/view/login.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/presentation/widget/textfeild.dart';
import 'package:transit_track_flutter/core/constants/strings/bus_owner/auth_strings.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';
import 'package:transit_track_flutter/core/validators/org_signup.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final busesController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return BlocListener<BusOwnerAuthBloc, BusOwnerAuthState>(
      listener: (context, state) {},
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: w(0.05)),
          children: [
            Column(
              spacing: h(0.013),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h(0.02)),
                Center(
                  child: CircleAvatar(
                    backgroundColor: AppTheme.color,
                    radius: w(0.08),
                    child: Icon(
                      Icons.directions_bus,
                      color: Colors.white,
                      size: w(0.09),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    AuthStrings.head1,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: w(0.06),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: w(0.7),
                    child: Text(AuthStrings.head2, style: GoogleFonts.inter()),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Text(AuthStrings.head3, style: GoogleFonts.inter()),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: CustomTextField(
                    controller: nameController,
                    hint: AuthStrings.head4,
                    icon: Icons.person,
                    validator: (v) => OrgSignupValidator.name(v ?? ''),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Text(AuthStrings.head5, style: GoogleFonts.inter()),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: CustomTextField(
                    controller: phoneController,
                    hint: AuthStrings.head6,
                    obscure: true,
                    icon: Icons.lock,
                    validator: (v) => OrgSignupValidator.phone(v ?? ''),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Text(AuthStrings.head7, style: GoogleFonts.inter()),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: CustomTextField(
                    controller: emailController,
                    hint: AuthStrings.head8,
                    icon: Icons.person,
                    validator: (v) => OrgSignupValidator.email(v ?? ''),
                  ),
                ),

                Row(
                  children: [
                    Checkbox(value: false, onChanged: (v) {}),
                    Text(
                      AuthStrings.head9,
                      style: GoogleFonts.inter(fontSize: w(0.03)),
                    ),
                  ],
                ),

                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.color,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const Dashboard()),
                      );
                    },
                    child: Text(
                      AuthStrings.head10,
                      style: GoogleFonts.inter(
                        fontSize: w(0.04),
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Center(child: Text(AuthStrings.head11)),

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
                      Text(AuthStrings.head12),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AuthStrings.head13),
                    TextButton(
                      child: Text(
                        AuthStrings.head14,
                        style: TextStyle(color: AppTheme.color),
                      ),
                      onPressed: () {
                        context.read<BusOwnerAuthBloc>().add(
                          CreateBusOwnerEvent(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            type: 2,
                          ),
                        );
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
          ],
        ),
      ),
    );
  }
}
