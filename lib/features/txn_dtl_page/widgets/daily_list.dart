// Author: Ching-Yu

import 'package:flutter/material.dart';
import '../models/daily_data.dart';
import 'daily_item.dart';

class DailyListPage extends StatelessWidget {
  const DailyListPage({super.key, required this.dailyData});

  final List<DailyData> dailyData;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.64,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25), 
          ),
        ),
        child: dailyList(),
      ),
    );
  }

  Scaffold dailyList() {
    return Scaffold(
      backgroundColor: Colors.transparent, 
      body: DraggableScrollableSheet(
        initialChildSize: 1.0, 
        minChildSize: 1.0, 
        maxChildSize: 1.0,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white, // 背景颜色
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(25), // 顶部圆角
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                // 列表内容
                Expanded(
                  child: ListView.builder(
                    controller: scrollController, 
                    padding: const EdgeInsets.all(16),
                    itemCount: dailyData.length,
                    itemBuilder: (context, index) {
                      final daily = dailyData[index];
                      return DailyItem(daily: daily);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
