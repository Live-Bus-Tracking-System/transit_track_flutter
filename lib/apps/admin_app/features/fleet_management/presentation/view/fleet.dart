import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/bloc/fleet_bloc.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/widget/public.dart';

import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/widget/switch.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/data/model/organaization_model.dart';

import 'package:transit_track_flutter/apps/admin_app/widget/sidebar.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/text.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/top_bar.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/strings/fleet_strings.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class Fleet extends StatefulWidget {
  final OrganaizationModel data;
  const Fleet({super.key, required this.data});

  @override
  State<Fleet> createState() => _FleetState();
}

class _FleetState extends State<Fleet> {
  bool check = true;
  @override
  void initState() {
    context.read<FleetBloc>().add(GetAllFLeetEvent(widget.data.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Column(
              children: [
                TopBar(),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(25),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        context.pop();
                                      },
                                      icon: Icon(Icons.arrow_back),
                                    ),
                                    SizedBox(width: w(0.02)),
                                    head3(
                                      FleetStrings.orgBack,
                                      w(0.014),
                                      AppTheme.color,
                                    ),
                                  ],
                                ),
                                SizedBox(height: h(0.02)),
                                Row(
                                  children: [
                                    head3('ORGANAIZATIONS', w(0.014)),
                                    SizedBox(width: w(0.02)),
                                    Icon(Icons.arrow_forward),
                                    SizedBox(width: w(0.02)),
                                    head3(
                                      '${widget.data.name?.toUpperCase()}',
                                      w(0.014),
                                      AppTheme.color,
                                    ),
                                  ],
                                ),
                                head1('${widget.data.name}', w(0.034)),
                                head3(FleetStrings.content, w(0.014)),
                              ],
                            ),
                          ),
                          SizedBox(width: w(0.05)),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                check = !check;
                                debugPrint('tap tap');
                              });
                            },
                            child: SwitchFleet(check: check),
                          ),
                        ],
                      ),
                      SizedBox(height: h(0.06)),

                      Public(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
