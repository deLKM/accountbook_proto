// Author: Ching-Yu

import 'package:flutter/material.dart';

class AssetsAndLiabilities extends StatelessWidget {
  final double totalAssets;
  final double totalLiabilities;

  const AssetsAndLiabilities({
    super.key,
    required this.totalAssets,
    required this.totalLiabilities,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.attach_money, color: Colors.amber, size: 20),
                  Text(
                    '资产与负债',
                    style: Theme.of(context).textTheme.titleLarge
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildRow(context, '资产：', totalAssets),
                      Text(
                        totalAssets.toStringAsFixed(2),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/assets'); // 跳转注册页面
                    },
                    icon: Icon(
                      Icons.edit,
                      size: 15,
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildRow(context, '负债：', totalLiabilities),
                      Text(
                        totalLiabilities.toStringAsFixed(2),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/liabilities');
                    },
                    icon: Icon(
                      Icons.edit,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          Text(
            label,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
