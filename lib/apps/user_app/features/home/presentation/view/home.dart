import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/bloc/home_bloc_bloc.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/build_shimmer.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/error_handling.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/route_card.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/searchbar.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/section_header.dart';
import 'package:transit_track_flutter/apps/user_app/features/save/presentation/widgets/build_error.dart'
    hide buildShimmer;
import 'package:transit_track_flutter/apps/user_app/features/save/presentation/widgets/router_cards.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<HomeBlocBloc>().add(HomeLoadRequested());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors,
      body: SafeArea(
        child: RefreshIndicator(
          color: AppTheme.color,
          onRefresh: () async {
            context.read<HomeBlocBloc>().add(HomeRefreshRequested());
          },
          child: CustomScrollView(
            slivers: [
              // App bar
              SliverToBoxAdapter(child: _buildHeader()),
              // Search
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SearchBarWidget(
                    controller: _searchController,
                    onChanged: (query) => context.read<HomeBlocBloc>().add(
                      HomeSearchChanged(query),
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              // Content
              SliverToBoxAdapter(
                child: BlocBuilder<HomeBlocBloc, HomeBlocState>(
                  builder: (context, state) {
                    if (state is HomeLoading) return buildShimmer();
                    if (state is HomeError)
                      return buildError(context, state.message);
                    if (state is HomeLoaded) {
                      if (state.searchQuery.isNotEmpty) {
                        return _buildSearchResults(state, context);
                      }
                      return _buildContent(state, context);
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Morning! 👋',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  "app Name",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: AppColors.black,
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
                      color: AppTheme.colors,
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
}

Widget _buildContent(HomeLoaded state, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Recently Viewed
      if (state.recentRoutes.isNotEmpty) ...[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionHeader(
            title: "recently Viewed",
            onSeeAll: () => context.push('/recent'),
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
              onTap: () =>
                  context.push('/route/${state.recentRoutes[index].id}'),
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

Widget _buildSearchResults(HomeLoaded state, BuildContext context) {
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
