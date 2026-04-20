import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/bloc/organaization_bloc.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/widget/rows.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/widget/text.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/widget/text_field.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/container.dart';
import 'package:transit_track_flutter/core/constants/strings/organaization_strings.dart';

Widget orgTable(
  double Function(double) h,
  double Function(double) w,
  BuildContext context,
) {
  return overContainer(
    double.infinity,
    h(0.9),
    Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            orgTextField(w, h),
            orgDropDown(w, h),
            GestureDetector(
              onTap: () {
                context.read<OrganaizationBloc>().add(GetAllOrgEvent());
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
                child: Center(child: Icon(Icons.refresh, size: w(0.02))),
              ),
            ),
          ],
        ),
        SizedBox(height: h(0.07)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 240,
              child: orgHead2(
                OrganaizationStrings.organaization,
                w(0.011),
                const Color.fromARGB(255, 127, 127, 127),
              ),
            ),
            SizedBox(
              width: 240,
              child: orgHead2(
                OrganaizationStrings.contact,
                w(0.011),
                const Color.fromARGB(255, 127, 127, 127),
              ),
            ),
            SizedBox(
              width: 100,
              child: orgHead2(
                OrganaizationStrings.fleet,
                w(0.011),
                const Color.fromARGB(255, 127, 127, 127),
              ),
            ),
            SizedBox(
              width: 100,
              child: orgHead2(
                OrganaizationStrings.status,
                w(0.011),
                const Color.fromARGB(255, 127, 127, 127),
              ),
            ),
            SizedBox(
              child: orgHead2(
                OrganaizationStrings.action,
                w(0.011),
                const Color.fromARGB(255, 127, 127, 127),
              ),
            ),
          ],
        ),
        SizedBox(height: h(0.07)),
        Expanded(
          child: BlocBuilder<OrganaizationBloc, OrganaizationState>(
            builder: (context, state) {
              debugPrint('${state.data}');
              if (state.status == OrgStatus.loading) {
                return Center(child: CircularProgressIndicator());
              } else if (state.status == OrgStatus.error) {
                return Center(child: Text('${state.error}'));
              } else if (state.status == OrgStatus.success) {
                if (state.data!.isEmpty) {
                  return Center(child: Text(' no data'));
                }

                return ListView.builder(
                  itemCount: state.data?.length,
                  itemBuilder: (context, index) {
                    final data = state.data![index];
                    return orgRow(data, w, h);
                  },
                );
              } else {
                return SizedBox();
              }

              // return ListView(
              //   children: [
              //     orgRow(w, h),
              //     SizedBox(height: h(0.05)),
              //     orgRow(w, h),
              //     SizedBox(height: h(0.05)),
              //     orgRow(w, h),
              //     SizedBox(height: h(0.05)),
              //     orgRow(w, h),
              //   ],
              // );
            },
          ),
        ),
      ],
    ),
    20,
  );
}
