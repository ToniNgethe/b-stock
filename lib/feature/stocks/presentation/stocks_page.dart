import 'package:bstock/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/utils/assets.dart';
import '../../../core/widgets/app_textfield.dart';

class StocksPage extends StatelessWidget {
  static const routeName = '/stocks_page';

  const StocksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StocksTitleWidget(),
              SizedBox(
                height: 12.h,
              ),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1)),
                      child: Column(
                        children: [
                          Text(
                            'HIGHEST',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            '89,000.00',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            'Google Inc, gg',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1)),
                      child: Column(
                        children: [
                          Text(
                            'LOWEST',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            '89,000.00',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            'Google Inc, gg',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              const AppTextField(
                hint: 'e.g AAPL, GOOGL',
                title: 'Search for stock',
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "Stocks",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppColors.secondaryTextColor),
              ),
              SizedBox(
                height: 12.h,
              ),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return StockItemWidget();
                    },
                    separatorBuilder: (_, __) => const SizedBox(
                          height: 18,
                        ),
                    itemCount: 100),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StockItemWidget extends StatelessWidget {
  const StockItemWidget({
    super.key,
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
                'A',
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
                  "AAPL",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Apple Inc",
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "40,000",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(children: [
                  Icon(
                    Icons.arrow_drop_up,
                    color: Colors.green,
                  ),
                  Text(
                    '50%',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.green),
                  )
                ])
              ],
            ),
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Spacer(),
            Text(
              "As of 12th June, 2023",
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

class StocksTitleWidget extends StatelessWidget {
  const StocksTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.appIcon,
          height: 30,
          width: 30,
        ),
        Spacer(),
        RichText(
          text: TextSpan(
              text: "B",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              children: [
                TextSpan(
                    text: "-",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.black)),
                TextSpan(
                    text: "Stock",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary)),
                TextSpan(
                    text: "  Portfolio",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey))
              ]),
        ),
      ],
    );
  }
}
