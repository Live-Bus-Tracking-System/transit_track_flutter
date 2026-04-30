import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/view/profile_screen.dart';
import 'package:transit_track_flutter/apps/bus_owners/menu.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/text.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          ConstText.transitTrack,
          style: TextStyle(color: AppTheme.color, fontWeight: FontWeight(20)),
        ),
        actions: [
          GestureDetector(
            child: CircleAvatar(backgroundColor: AppColors.bg),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
      drawer: Menu(h: h, w: w),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ConstText.dashboard,
                    style: TextStyle(
                      color: AppTheme.color,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: AppTheme.color,
                        height: 150,
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ConstText.active,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text("32/32"),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: AppTheme.color,
                        height: 150,
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ConstText.routes,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text("18"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Bus Live Location",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 500,
                    width: double.infinity,
                    color: AppColors.bg,
                    child: FlutterMap(
                      options: MapOptions(
                        initialCenter: LatLng(9.9312, 76.2673),
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://basemaps.cartocdn.com/light_all/{z}//{x}/{y}{r}.png",
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: LatLng(9.9312, 76.2673),
                              child: Icon(
                                Icons.location_pin,
                                color: AppTheme.color,
                                size: (0.3),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
