import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/bloc/organaization_bloc.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/view/create_organaization_dialog.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/widget/container.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/widget/text.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/container.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/sidebar.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/snack_bar.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/text.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/top_bar.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/strings/admin/organaization_strings.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class Organaization extends StatefulWidget {
  const Organaization({super.key});

  @override
  State<Organaization> createState() => _OrganaizationState();
}

class _OrganaizationState extends State<Organaization>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    context.read<OrganaizationBloc>().add(GetAllOrgEvent());
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
    final totalPartner = context.read<OrganaizationBloc>().state.data?.length;
    return BlocListener<OrganaizationBloc, OrganaizationState>(
      listener: (context, state) {
        debugPrint('${state.getStatus}');
        if (state.actStatus == OrgStatus.success ||
            state.supStatus == OrgStatus.success ||
            state.dlStatus == OrgStatus.success) {
          showSnackbar(
            context,
            'Success',
            const Color.fromARGB(255, 0, 148, 5),
          );
        } else if (state.actStatus == OrgStatus.error ||
            state.supStatus == OrgStatus.error ||
            state.dlStatus == OrgStatus.error) {
          showSnackbar(context, '${state.error}', AppColors.red);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.bg,
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
                                  head1(
                                    OrganaizationStrings.organaizationHead,
                                    w(0.034),
                                  ),
                                  head3(OrganaizationStrings.content, w(0.014)),
                                ],
                              ),
                            ),
                            SizedBox(width: w(0.05)),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  // barrierDismissible: false,
                                  builder: (context) {
                                    return BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 5,
                                        sigmaY: 5,
                                      ),
                                      child: CreateOrganaizationDialog(),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: w(0.19),
                                height: h(0.08),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppTheme.color,
                                      const Color.fromARGB(255, 255, 98, 50),
                                    ],
                                    begin: AlignmentGeometry.topLeft,
                                    end: AlignmentGeometry.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      size: 17,
                                      weight: 7,
                                      color: AppColors.white,
                                    ),
                                    Text(
                                      OrganaizationStrings.add,
                                      style: GoogleFonts.poppins(
                                        fontSize: w(0.012),
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: h(0.06)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(w(0.02)),
                              width: w(0.4),
                              height: h(0.28),
                              decoration: BoxDecoration(
                                color: AppColors.ltOrange,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(
                                      255,
                                      102,
                                      102,
                                      102,
                                    ).withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: orgHead2(
                                          OrganaizationStrings.partners,
                                          w(0.012),
                                          const Color.fromARGB(255, 87, 87, 87),
                                        ),
                                      ),
                                      SizedBox(
                                        child: orgHead1(
                                          '${totalPartner ?? 0}',
                                          w(0.035),
                                          AppTheme.color,
                                        ),
                                      ),
                                      Expanded(
                                        child: orgHead2(
                                          '12% growth this quater',
                                          w(0.012),
                                          const Color.fromARGB(255, 0, 65, 3),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Icon(
                                    Icons.business,
                                    size: w(0.07),
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      157,
                                      128,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            overContainer(
                              w(0.16),
                              h(0.28),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: orgHead2(
                                      OrganaizationStrings.fleet,
                                      w(0.012),
                                      const Color.fromARGB(255, 87, 87, 87),
                                    ),
                                  ),
                                  SizedBox(
                                    child: orgHead1(
                                      '1,284',
                                      w(0.035),
                                      Colors.black,
                                    ),
                                  ),

                                  Expanded(
                                    child: orgHead2(
                                      '12% ',
                                      w(0.012),
                                      const Color.fromARGB(255, 82, 82, 82),
                                    ),
                                  ),
                                ],
                              ),
                              w(0.02),
                            ),
                            overContainer(
                              w(0.16),
                              h(0.28),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: orgHead2(
                                      OrganaizationStrings.avg,
                                      w(0.012),
                                      const Color.fromARGB(255, 82, 82, 82),
                                    ),
                                  ),
                                  SizedBox(
                                    child: orgHead1(
                                      '94.4%',
                                      w(0.035),
                                      Color.fromARGB(255, 0, 11, 106),
                                    ),
                                  ),
                                  Expanded(
                                    child: orgHead2(
                                      'Target: 90%',
                                      w(0.012),
                                      const Color.fromARGB(255, 82, 82, 82),
                                    ),
                                  ),
                                ],
                              ),
                              w(0.02),
                            ),
                          ],
                        ),
                        SizedBox(height: h(0.04)),
                        orgTable(h, w, context, controller),
                        SizedBox(height: h(0.05)),

                        overContainer(
                          double.infinity,
                          h(0.55),
                          SizedBox(),
                          w(0.12),
                          const Color.fromARGB(255, 92, 92, 93),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
