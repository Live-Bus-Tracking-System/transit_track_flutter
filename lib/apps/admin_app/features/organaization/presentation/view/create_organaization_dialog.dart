import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';

class CreateOrganaizationDialog extends StatefulWidget {
  const CreateOrganaizationDialog({super.key});

  @override
  State<CreateOrganaizationDialog> createState() =>
      _CreateOrganaizationDialogState();
}

class _CreateOrganaizationDialogState extends State<CreateOrganaizationDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 500,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 30,
              spreadRadius: 5,
              offset: Offset(0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
