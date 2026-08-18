// lib/features/profile/presentation/pages/saved_buses_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/error_handling.dart';
import 'package:transit_track_flutter/apps/user_app/features/save/presentation/widgets/build_error.dart';
import 'package:transit_track_flutter/apps/user_app/features/save/presentation/widgets/router_cards.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class SavedBusesPage extends StatefulWidget {
  const SavedBusesPage({super.key});

  @override
  State<SavedBusesPage> createState() => _SavedBusesPageState();
}

class _SavedBusesPageState extends State<SavedBusesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
              child: Row(
                children: [
                  Text(
                    "saved Buses",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const Spacer(),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.colors,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      ' buses',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.color,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // List
          ],
        ),
      ),
    );
  }
}
