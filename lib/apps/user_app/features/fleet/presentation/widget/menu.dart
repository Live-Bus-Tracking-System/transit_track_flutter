import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/user_app/features/fleet/data/model/route_stop_model.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/action.dart';

class ActionMenuCard extends StatelessWidget {
  const ActionMenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [BoxShadow(blurRadius: 20, color: Colors.black12)],
      ),

      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ActionItem(Icons.share_outlined, "Share"),
          ActionItem(Icons.bookmark_border, "Save Bus"),
          ActionItem(Icons.currency_rupee, "Pay Ticket"),
          ActionItem(Icons.location_on_outlined, "Live Map"),
        ],
      ),
    );
  }
}

class RouteTimeline extends StatelessWidget {
  final List<RouteStop> stops;

  const RouteTimeline({super.key, required this.stops});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Route Time Line",
            style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),

        const SizedBox(height: 20),

        ...List.generate(
          stops.length,
          (index) => TimelineItem(
            stop: stops[index],
            isLast: index == stops.length - 1,
          ),
        ),
      ],
    );
  }
}

class TimelineItem extends StatelessWidget {
  final RouteStop stop;
  final bool isLast;

  const TimelineItem({super.key, required this.stop, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final color = stop.current
        ? Colors.orange
        : stop.completed
        ? Colors.grey
        : Colors.orange;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30,
            child: Column(
              children: [
                Container(
                  width: stop.current ? 22 : 18,
                  height: stop.current ? 22 : 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: stop.current ? Colors.orange : Colors.white,
                    border: Border.all(color: color, width: 4),
                  ),
                ),

                if (!isLast) Expanded(child: Container(width: 3, color: color)),
              ],
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Text(
                stop.name,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: stop.current
                      ? Colors.orange
                      : stop.completed
                      ? Colors.grey
                      : Colors.black,
                ),
              ),
            ),
          ),

          Text(
            stop.time,
            style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
