import 'dart:developer';

import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final String? number = "8547942673";
  final List<TextEditingController> controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OTP Verify")),
      body: ListView(
        children: [
          Column(
            spacing: 10,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("We just sent an SMS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text("Enter the security code we sent to"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(number!),
                  IconButton(onPressed: (){}, icon: Icon(Icons.edit))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 45,
                    child: TextField(
                      controller: controllers[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,

                      decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                      onChanged: (value) {
                        if (value.isNotEmpty && index < 5) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
              SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                ),
                onPressed: () {
                  String otp = controllers
                      .map((e) => e.text)
                      .join();

                  log("OTP: $otp");
                },
                child: Text(
                  "Verify",
                  style: TextStyle(fontSize: 18,color: Colors.white),
                ),
              ),
            ),
            Column(
              children: [
                Text("Didn’t receive code?"),
                SizedBox(height: 5),
                Text(
                  "Resend - 00:05",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            )
            ],
          ),
        ],
      ),
    );
  }
}
