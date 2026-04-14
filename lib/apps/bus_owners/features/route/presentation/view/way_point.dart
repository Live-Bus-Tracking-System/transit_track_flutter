import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/place_dtls_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/presentation/bloc/route_bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/presentation/widget/details_card.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/containers.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class WayPoint extends StatefulWidget {
  const WayPoint({super.key});

  @override
  State<WayPoint> createState() => _WayPointState();
}

class _WayPointState extends State<WayPoint> {
  PlaceDtlsModel? model;
  @override
  Widget build(BuildContext context) {
    final MapController controller = MapController();
    LatLng center = LatLng(10.8505, 76.2711);
    final size = MediaQuery.of(context).size;
    final dark =
        'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png';
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          'Way Point',
          style: GoogleFonts.poppins(
            fontSize: w(0.05),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: controller,
            options: MapOptions(
              initialCenter: center,
              initialZoom: 13,
              onLongPress: (p, l) {
                context.read<RouteBloc>().add(
                  GetPlaceDetailsEvent(ltn: l.latitude, lng: l.longitude),
                );
              },
            ),
            children: [
              TileLayer(
                urlTemplate: dark,
                subdomains: const ['a', 'b', 'c', 'd'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: center,
                    width: 60,
                    height: 60,
                    child: Icon(
                      Icons.location_on,
                      color: AppTheme.color,
                      size: w(0.12),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
                  child: const Icon(Icons.remove, color: AppColors.black),
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

          BlocBuilder<RouteBloc, RouteState>(
            builder: (context, state) {
              if (state is RouteSuccess) {
                return detailsCard(w, h, state.model, center);
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
