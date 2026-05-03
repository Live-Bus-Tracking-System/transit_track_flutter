import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/bloc/home_bloc_bloc.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/build_shimmer.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/error_handling.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/searchbar.dart';
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
              SliverToBoxAdapter(child: buildHeader(context)),
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
                        return buildSearchResults(state, context);
                      }
                      return buildContent(state, context);
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
}
