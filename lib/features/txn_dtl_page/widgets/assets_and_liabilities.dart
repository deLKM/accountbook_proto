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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.attach_money, color: Colors.amber, size: 20),
                  Text(
                    'Assets and Liabilities',
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRow('Assets', totalAssets),
                  Text(
                    totalAssets.toStringAsFixed(2),
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRow('Liabilities', totalLiabilities),
                  Text(
                    totalLiabilities.toStringAsFixed(2),
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          Text(
            label,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
