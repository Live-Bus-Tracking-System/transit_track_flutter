import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:transit_track_flutter/apps/admin_app/features/route/presentation/widget/text_field.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/sidebar.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/top_bar.dart';
import 'package:transit_track_flutter/core/constants/strings/urls.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class CreateRoute extends StatefulWidget {
  const CreateRoute({super.key});

  @override
  State<CreateRoute> createState() => _CreateRouteState();
}

class _CreateRouteState extends State<CreateRoute> {
  final MapController controller = MapController();
  @override
  Widget build(BuildContext context) {
    LatLng center = LatLng(10.8505, 76.2711);
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 228, 228, 228),
        title: Text(
          'Create route',
          style: GoogleFonts.poppins(
            fontSize: w(0.015),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Container(
              child: Stack(
                children: [
                  FlutterMap(
                    mapController: controller,
                    options: MapOptions(initialCenter: center, initialZoom: 13),
                    children: [
                      TileLayer(
                        urlTemplate: Urls.flutterMapUrl,
                        retinaMode: RetinaMode.isHighDensity(context),
                        subdomains: const ['a', 'b', 'c', 'd'],
                      ),
                    ],
                  ),
                  Container(color: const Color.fromARGB(64, 222, 227, 229)),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Column(
                      children: [
                        FloatingActionButton(
                          backgroundColor: AppColors.white,
                          heroTag: "zoomIn",
                          mini: true,
                          onPressed: () {
                            final zoom = controller.camera.zoom + 1;
                            controller.move(center, zoom);
                          },
                          child: const Icon(Icons.add, color: AppColors.black),
                        ),
                        const SizedBox(height: 10),
                        FloatingActionButton(
                          backgroundColor: AppColors.white,
                          heroTag: "zoomOut",
                          mini: true,
                          onPressed: () {
                            final zoom = controller.camera.zoom - 1;
                            controller.move(center, zoom);
                          },
                          child: const Icon(
                            Icons.remove,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 150,
                    right: 20,
                    child: FloatingActionButton(
                      backgroundColor: AppTheme.color,
                      heroTag: 'location',
                      onPressed: () {
                        controller.move(center, 15);
                      },
                      child: Icon(Icons.my_location, color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: w(0.3),
            decoration: BoxDecoration(color: AppColors.white),
            child: Padding(
              padding: EdgeInsets.all(w(0.02)),
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
                        Icon(
                          Icons.public,
                          color: AppTheme.color,
                          size: w(0.02),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        SizedBox(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.toggle_on,
                            color: AppTheme.color,
                            size: w(0.03),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'STOP & SEQUENCE',
                        style: GoogleFonts.poppins(
                          fontSize: w(0.01),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '3 SELECTED',
                        style: GoogleFonts.poppins(
                          fontSize: w(0.01),
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 32, 125, 35),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: h(0.11),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 235, 235, 235),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: ListTile(
                        leading: Container(
                          width: w(0.03),
                          height: h(0.06),
                          decoration: BoxDecoration(
                            color: AppTheme.color,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              '01',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: w(0.011),
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          'Central Station',
                          style: GoogleFonts.poppins(
                            fontSize: w(0.01),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          'harber',
                          style: GoogleFonts.inter(
                            fontSize: w(0.009),
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 113, 113, 113),
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.close, size: w(0.01)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    width: double.infinity,
                    height: h(0.08),
                    decoration: BoxDecoration(
                      color: AppTheme.color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Create Route',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: w(0.015),
                          color: AppColors.white,
                        ),
                      ),
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
