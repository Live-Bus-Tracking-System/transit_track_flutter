import 'package:flutter/material.dart';

class ActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback function; 

  const ActionItem({
    super.key,
    required this.icon,
    required this.label,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: function,
          icon: Icon(icon, color: Colors.black), 
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}