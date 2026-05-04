import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/features/route/presentation/widget/text_field.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/sidebar.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/top_bar.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';

class CreateRoute extends StatefulWidget {
  const CreateRoute({super.key});

  @override
  State<CreateRoute> createState() => _CreateRouteState();
}

class _CreateRouteState extends State<CreateRoute> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 228, 228, 228),
        title: Text('Create route'),
      ),
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Container(decoration: BoxDecoration(color: Colors.grey)),
          ),
          Container(
            width: w(0.3),
            decoration: BoxDecoration(color: AppColors.white),
            child: Padding(
              padding: EdgeInsets.all(w(0.03)),
              child: Column(
                spacing: h(0.02),
                children: [
                  routeNameField(
                    'ROUTE NUMBER',
                    'hint',
                    Icons.abc,
                    w,
                    h,
                    TextEditingController(),
                  ),
                  Container(
                    width: double.infinity,
                    height: h(0.09),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 235, 235, 235),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.public),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(),
                            Text(
                              'Service Type',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                            Text(
                              'Public Access Route',
                              style: GoogleFonts.inter(
                                color: Colors.grey,
                                fontSize: w(0.008),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(),
                          ],
                        ),
                        SizedBox(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.offline_bolt),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
