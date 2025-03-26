// Author: Ching-Yu

import 'package:flutter/material.dart';
import '../models/daily_data.dart';
import 'daily_item.dart';

class DailyListPage extends StatefulWidget {
  // 显然这里 List<DailyData> 是个参数
  final List<DailyData> dailyData;

  const DailyListPage({
    super.key, 
    required this.dailyData
  });

  @override
  State<DailyListPage> createState() => _DailyListPageState();
}

class _DailyListPageState extends State<DailyListPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.1, end: 0.9).animate(_controller);
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          // 一个简单的响应式设计，土法响应式......
          final offset = MediaQuery.of(context).size.width < 600 
            ? MediaQuery.of(context).size.height * 0.64 * _animation.value
            : MediaQuery.of(context).size.height * 0.7 * _animation.value;
            
          return Transform.translate(
            offset: Offset(0, offset), 
            child: Container(
              height: MediaQuery.of(context).size.width < 600 
                ? MediaQuery.of(context).size.height * 0.64
                : MediaQuery.of(context).size.height * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  // 顶部拖动指示器
                  GestureDetector(
                    onTap: _toggleExpansion,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  // 列表内容
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: widget.dailyData.length,
                      itemBuilder: (context, index) {
                        final daily = widget.dailyData[index];
                        return DailyItem(daily: daily);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}