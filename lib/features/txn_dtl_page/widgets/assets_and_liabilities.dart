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
        color: Color.fromARGB(167, 236, 247, 255),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Assets and Liabilities', 
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              ),
              const SizedBox(height: 16),
              _buildRow('Assets', totalAssets),
              _buildRow('Liabilities', totalLiabilities),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label, 
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )
          ),
          Text(
            value.toStringAsFixed(2),
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
