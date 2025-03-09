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
                    'Assets and Liabilities',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRow(context, 'Assets', totalAssets),
                  Text(
                    totalAssets.toStringAsFixed(2),
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRow(context, 'Liabilities', totalLiabilities),
                  Text(
                    totalLiabilities.toStringAsFixed(2),
                    style: TextStyle(fontSize: 20, color: Colors.white),
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
            style: TextStyle(
              fontSize: 20, 
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}
