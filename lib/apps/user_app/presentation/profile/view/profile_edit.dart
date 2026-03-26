import 'package:flutter/material.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';
import 'package:transit_track_flutter/apps/user_app/presentation/auth/widget/textfeild.dart';
import 'package:transit_track_flutter/apps/user_app/presentation/profile/view/profile.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final emailContext=TextEditingController();
  final phoneContext=TextEditingController();
  final userNameContext=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Profile Edit"),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Center(
                 child: const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey,
                      ),
               ),
              
                    const SizedBox(height: 10),

                     Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Text("Full Name"),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: CustomTextField(
                  controller: userNameContext,
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
                  controller: phoneContext,
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
                  controller: emailContext,
                  hint: "E-mail",
                  icon: Icons.person,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Enter a email";
                    }
                  },
                ),
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
                      MaterialPageRoute(builder: (_) => Profile()),
                    );
                  },
                  child: Text(
                    " Save ",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}