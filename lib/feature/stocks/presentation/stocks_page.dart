import 'package:bstock/app/di/injector.dart';
import 'package:bstock/app/utils/app_colors.dart';
import 'package:bstock/core/widgets/app_error_widget.dart';
import 'package:bstock/feature/stocks/presentation/bloc/stock_cubit.dart';
import 'package:bstock/feature/stocks/presentation/bloc/stock_state.dart';
import 'package:bstock/feature/stocks/presentation/widgets/highest_lowest_stock_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/internet_status/presentation/internet_status_widget.dart';
import '../../../core/widgets/app_textfield.dart';
import 'widgets/loading_widget.dart';
import 'widgets/stock_item_widget.dart';
import 'widgets/stock_page_title.dart';

class StocksPage extends StatelessWidget {
  static const routeName = '/stocks_page';

  const StocksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StockCubit>()..fetchData(),
      child: BlocConsumer<StockCubit, StockState>(
        listener: (ctx, state) {},
        builder: (ctx, state) {
          return Scaffold(
            bottomNavigationBar: const SafeArea(child: InternetStatusWidget()),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StocksTitleWidget(),
                    state.maybeWhen(
                        orElse: () => const LoadingWidget(),
                        loading: () => const LoadingWidget(),
                        error: (error) => AppErrorWidget(error: error),
                        stockData: (data) {
                          return Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 12.h,
                                ),
                                HighestLowestStockWidgets(
                                  highestStock: data.highestStock!,
                                  lowestStock: data.lowestStock!,
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
                                      ?.copyWith(
                                          color: AppColors.secondaryTextColor),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Expanded(
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      itemBuilder: (ctx, index) {
                                        return StockItemWidget(
                                          stock: data.stocks![index],
                                        );
                                      },
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(
                                            height: 18,
                                          ),
                                      itemCount: data.stocks!.length),
                                ),
                              ],
                            ),
                          );
                        })
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
