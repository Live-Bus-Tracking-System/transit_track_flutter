import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/bloc/home_bloc_bloc.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/route_card.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/section_header.dart';
import 'package:transit_track_flutter/apps/user_app/features/save/presentation/widgets/router_cards.dart';
import 'package:transit_track_flutter/core/constants/text.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

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

Widget buildHeader(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                ConstText.transitTrack,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppTheme.color,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        // Notification bell
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.bg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.black),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Icon(
                Icons.notifications_outlined,
                color: AppColors.black,
                size: 22,
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppTheme.color,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildContent(HomeLoaded state, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Recently Viewed
      if (state.recentRoutes.isNotEmpty) ...[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionHeader(
            title: "recently Viewed",
            // onSeeAll: () => context.push('/recent'),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: state.recentRoutes.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) => RecentRouteChip(
              route: state.recentRoutes[index],
              onTap: () {},
              // context.push('/route/${state.recentRoutes[index].id}'),
            ),
          ),
        ),
        const SizedBox(height: 28),
      ],

      // Popular Routes
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SectionHeader(
          title: "popular Routes",
          onSeeAll: () => context.push("/search"),
        ),
      ),
      const SizedBox(height: 12),
      ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: state.popularRoutes.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) => RouterCards(
          route: state.popularRoutes[index],
          onTap: () => context.push('/route/${state.popularRoutes[index].id}'),
          onFavoriteTap: () => context.read<HomeBlocBloc>().add(
            HomeSaveBusToggled(
              busId: state.popularRoutes[index].id,
              isSaving: !state.popularRoutes[index].isFavorite,
            ),
          ),
        ),
      ),
      const SizedBox(height: 24),
    ],
  );
}
