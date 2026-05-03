import 'package:flutter/material.dart';
import 'package:transit_track_flutter/apps/user_app/features/map/view/map.dart';
import 'package:transit_track_flutter/apps/user_app/features/root/presentation/widgets/action_item.dart';
import 'package:transit_track_flutter/apps/user_app/features/root/presentation/widgets/time_line_tile.dart';
import 'package:transit_track_flutter/apps/user_app/features/save/presentation/view/save.dart';
import 'package:transit_track_flutter/core/constants/text.dart';

class BusScreen extends StatelessWidget {
  const BusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("SRANGER", style: TextStyle(color: Colors.black)),
        centerTitle: false,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.directions_bus,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "STRANGER",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Vytila Hub → Aluva",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          "Limited",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  const Row(
                    children: [
                      Text(ConstText.currentstop),
                      Text(
                        "Palarivattam",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  Row(
                    children: [
                      const Text("Next Stop : "),
                      const Text(
                        "Idappally",
                        style: TextStyle(fontWeight: FontWeight.bold),
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
                        ConstText.oline,
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ActionItem(
                    icon: Icons.share,
                    label: "Shave",
                    function: () {},
                  ),
                  ActionItem(
                    icon: Icons.bookmark,
                    label: "Save Bus",
                    function: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (_) => SavedBusesPage()),
                      // );
                    },
                  ),
                  ActionItem(
                    icon: Icons.confirmation_num,
                    label: "Pay Ticket",
                    function: () {},
                  ),
                  ActionItem(
                    icon: Icons.map,
                    label: "Live Map",
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => LiveTrackingScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Route Time Line",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Column(
              children: const [
                TimelineTile("Vytila Bus Stand", "10:45 AM", false),
                TimelineTile("Ponnurunni", "10:52 AM", false),
                TimelineTile("Geethanjali", "11:06 AM", true),
                TimelineTile("Chakkaraparambu", "11:24 AM", true),
                TimelineTile("Puthiya Road", "11:38 AM", true),
                TimelineTile("Convent", "11:58 AM", true),
                TimelineTile("Malta", "12:17 PM", true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}






// // lib/features/routes/presentation/pages/route_detail_page.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:go_router/go_router.dart';
// import '../../../../core/constants/app_colors.dart';
// import '../../../../core/constants/app_strings.dart';
// import '../../../home/data/models/route_model.dart';
// import '../../../home/domain/entities/route_entity.dart';

// class RouteDetailPage extends StatelessWidget {
//   final String routeId;
//   const RouteDetailPage({super.key, required this.routeId});

//   @override
//   Widget build(BuildContext context) {
//     // Mock data - replace with BLoC in production
//     final route = RouteModel.mockRoutes
//         .firstWhere((r) => r.id == routeId, orElse: () => RouteModel.mockRoutes.first);
//     final stops = StopModel.mockStops;

//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: CustomScrollView(
//         slivers: [
//           // App bar
//           SliverAppBar(
//             backgroundColor: AppColors.primary,
//             foregroundColor: Colors.white,
//             expandedHeight: 180,
//             pinned: true,
//             leading: IconButton(
//               icon: const Icon(Icons.arrow_back_ios_new_rounded),
//               onPressed: () => context.pop(),
//             ),
//             flexibleSpace: FlexibleSpaceBar(
//               background: Container(
//                 decoration: const BoxDecoration(
//                   gradient: AppColors.primaryGradient,
//                 ),
//                 child: SafeArea(
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 56, 20, 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 4),
//                               decoration: BoxDecoration(
//                                 color: Colors.white.withOpacity(0.2),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: Text(
//                                 route.routeNumber,
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 13,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 4),
//                               decoration: BoxDecoration(
//                                 color: Colors.white.withOpacity(0.2),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: Text(
//                                 route.statusLabel,
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 13,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           route.name,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 26,
//                             fontWeight: FontWeight.w800,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           '${route.origin} → ${route.destination}',
//                           style: TextStyle(
//                             color: Colors.white.withOpacity(0.85),
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Info cards
//                   _buildInfoCards(context, route),
//                   const SizedBox(height: 24),

//                   // Track live button
//                   ElevatedButton.icon(
//                     onPressed: () => context.push('/tracking/${route.id}'),
//                     icon: const Icon(Icons.gps_fixed_rounded),
//                     label: const Text(AppStrings.liveTracking),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.primary,
//                     ),
//                   ).animate().fadeIn(delay: 200.ms).scale(
//                       delay: 200.ms, duration: 300.ms, curve: Curves.elasticOut),

//                   const SizedBox(height: 24),

//                   // Stops
//                   Text(
//                     AppStrings.stops,
//                     style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                           fontWeight: FontWeight.w700,
//                         ),
//                   ),
//                   const SizedBox(height: 16),
//                   ...stops.asMap().entries.map((entry) => _buildStopItem(
//                         context,
//                         entry.value,
//                         entry.key,
//                         entry.key == stops.length - 1,
//                       )),
//                   const SizedBox(height: 24),

//                   // Buy ticket
//                   Container(
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       gradient: AppColors.primaryGradient,
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'Book Your Seat',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                               const SizedBox(height: 4),
//                               Text(
//                                 '${route.availableSeats} seats available',
//                                 style: TextStyle(
//                                   color: Colors.white.withOpacity(0.85),
//                                   fontSize: 13,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Text(
//                               '₹${route.fare.toStringAsFixed(0)}',
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.w800,
//                               ),
//                             ),
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 16, vertical: 8),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: Text(
//                                 AppStrings.buyTicket,
//                                 style: TextStyle(
//                                   color: AppColors.primary,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 13,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2, end: 0, delay: 400.ms, duration: 400.ms),
//                   const SizedBox(height: 32),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoCards(BuildContext context, RouteEntity route) {
//     return Row(
//       children: [
//         _infoCard(context, Icons.access_time_outlined, 'Duration',
//             '${route.durationMinutes} min'),
//         const SizedBox(width: 12),
//         _infoCard(context, Icons.route_rounded, 'Distance', route.distanceKm),
//         const SizedBox(width: 12),
//         _infoCard(context, Icons.event_seat_outlined, 'Seats',
//             '${route.availableSeats}'),
//       ]
//           .asMap()
//           .entries
//           .map((e) =>
//               e.value.animate().fadeIn(delay: (e.key * 100).ms).scale(
//                     delay: (e.key * 100).ms,
//                     duration: 300.ms,
//                     curve: Curves.easeOut,
//                   ))
//           .toList(),
//     );
//   }

//   Widget _infoCard(
//       BuildContext context, IconData icon, String label, String value) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.all(14),
//         decoration: BoxDecoration(
//           color: AppColors.surface,
//           borderRadius: BorderRadius.circular(14),
//           border: Border.all(color: AppColors.border),
//         ),
//         child: Column(
//           children: [
//             Icon(icon, color: AppColors.primary, size: 22),
//             const SizedBox(height: 6),
//             Text(
//               value,
//               style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                     fontWeight: FontWeight.w700,
//                     color: AppColors.textPrimary,
//                   ),
//             ),
//             Text(label, style: Theme.of(context).textTheme.bodySmall),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildStopItem(
//       BuildContext context, StopEntity stop, int index, bool isLast) {
//     Color dotColor;
//     if (stop.isPassed) {
//       dotColor = AppColors.success;
//     } else if (stop.isCurrent) {
//       dotColor = AppColors.primary;
//     } else {
//       dotColor = AppColors.border;
//     }

//     return IntrinsicHeight(
//       child: Row(
//         children: [
//           // Timeline column
//           SizedBox(
//             width: 32,
//             child: Column(
//               children: [
//                 Container(
//                   width: 14,
//                   height: 14,
//                   decoration: BoxDecoration(
//                     color: dotColor,
//                     shape: BoxShape.circle,
//                     border: stop.isCurrent
//                         ? Border.all(color: AppColors.primary, width: 3)
//                         : null,
//                     boxShadow: stop.isCurrent
//                         ? [
//                             BoxShadow(
//                               color: AppColors.primary.withOpacity(0.3),
//                               blurRadius: 6,
//                             )
//                           ]
//                         : null,
//                   ),
//                 ),
//                 if (!isLast)
//                   Expanded(
//                     child: Container(
//                       width: 2,
//                       color: stop.isPassed
//                           ? AppColors.success.withOpacity(0.4)
//                           : AppColors.border,
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 12),
//           // Stop info
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(bottom: isLast ? 0 : 20),
//               child: Container(
//                 padding: const EdgeInsets.all(14),
//                 decoration: BoxDecoration(
//                   color: stop.isCurrent
//                       ? AppColors.primarySurface
//                       : AppColors.surface,
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(
//                     color:
//                         stop.isCurrent ? AppColors.primary : AppColors.border,
//                     width: stop.isCurrent ? 1.5 : 1,
//                   ),
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         stop.name,
//                         style: Theme.of(context)
//                             .textTheme
//                             .titleMedium
//                             ?.copyWith(
//                               fontWeight: stop.isCurrent
//                                   ? FontWeight.w700
//                                   : FontWeight.w500,
//                               color: stop.isCurrent
//                                   ? AppColors.primary
//                                   : stop.isPassed
//                                       ? AppColors.textSecondary
//                                       : AppColors.textPrimary,
//                             ),
//                       ),
//                     ),
//                     if (stop.arrivalTime != null)
//                       Text(
//                         stop.arrivalTime!,
//                         style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                               color: stop.isCurrent
//                                   ? AppColors.primary
//                                   : AppColors.textHint,
//                               fontWeight: FontWeight.w600,
//                             ),
//                       ),
//                     if (stop.isCurrent) ...[
//                       const SizedBox(width: 6),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 8, vertical: 2),
//                         decoration: BoxDecoration(
//                           color: AppColors.primary,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: const Text(
//                           'LIVE',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 10,
//                               fontWeight: FontWeight.w800),
//                         ),
//                       ),
//                     ],
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ).animate().fadeIn(delay: (index * 80).ms).slideX(
//             begin: 0.1,
//             end: 0,
//             delay: (index * 80).ms,
//             duration: 300.ms,
//           ),
//     );
//   }
// }
