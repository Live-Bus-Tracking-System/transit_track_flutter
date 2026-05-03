import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transit_track_flutter/apps/user_app/features/details/presentation/view/details.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/bloc/home_bloc_bloc.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/searchbar.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class Rout extends StatefulWidget {
  const Rout({super.key});

  @override
  State<Rout> createState() => _RoutState();
}

class _RoutState extends State<Rout> {
  TextEditingController searchController = TextEditingController();

  List<Map<String, String>> busList = [
    {
      "name": "STRANGER",
      "number": "KL07C0312",
      "route": "Vytila Hub → Aluva",
      "next": "Idappally",
    },
    {
      "name": "CITY FAST",
      "number": "KL08A1234",
      "route": "Kakkanad → Kaloor",
      "next": "Edappally",
    },
  ];

  List<Map<String, String>> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = busList;
  }

  void searchBus(String value) {
    setState(() {
      filteredList = busList
          .where(
            (bus) =>
                bus["name"]!.toLowerCase().contains(value.toLowerCase()) ||
                bus["number"]!.toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rout")),

      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: TextField(
          //     controller: searchController,
          //     onChanged: searchBus,
          //     decoration: InputDecoration(
          //       hintText: "Search bus...",
          //       prefixIcon: const Icon(Icons.search),
          //       filled: true,
          //       fillColor: Colors.grey[200],
          //       contentPadding: const EdgeInsets.symmetric(vertical: 0),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(15),
          //         borderSide: BorderSide.none,
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SearchBarWidget(
                controller: searchController,
                onChanged: (query) =>
                    context.read<HomeBlocBloc>().add(HomeSearchChanged(query)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final bus = filteredList[index];

                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const BusScreen()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: AppTheme.color,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Icon(
                                  Icons.directions_bus,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(width: 10),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      bus["name"]!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(bus["number"]!),
                                    Text(
                                      bus["route"]!,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),

                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.bookmark,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 15),

                          Row(
                            children: [
                              const Text("Next Stop : "),
                              Text(
                                bus["next"]!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                "Online",
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



// // lib/features/routes/presentation/pages/search_page.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:go_router/go_router.dart';
// import 'package:shimmer/shimmer.dart';
// import '../../../../core/constants/app_colors.dart';
// import '../../../../core/constants/app_strings.dart';
// import '../../../home/presentation/bloc/home_bloc.dart';
// import '../bloc/search_bloc.dart';
// import '../../../home/presentation/widgets/route_card.dart';

// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   final _searchController = TextEditingController();

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Header
//             Padding(
//               padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       AppStrings.routes,
//                       style: Theme.of(context).textTheme.headlineLarge,
//                     ),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 14, vertical: 8),
//                     decoration: BoxDecoration(
//                       gradient: AppColors.primaryGradient,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         const Icon(Icons.filter_list_rounded,
//                             color: Colors.white, size: 16),
//                         const SizedBox(width: 6),
//                         Text(
//                           'Filter',
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodySmall
//                               ?.copyWith(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w700),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Search field
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: _buildSearchField(context),
//             ),
//             const SizedBox(height: 20),
//             // Results
//             Expanded(
//               child: BlocBuilder<SearchBloc, SearchState>(
//                 builder: (context, state) {
//                   if (state is SearchLoading) return _buildShimmer();
//                   if (state is SearchError) return _buildError(state.message);
                  
//                   if (state is SearchLoaded) {
//                     if (state.results.isEmpty) return _buildEmpty();
//                     return _buildResultsList(state.results);
//                   }

//                   // Initial state: show popular routes from HomeBloc if available
//                   return BlocBuilder<HomeBloc, HomeState>(
//                     builder: (context, homeState) {
//                       if (homeState is HomeLoaded) {
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//                               child: Text(
//                                 'Suggested Routes',
//                                 style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                             ),
//                             Expanded(child: _buildResultsList(homeState.popularRoutes)),
//                           ],
//                         );
//                       }
//                       return const SizedBox.shrink();
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSearchField(BuildContext context) {
//     return Container(
//       height: 52,
//       decoration: BoxDecoration(
//         color: AppColors.surface,
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(color: AppColors.border),
//       ),
//       child: TextField(
//         controller: _searchController,
//         onChanged: (query) =>
//             context.read<SearchBloc>().add(SearchQueryChanged(query)),
//         style: Theme.of(context).textTheme.bodyLarge,
//         decoration: const InputDecoration(
//           hintText: 'Search by route or stop...',
//           prefixIcon:
//               Icon(Icons.search_rounded, color: AppColors.textHint),
//           border: InputBorder.none,
//           enabledBorder: InputBorder.none,
//           focusedBorder: InputBorder.none,
//           contentPadding: EdgeInsets.symmetric(vertical: 14),
//         ),
//       ),
//     );
//   }

//   Widget _buildResultsList(List results) {
//     return ListView.separated(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       itemCount: results.length,
//       separatorBuilder: (_, __) => const SizedBox(height: 12),
//       itemBuilder: (context, index) => RouteCard(
//         route: results[index],
//         onTap: () =>
//             context.push('/route/${results[index].id}'),
//         onFavoriteTap: () {},
//       )
//           .animate()
//           .fadeIn(delay: (index * 80).ms)
//           .slideY(
//             begin: 0.1,
//             end: 0,
//             delay: (index * 80).ms,
//             duration: 300.ms,
//           ),
//     );
//   }

//   Widget _buildShimmer() {
//     return Shimmer.fromColors(
//       baseColor: AppColors.border,
//       highlightColor: AppColors.surface,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           children: List.generate(
//             4,
//             (i) => Container(
//               margin: const EdgeInsets.only(bottom: 12),
//               height: 130,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildError(String message) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(Icons.error_outline, size: 56, color: AppColors.error),
//           const SizedBox(height: 16),
//           Text(message,
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.bodyMedium),
//         ],
//       ),
//     );
//   }

//   Widget _buildEmpty() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(Icons.search_off_rounded,
//               size: 64, color: AppColors.textHint),
//           const SizedBox(height: 16),
//           Text('No routes found',
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyMedium
//                   ?.copyWith(color: AppColors.textHint)),
//         ],
//       ),
//     );
//   }
// }
