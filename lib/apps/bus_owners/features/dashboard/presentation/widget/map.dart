import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:transit_track_flutter/core/constants/strings/urls.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

Widget dshMap(
  double Function(double) w,
  double Function(double) h,
  BuildContext context,
) {
  LatLng center = LatLng(10.8505, 76.2711);
  final MapController controller = MapController();
  return Container(
    width: double.infinity,
    height: h(0.55),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 215, 215, 215),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: w(0.08),
            vertical: h(0.03),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(radius: w(0.02), backgroundColor: AppTheme.color),
              Text(
                'LIVE FLEET OPERATION',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: w(0.05),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.05),
                  ),
                  child: FlutterMap(
                    mapController: controller,
                    options: MapOptions(initialCenter: center, initialZoom: 13),
                    children: [
                      TileLayer(
                        urlTemplate: Urls.mapUrlDark,
                        retinaMode: RetinaMode.isHighDensity(context),
                        subdomains: const ['a', 'b', 'c', 'd'],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                    255,
                    22,
                    150,
                    255,
                  ).withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: Column(
                  children: [
                    FloatingActionButton(
                      backgroundColor: const Color.fromARGB(255, 228, 228, 228),
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
                      child: const Icon(Icons.remove, color: AppColors.black),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 150,
                right: 20,
                child: FloatingActionButton(
                  backgroundColor: const Color.fromARGB(255, 224, 224, 224),
                  heroTag: 'location',
                  onPressed: () {
                    controller.move(center, 15);
                  },
                  child: Icon(
                    Icons.my_location,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 25,
                child: Align(
                  alignment: AlignmentGeometry.center,
                  child: Container(
                    width: w(0.75),
                    height: h(0.08),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(185, 230, 230, 230),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
