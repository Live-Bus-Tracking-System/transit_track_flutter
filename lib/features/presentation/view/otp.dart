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
            spacing: 20,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("We just sent an SMS"),
              Text("Enter the security code we sent to"),
              Text(number!),
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
              SizedBox(height: 30),
              SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                  String otp = controllers
                      .map((e) => e.text)
                      .join();

                  print("OTP: $otp");
                },
                child: const Text(
                  "Verify",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Column(
              children: const [
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
