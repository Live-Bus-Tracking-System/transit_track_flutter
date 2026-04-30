import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/place_dtls_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/presentation/bloc/route_bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/presentation/widget/details_card.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/containers.dart';
import 'package:transit_track_flutter/core/constants/strings/urls.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class WayPoint extends StatefulWidget {
  const WayPoint({super.key});

  @override
  State<WayPoint> createState() => _WayPointState();
}

class _WayPointState extends State<WayPoint> {
  final MapController controller = MapController();
  @override
  Widget build(BuildContext context) {
    final state = context.read<RouteBloc>().state;
    LatLng center = LatLng(10.8505, 76.2711);
    final size = MediaQuery.of(context).size;

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
      body: SafeArea(
        child: Stack(
          children: [
            FlutterMap(
              mapController: controller,
              options: MapOptions(
                initialCenter: LatLng(state.location!.lat, state.location!.lon),
                initialZoom: 13,
                onLongPress: (p, l) {
                  context.read<RouteBloc>().add(
                    SelectLocationDtlsEvent(ltn: l.latitude, lng: l.longitude),
                  );
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: Urls.flutterMapUrl,
                  retinaMode: RetinaMode.isHighDensity(context),
                  subdomains: const ['a', 'b', 'c', 'd'],
                ),
                BlocBuilder<RouteBloc, RouteState>(
                  builder: (context, state) {
                    if (state.sltStopSts == RouteStatus.success) {
                      return MarkerLayer(
                        markers: state.listOfStops.map((stop) {
                          return Marker(
                            point: LatLng(stop.lat!, stop.lon!),
                            width: 60,
                            height: 60,
                            child: Icon(
                              Icons.directions_bus,
                              color: AppTheme.color,
                              size: w(0.12),
                            ),
                          );
                        }).toList(),
                      );
                    }
                    return SizedBox();
                  },
                ),
                BlocBuilder<RouteBloc, RouteState>(
                  builder: (context, state) {
                    if (state.sltStopSts == RouteStatus.success) {
                      final points = state.coordinates
                          ?.map((m) => LatLng(m.lat, m.lon))
                          .toList();
                      return PolylineLayer(
                        polylines: [
                          Polyline(
                            points: points!,
                            strokeWidth: 4,
                            color: AppTheme.color,
                          ),
                        ],
                      );
                    }
                    return SizedBox();
                  },
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
                      controller.move(
                        LatLng(state.location!.lat, state.location!.lon),
                        zoom,
                      );
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
                      controller.move(
                        LatLng(state.location!.lat, state.location!.lon),
                        zoom,
                      );
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
                  controller.move(
                    LatLng(state.location!.lat, state.location!.lon),
                    15,
                  );
                },
                child: Icon(Icons.my_location, color: AppColors.white),
              ),
            ),
        
            BlocBuilder<RouteBloc, RouteState>(
              builder: (context, state) {
                if (state.sltStopSts == RouteStatus.success) {
                  return detailsCard(w, h, state.stopData!, context);
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
