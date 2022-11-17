import 'package:flutter/material.dart';
import 'package:senjayer/data/models/pricing.dart';
import 'package:senjayer/utils/constants.dart';

class PricingItem extends StatelessWidget {
  final Pricing pricing;
  const PricingItem({
    Key? key,
    required this.pricing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: AppConstants().lightPurple,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            pricing.label,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            "${pricing.price} F CFA",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
