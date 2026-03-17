import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          SizedBox(height: 70),
          Image.asset('assets/buss.jpg', width: 300),
          Container(
            width: double.infinity,
            height: 431.7,
            decoration: BoxDecoration(
              // color: Colors.black,
              border: Border.all(
                width: 2,
                color: const Color.fromARGB(255, 218, 218, 218),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 255, 123, 0),
                  radius: 40,
                  child: Center(
                    child: Image.asset(
                      'assets/bus-removebg-preview.png',
                      width: 50,
                    ),
                  ),
                ),
                Text(
                  'Your Commute,',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Simplified.',
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 255, 123, 0),
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text('Real-time bus tracking and smart trip'),
                Text('planning for your daily urban'),
                Text('adventures.'),

                Container(width: 200,height: 50,decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 123, 0),
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
