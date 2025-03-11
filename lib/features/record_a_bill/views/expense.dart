// Author: Ching-Yu

import 'package:flutter/material.dart';
import '../widgets/food_options.dart';

class ExpenseTab extends StatelessWidget {
  const ExpenseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FoodOptions(
            title: 'Basic',
            foodOptions: [
              {'icon': Icons.breakfast_dining, 'label': 'Breakfast'},
              {'icon': Icons.lunch_dining, 'label': 'Lunch'},
              {'icon': Icons.dinner_dining, 'label': 'Dinner'},
              {'icon': Icons.food_bank, 'label': 'Snacks'},
            ],
          ),
          const Divider(),
          FoodOptions(
            title: 'Transport',
            foodOptions: [
              {'icon': Icons.local_taxi, 'label': 'Taxi'},
              {'icon': Icons.subway, 'label': 'Subway'},
              {'icon': Icons.bus_alert_outlined, 'label': 'Bus'},
              {'icon': Icons.emoji_transportation, 'label': 'Others'},
            ],
          ),
          const Divider(),
          FoodOptions(
            title: 'Transport',
            foodOptions: [
              {'icon': Icons.local_taxi, 'label': 'Taxi'},
              {'icon': Icons.subway, 'label': 'Subway'},
              {'icon': Icons.bus_alert_outlined, 'label': 'Bus'},
              {'icon': Icons.emoji_transportation, 'label': 'Others'},
            ],
          ),
        ],
      ),
    );
  }
}