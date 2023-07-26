import 'package:bstock/app/di/injector.dart';
import 'package:bstock/app/utils/app_colors.dart';
import 'package:bstock/app/utils/context_ext.dart';
import 'package:bstock/core/database/models/company.dart';
import 'package:bstock/feature/add_select_company/presentation/bloc/add_select_company_cubit.dart';
import 'package:bstock/feature/add_select_company/presentation/bloc/add_select_company_state.dart';
import 'package:bstock/feature/stocks/presentation/stocks_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/utils/assets.dart';

class AddSelectCompanyPage extends StatelessWidget {
  static const routeName = "/add_select_company_page";

  const AddSelectCompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddSelectCompanyCubit>()..fetchCompanies(),
      child: BlocConsumer<AddSelectCompanyCubit, AddSelectCompanyState>(
        listener: (ctx, state) {
          if (state is AddSelectCompanyStateError) {
            ctx.displaySnack(state.error);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    SvgPicture.asset(
                      Assets.appIcon,
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      "Select the companies you want to view stock market data for. You can add more companies or choose from the existing ones.",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: 14.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    if (state is AddSelectCompanyStateLoading)
                      const Padding(
                        padding: EdgeInsets.all(8),
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    if (state is AddSelectCompanyStateCompanies)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: StaggeredGrid.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          axisDirection: AxisDirection.down,
                          mainAxisSpacing: 8,
                          children: state.companies
                              .map((e) => CompanyWidget(
                                    company: e,
                                  ))
                              .toList(),
                        ),
                      ),
                    if (state is AddSelectCompanyStateCompanies) const Spacer(),
                    if (state is AddSelectCompanyStateCompanies)
                      _displayActions(context)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _displayActions(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.colorPrimary,
                  minimumSize: const Size(double.infinity, 45),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                onPressed: () {
                  Navigator.popAndPushNamed(context, StocksPage.routeName);
                },
                child: const Text("Continue to Stocks")),
            TextButton(onPressed: () {}, child: const Text("Add a company"))
          ],
        ),
      );
}

class CompanyWidget extends StatelessWidget {
  final Company company;

  const CompanyWidget({
    super.key,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            company.name,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.black),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            company.symbol,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
