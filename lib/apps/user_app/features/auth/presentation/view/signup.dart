



import 'package:flutter/material.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/presentation/view/login.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/view/otp.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/widget/textfeild.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                  backgroundColor:AppTheme.color,
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
                  "Create Account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Center(
                child: Text(''' 
            Join thousands of commuters tracking 
                    their city in real-time.
                 '''),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Text("Full Name"),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: CustomTextField(
                  controller: nameController,
                  hint: "Full Name",
                  icon: Icons.person,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Enter a Full Name";
                    }
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Text("Phone Number"),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: CustomTextField(
                  controller: phoneController,
                  hint: "Enter a Phone",
                  obscure: true,
                  icon: Icons.lock,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Enter a Phone";
                    }
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Text("Email"),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: CustomTextField(
                  controller: emailController,
                  hint: "E-mail",
                  icon: Icons.person,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Enter a email";
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
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Text("Confirm Password"),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: CustomTextField(
                  controller: confirmController,
                  hint: "Enter a Confirm Password",
                  obscure: true,
                  icon: Icons.lock,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Enter a Confirm Password";
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
                      Text(
                        "I agree to the Terms of Service and Privacy Policy.",
                      ),
                    ],
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
                      MaterialPageRoute(builder: (_) => Otp()),
                    );
                  },
                  child: Text(
                    "Create  Account→",
                    style: TextStyle(fontSize: 18, color: Colors.white),
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
                      "Sign In",
                      style: TextStyle(color: AppTheme.color),
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
        ],
      ),
    );
  }
}
