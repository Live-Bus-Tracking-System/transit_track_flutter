import 'package:flutter/material.dart';

class TimelineTile extends StatelessWidget {
  final String title;
  final String time;
  final bool isActive;

  const TimelineTile(this.title, this.time, this.isActive, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: isActive ? Colors.orange : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 2,
                height: 50,
                color: Colors.orange,
              ),
            ],
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        color: isActive ? Colors.orange : Colors.black)),
                const SizedBox(height: 5),
              ],
            ),
          ),

          Text(time),
        ],
      ),
    );
  }
}