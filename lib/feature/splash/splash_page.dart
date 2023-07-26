import 'package:bstock/app/di/injector.dart';
import 'package:bstock/app/utils/assets.dart';
import 'package:bstock/app/utils/context_ext.dart';
import 'package:bstock/core/models/generic_cubit_state.dart';
import 'package:bstock/feature/splash/presentation/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../add_select_company/add_select_company_page.dart';

class SplashPage extends StatelessWidget {
  static const routeName = "/splash-page";

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SplashCubit>()..initApp(),
      child: BlocConsumer<SplashCubit, GenericCubitState>(
        listener: (ctx, state) {
          if (state is GenericCubitStateError) {
            context.displaySnack(state.message);
          }

          if (state is GenericCubitStateSuccess) {
            Navigator.popAndPushNamed(context, AddSelectCompanyPage.routeName);
          }
        },
        builder: (ctx, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.appIcon,
                    height: 80,
                    width: 80,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "B",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        children: [
                          TextSpan(
                              text: "-",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                          TextSpan(
                              text: "Stock",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary))
                        ]),
                  ),
                  if (state is GenericCubitStateLoading)
                    _displayProgressIndicator()
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _displayProgressIndicator() => Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          const CircularProgressIndicator(
            strokeWidth: 2,
          )
        ],
      );
}
