import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Container(
      width: double.infinity,
      height: h(0.12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 230, 230),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'TransitTrack Architect',
              style: GoogleFonts.poppins(
                fontSize: w(0.015),
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              height: h(0.09),
              width: w(0.27),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 205, 205, 205),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'search system...',

                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: w(0.043)),
       
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_active, size: w(0.021)),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings, size: w(0.021)),
            ),
            CircleAvatar(backgroundColor: Colors.black,radius: w(0.015),),
                 Text('Admin User',style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w600),),
          ],
        ),
      ),
    );
  }
}
