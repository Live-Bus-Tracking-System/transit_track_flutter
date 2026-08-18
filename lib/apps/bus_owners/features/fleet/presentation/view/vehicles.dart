import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/bloc/vehicle_bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/widget/bus_card.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/widget/search_field.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/widget/shimmer.dart';
import 'package:transit_track_flutter/apps/bus_owners/menu.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/containers.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/shimmer.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class VehiclesPage extends StatefulWidget {
  const VehiclesPage({super.key});

  @override
  State<VehiclesPage> createState() => _VehiclesPageState();
}

class _VehiclesPageState extends State<VehiclesPage> {
  int count = 0;
  @override
  void initState() {
    context.read<VehicleBloc>().add(GetAllFleetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController serchC = TextEditingController();
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.ThemeDasrkWhite(context),
        title: Text(
          'Vehicles',
          style: GoogleFonts.poppins(
            fontSize: w(0.05),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Menu(h: h, w: w),
      body: SafeArea(
        child: BlocListener<VehicleBloc, VehicleState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          child: ListView(
            padding: EdgeInsets.all(w(0.052)),
            children: [
              SizedBox(height: h(0.01)),
              Text(
                'OERATIONAL INTELLIENCE',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: w(0.05),
                  color: AppTheme.color,
                ),
              ),
              SizedBox(height: h(0.01)),
              Text(
                'Active Assets',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: w(0.08),
                ),
              ),
              SizedBox(height: h(0.01)),
              SizedBox(
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        count.toString(),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: w(0.09),
                        ),
                      ),
                      Text(
                        'Total Fleets',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: w(0.04),
                          color: const Color.fromARGB(255, 96, 29, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: h(0.03)),
              searchField(w, h,context, serchC),
              SizedBox(height: h(0.03)),
              BlocBuilder<VehicleBloc, VehicleState>(
                builder: (context, state) {
                  print('${state.getAllStatus}');
                  if (state.getAllStatus == VehicleStatus.loading) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsetsGeometry.only(bottom: w(0.04)),
                          child: shimmerBox(
                            width: double.infinity,
                            height: h(0.17),
                          ),
                        );
                      },
                    );
                  } else if (state.getAllStatus == VehicleStatus.error) {
                    return Center(
                      child: Text(
                        '${state.error}',
                        style: GoogleFonts.inter(
                          fontSize: w(0.04),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  } else if (state.getAllStatus == VehicleStatus.success) {
                    final datas = state.datas;
                    count = state.datas!.length;
                    if (datas!.isEmpty) {
                      return Center(
                        child: Text(
                          'No vehicles',
                          style: GoogleFonts.inter(
                            fontSize: w(0.04),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: datas.length,
                      itemBuilder: (context, index) {
                        final model = datas[index];
                        return busCard(w, h, model,context);
                      },
                    );
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
