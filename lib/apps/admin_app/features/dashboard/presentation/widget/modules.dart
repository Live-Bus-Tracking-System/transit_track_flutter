import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/presentation/bloc/admin_dsh_bloc.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/presentation/widget/container.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/hover.dart';
import 'package:transit_track_flutter/core/constants/strings/admin/dashboard_strings.dart';

Widget modulesCard(double Function(double) h, double Function(double) w,BuildContext context) {
  final state=context.read<AdminDshBloc>().state;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      HoverWidget(
        child: dshContainer(
          w,
          h,
          Icon(
            Icons.directions_bus,
            color: const Color.fromARGB(255, 255, 17, 0),
            size: w(0.025),
          ),
          const Color.fromARGB(255, 255, 224, 223),
          DashboardStrings.buses,
          state.data==null?0:state.data!.buses!,
        ),
      ),
      HoverWidget(
        child: dshContainer(
          w,
          h,
          Icon(
            Icons.route,
            color: const Color.fromARGB(255, 0, 34, 255),
            size: w(0.025),
          ),
          const Color.fromARGB(255, 222, 228, 255),
          DashboardStrings.routes,
          state.data==null?0:state.data!.routes!,
        ),
      ),
      HoverWidget(
        child: dshContainer(
          w,
          h,
          Icon(
            Icons.business,
            color: const Color.fromARGB(255, 204, 0, 255),
            size: w(0.025),
          ),
          const Color.fromARGB(255, 247, 221, 255),
          'Total organaizations',
          state.data==null?0:state.data!.organaizations!,
        ),
      ),
      HoverWidget(
        child: dshContainer(
          w,
          h,
          Icon(Icons.person, color: const Color.fromARGB(255, 121, 121, 121), size: w(0.025)),
          const Color.fromARGB(255, 231, 231, 231),
          'Total Users',
          state.data==null?0:state.data!.users!,
        ),
      ),
      HoverWidget(
        child: dshContainer(
          w,
          h,
          Icon(Icons.verified_user, color: const Color.fromARGB(255, 0, 149, 151), size: w(0.025)),
          const Color.fromARGB(255, 209, 252, 255),
          'Total permits',
          state.data==null?0:state.data!.buses!,
        ),
      ),
    ],
  );
}
