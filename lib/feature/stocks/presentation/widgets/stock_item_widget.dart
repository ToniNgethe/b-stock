import 'package:flutter/material.dart';

import '../../../../core/database/models/stock_entity.dart';
import '../stock_ui.dart';

class StockItemWidget extends StatelessWidget {
  final StockEntity stock;

  const StockItemWidget({
    super.key,
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 45,
              width: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300, width: 1)),
              child: Text(
                stock.symbol![0],
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.grey),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${stock.symbol}",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "${stock.company}",
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${stock.close}",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(children: [
                  Icon(
                    StockUi.getPercentageChange(stock) > 0
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: StockUi.getPercentageChange(stock) > 0
                        ? Colors.green
                        : Colors.red,
                  ),
                  Text(
                    '${StockUi.getPercentageChange(stock)}%',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: StockUi.getPercentageChange(stock) > 0
                            ? Colors.green
                            : Colors.red),
                  )
                ])
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            const Spacer(),
            Text(
              "${stock.date}",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.grey),
            )
          ],
        )
      ],
    );
  }
}