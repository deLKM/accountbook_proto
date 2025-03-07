// Author: Ching-Yu

import 'package:flutter/material.dart';

class StatItem extends StatelessWidget {
  const StatItem({
    super.key,
    required this.label,
    required this.labelColor,
    required this.value,
    required this.color,
  });

  final String label;
  final Color labelColor;
  final double value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.attach_money,
                color: Colors.amber,
                size: 20,
              ),
              const SizedBox(width: 0),
                Text(
                  label,
                  style: TextStyle(
                    color: labelColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const SizedBox(width: 20),
              Text(
                value.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
