import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/bloc/home_bloc_bloc.dart';
import 'package:transit_track_flutter/apps/user_app/features/save/presentation/widgets/router_cards.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

Widget buildShimmer() {
  return Shimmer.fromColors(
    baseColor: AppColors.black,
    highlightColor: AppColors.black,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: List.generate(
          3,
          (i) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buildSearchResults(HomeLoaded state, BuildContext context) {
  if (state.isSearching) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: CircularProgressIndicator(color: AppTheme.color),
      ),
    );
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          '${state.searchResults.length} routes found',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      const SizedBox(height: 12),
      ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: state.searchResults.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) => RouterCards(
          route: state.searchResults[index],
          onTap: () => context.push('/route/${state.searchResults[index].id}'),
          onFavoriteTap: () {},
        ),
      ),
      const SizedBox(height: 24),
    ],
  );
}
