// // lib/features/profile/presentation/pages/saved_buses_page.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/error_handling.dart';
// import 'package:transit_track_flutter/apps/user_app/features/save/presentation/view/bloc/saved_bloc_bloc.dart';
// import 'package:transit_track_flutter/apps/user_app/features/save/presentation/widgets/build_error.dart';
// import 'package:transit_track_flutter/apps/user_app/features/save/presentation/widgets/router_cards.dart';
// import 'package:transit_track_flutter/core/constants/theme/theme.dart';

// class SavedBusesPage extends StatefulWidget {
//   const SavedBusesPage({super.key});

//   @override
//   State<SavedBusesPage> createState() => _SavedBusesPageState();
// }

// class _SavedBusesPageState extends State<SavedBusesPage> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<SavedBusesBloc>().add(SavedBusesLoadRequested());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppTheme.colors,
//       body: SafeArea(
//         child: BlocBuilder<SavedBusesBloc, SavedBusesState>(
//           builder: (context, state) {
//             if (state is SavedBusesLoading) return buildShimmer();
//             if (state is SavedBusesError)
//               return buildError(context, state.message);
//             if (state is SavedBusesLoaded) {
//               final savedRoutes = state.savedRoutes;
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Header
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
//                     child: Row(
//                       children: [
//                         Text(
//                           "saved Buses",
//                           style: Theme.of(context).textTheme.headlineLarge,
//                         ),
//                         const Spacer(),
//                         if (savedRoutes.isNotEmpty)
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 12,
//                               vertical: 6,
//                             ),
//                             decoration: BoxDecoration(
//                               color: AppTheme.colors,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Text(
//                               '${savedRoutes.length} buses',
//                               style: Theme.of(context).textTheme.bodySmall
//                                   ?.copyWith(
//                                     color: AppTheme.color,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                   // List
//                   Expanded(
//                     child: savedRoutes.isEmpty
//                         ? buildEmpty(context)
//                         : ListView.separated(
//                             padding: const EdgeInsets.symmetric(horizontal: 20),
//                             itemCount: savedRoutes.length,
//                             separatorBuilder: (_, __) =>
//                                 const SizedBox(height: 12),
//                             itemBuilder: (context, index) => RouterCards(
//                               route: savedRoutes[index],
//                               onTap: () => context.push(
//                                 '/route/${savedRoutes[index].id}',
//                               ),
//                               onFavoriteTap: () {
//                                 context.read<SavedBusesBloc>().add(
//                                   SavedBusesToggleRequested(
//                                     savedRoutes[index].id,
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                   ),
//                 ],
//               );
//             }
//             return SizedBox.shrink();
//           },
//         ),
//       ),
//     );
//   }
// }
