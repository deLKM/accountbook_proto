import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodOptions extends ConsumerWidget {
  final String title;
  final List<Map<String, dynamic>> foodOptions;
  
  const FoodOptions({
    super.key,
    required this.title,
    required this.foodOptions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: foodOptions.map((option) {
            return Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(option['icon'], size: 40),
                ),
                Text(
                  option['label'],
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}