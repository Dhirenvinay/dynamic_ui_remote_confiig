import 'package:dynamiui/app_config.dart';
import 'package:flutter/material.dart';

class BuyCards extends StatelessWidget {
  const BuyCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Card(
              color: AppConfig.buyCardsColor,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(AppConfig.buyCardBr),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "BUY\nBrand New",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Card(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppConfig.buySecondaryCardBr,
                ),
              ),
              color: AppConfig.buySecondaryCard,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "BUY\nRefurbished",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
