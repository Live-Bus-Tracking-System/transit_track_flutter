import 'package:flutter/material.dart';

class HoverWidget extends StatefulWidget {
  final Widget child;

  const HoverWidget({super.key, required this.child});

  @override
  State<HoverWidget> createState() => _HoverWidgetState();
}

class _HoverWidgetState extends State<HoverWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic, // 🔥 smoother curve
        transform: isHover
            ? (Matrix4.identity()
                ..scale(1.06) // slightly bigger
                ..translate(0.0, -4.0)) // subtle lift effect
            : Matrix4.identity(),
      
        child: widget.child,
      ),
    );
  }
}
