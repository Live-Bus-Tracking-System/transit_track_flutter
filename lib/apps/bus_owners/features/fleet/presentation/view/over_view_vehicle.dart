import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/model/vehicle_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/widget/detail_contain.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/widget/edit_delete_cont.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class OverViewVehicle extends StatefulWidget {
  final VehicleModel model;
  const OverViewVehicle({super.key, required this.model});

  @override
  State<OverViewVehicle> createState() => _OverViewVehicleState();
}

class _OverViewVehicleState extends State<OverViewVehicle> {
  bool isON = false;
  @override
  Widget build(BuildContext context) {
    final VehicleModel data = widget.model;
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          'Vehicle Deatails',
          style: GoogleFonts.poppins(
            fontSize: w(0.05),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(w(0.055)),
          child: ListView(
            children: [
              SizedBox(height: h(0.03)),
              detailCont(
                w,
                h(0.38),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      'DUTY FLEET',
                      style: GoogleFonts.inter(
                        fontSize: w(0.04),
                        fontWeight: FontWeight.w600,
                        color: AppTheme.color,
                      ),
                    ),
                    Text(
                      '${data.name}',
                      style: GoogleFonts.poppins(
                        fontSize: w(0.1),
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                    catyPltCard(w, h),
                    catyPltCard(w, h),
                    Divider(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: w(0.03),
                          backgroundColor: data.isACtive == true
                              ? const Color.fromARGB(255, 179, 228, 255)
                              : const Color.fromARGB(255, 255, 212, 209),
                          child: Center(
                            child: CircleAvatar(
                              radius: w(0.017),
                              backgroundColor: data.isACtive == true
                                  ? const Color.fromARGB(255, 0, 154, 237)
                                  : const Color.fromARGB(255, 224, 15, 0),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: w(0.2),
                          child: data.isACtive == true
                              ? Text(
                                  'ACTIVE',
                                  style: GoogleFonts.inter(
                                    fontSize: w(0.035),
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                )
                              : Text(
                                  'INACTIVE',
                                  style: GoogleFonts.inter(
                                    fontSize: w(0.035),
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                        ),
                        SizedBox(
                          width: w(0.2),
                          child: Text(
                            'IS ACTIVE',
                            style: GoogleFonts.inter(
                              fontSize: w(0.035),
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 115, 115, 115),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isON = !isON;
                            });
                          },
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 350),
                            transitionBuilder: (child, animation) {
                              return ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            },
                            child: Icon(
                              isON ? Icons.toggle_on : Icons.toggle_off,
                              key: ValueKey(isON),
                              color: isON ? AppTheme.color : Colors.grey,
                              size: w(0.1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: h(0.03)),
              detailCont(
                w,
                h(0.23),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.directions_bus,
                      color: AppColors.white,
                      size: w(0.1),
                    ),
                    Text(
                      'OPERATIONAL STATUS',
                      style: GoogleFonts.inter(
                        fontSize: w(0.033),
                        fontWeight: FontWeight.w700,
                        color: const Color.fromARGB(200, 255, 255, 255),
                      ),
                    ),
                    Text(
                      'IN TRANSIT',
                      style: GoogleFonts.poppins(
                        fontSize: w(0.06),
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                bg: AppTheme.color,
              ),
              SizedBox(height: h(0.03)),
              detailCont(
                w,
                h(0.23),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.navigation, color: AppTheme.color, size: w(0.1)),
                    Text(
                      'LIVE SPEED',
                      style: GoogleFonts.inter(
                        fontSize: w(0.033),
                        fontWeight: FontWeight.w700,
                        color: const Color.fromARGB(255, 157, 63, 0),
                      ),
                    ),
                    Text(
                      '64 KM/H',
                      style: GoogleFonts.poppins(
                        fontSize: w(0.065),
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                bg: AppColors.bg,
              ),
              SizedBox(height: h(0.03)),
              detailCont(
                w,
                h(0.4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SYSTEM IDENTIFIERS',
                      style: GoogleFonts.inter(
                        fontSize: w(0.033),
                        fontWeight: FontWeight.w700,
                        color: const Color.fromARGB(255, 157, 63, 0),
                      ),
                    ),
                    idCont(Icons.security, 'GUID ID', w, h, id: data.id!),
                    idCont(
                      Icons.business_outlined,
                      'ORGANIZATION ID',
                      w,
                      h,
                      id: data.orgId!,
                    ),
                    idCont(
                      Icons.track_changes,
                      'TRACKER ID',
                      w,
                      h,
                      id: data.trackerId!,
                    ),
                  ],
                ),
                bg: AppColors.bg,
              ),
              SizedBox(height: h(0.03)),
              editDeleteCont(w, h, data),
            ],
          ),
        ),
      ),
    );
  }
}
