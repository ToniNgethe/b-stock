import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/database/models/stock_entity.dart';

class HighestLowestStockWidgets extends StatelessWidget {
  final StockEntity highestStock;
  final StockEntity lowestStock;

  const HighestLowestStockWidgets({
    super.key,
    required this.highestStock,
    required this.lowestStock,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HighLowStockWidget(
          value: highestStock.high.toString(),
          company: '${highestStock.company}, ${highestStock.symbol}',
          stockStatus: StockStatus.highest,
        ),
        const SizedBox(
          width: 22,
        ),
        HighLowStockWidget(
          value: lowestStock.high.toString(),
          company: '${lowestStock.company}, ${lowestStock.symbol}',
          stockStatus: StockStatus.lowest,
        ),
      ],
    );
  }
}

enum StockStatus {
  highest('HIGHEST'),
  lowest('LOWEST');

  const StockStatus(this.title);

  final String title;
}

class HighLowStockWidget extends StatelessWidget {
  final String value;
  final String company;
  final StockStatus stockStatus;

  const HighLowStockWidget({
    super.key,
    required this.value,
    required this.company,
    required this.stockStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 1)),
        child: Column(
          children: [
            Text(
              stockStatus.title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: stockStatus == StockStatus.highest
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(
              company,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(),
            ),
          ],
        ),
      ),
    );
  }
}