import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/bloc/home_bloc_bloc.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';

Widget buildError(BuildContext context, String message) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const Icon(Icons.error_outline, size: 56, color: AppColors.red),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () =>
                context.read<HomeBlocBloc>().add(HomeLoadRequested()),
            child: const Text("try Again"),
          ),
        ],
      ),
    ),
  );
}
