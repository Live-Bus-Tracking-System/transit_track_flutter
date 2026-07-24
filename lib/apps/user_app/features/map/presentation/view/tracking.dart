import 'package:flutter/material.dart';
import 'package:transit_track_flutter/apps/user_app/features/map/presentation/view/bottom.dart';
import 'package:transit_track_flutter/apps/user_app/features/map/presentation/view/header.dart';

class LiveTrackingPage extends StatelessWidget {
  const LiveTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            const Header(),

            Expanded(
              child: Stack(
                children: [
                  /// MAP
                  Positioned.fill(
                    child: Image.network(
                      "https://tile.openstreetmap.org/12/2048/1363.png",
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// BOTTOM PANEL
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: BottomPanel(height: size.height * .42),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
