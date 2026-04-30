import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/presentation/widget/container.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/data/model/fleet_cover_model.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/bloc/fleet_bloc.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/widget/field.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/widget/public_row.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/widget/serach_field.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/widget/text_field.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/widget/text.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/container.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/loading.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/snack_bar.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/strings/admin/fleet_strings.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class Public extends StatefulWidget {
  final String id;
  const Public({super.key, required this.id});

  @override
  State<Public> createState() => _PublicState();
}

class _PublicState extends State<Public> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return BlocListener<FleetBloc, FleetState>(
      listener: (context, state) {
        debugPrint('${state.getAllStatus}');
        if (state.activateStatus == FleetStatus.success ||
            state.deActivateStatus == FleetStatus.success ||
            state.deleteStatus == FleetStatus.success) {
          showSnackbar(
            context,
            'Success',
            const Color.fromARGB(255, 0, 148, 5),
          );
        } else if (state.activateStatus == FleetStatus.error ||
            state.deActivateStatus == FleetStatus.error ||
            state.deleteStatus == FleetStatus.error) {
          showSnackbar(context, '${state.error}', AppColors.red);
        }
      },
      child: Column(
        children: [
          fleetSearchField(w, h, context,widget.id),
          SizedBox(height: h(0.04)),
          overContainer(
            double.infinity,
            h(0.9),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FleetStrings.units,
                      style: GoogleFonts.poppins(
                        fontSize: w(0.017),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        fleetDropDown(w, h, context, widget.id),
                        SizedBox(width: w(0.008)),
                        GestureDetector(
                          onTap: () {
                            controller.repeat();
                            context.read<FleetBloc>().add(
                              GetAllFLeetEvent(widget.id),
                            );
                          },
                          child: Container(
                            width: w(0.04),
                            height: h(0.07),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 0,
                                color: const Color.fromARGB(255, 196, 196, 196),
                              ),
                            ),
                            child: Center(
                              child: AnimatedBuilder(
                                animation: controller,
                                builder: (context, child) {
                                  return Transform.rotate(
                                    angle: controller.value * 2 * 3.1416,
                                    child: child,
                                  );
                                },
                                child: Icon(Icons.refresh, size: w(0.02)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: h(0.07)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: w(0.13),
                      child: orgHead2(
                        'FLEET ID/NAME',
                        w(0.011),
                        const Color.fromARGB(255, 127, 127, 127),
                      ),
                    ),
                    SizedBox(
                      width: w(0.115),
                      child: orgHead2(
                        'LICENSE PLATE',
                        w(0.011),
                        const Color.fromARGB(255, 127, 127, 127),
                      ),
                    ),
                    SizedBox(
                      width: w(0.14),
                      child: orgHead2(
                        FleetStrings.load,
                        w(0.011),
                        const Color.fromARGB(255, 127, 127, 127),
                      ),
                    ),
                    SizedBox(
                      width: w(0.073),
                      child: orgHead2(
                        'CREATED AT',
                        w(0.011),
                        const Color.fromARGB(255, 127, 127, 127),
                      ),
                    ),
                    SizedBox(
                      width: w(0.08),
                      child: orgHead2(
                        FleetStrings.status,
                        w(0.011),
                        const Color.fromARGB(255, 127, 127, 127),
                      ),
                    ),
                    SizedBox(width: w(0.00)),
                    SizedBox(
                      width: w(0.043),
                      child: orgHead2(
                        FleetStrings.action,
                        w(0.011),
                        const Color.fromARGB(255, 127, 127, 127),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: BlocBuilder<FleetBloc, FleetState>(
                    builder: (context, state) {
                      debugPrint('${state.data}');
                      if (state.getAllStatus == FleetStatus.loading) {
                        return ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return CardShimmer();
                          },
                        );
                      } else if (state.getAllStatus == FleetStatus.error) {
                        controller.stop();
                        return Center(
                          child: Text(
                            '${state.error}',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      } else if (state.getAllStatus == FleetStatus.success) {
                        controller.stop();
                        if (state.data.isEmpty) {
                          return Center(
                            child: Text(
                              ' No vehicles available',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }

                        return ListView.builder(
                          itemCount: state.data.length,
                          itemBuilder: (context, index) {
                            final data = state.data[index];
                            // debugPrint('${}');
                            return publicRow(w, h, data);
                          },
                        );
                      } else {
                        controller.stop();
                        return SizedBox();
                      }
                    },
                  ),
                ),
              ],
            ),
            20,
            const Color.fromARGB(255, 229, 236, 239),
          ),
          SizedBox(height: h(0.05)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              overContainer(
                w(0.37),
                h(0.4),
                SizedBox(),
                w(0.12),
                AppColors.ltOrange,
              ),
              overContainer(
                w(0.37),
                h(0.4),
                SizedBox(),
                w(0.12),
                const Color.fromARGB(255, 0, 16, 50),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
