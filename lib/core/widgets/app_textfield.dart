import 'package:bstock/app/di/injector.dart';
import 'package:bstock/core/database/models/company.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/utils/app_colors.dart';
import '../company/presentation/company_cubit.dart';

class AppSearchTextField extends StatelessWidget {
  final String? title;
  final String? hint;
  final ValueChanged? valueChanged;
  final FormFieldValidator? formFieldValidator;

  const AppSearchTextField(
      {Key? key,
      this.valueChanged,
      this.formFieldValidator,
      this.hint,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CompanyCubit>()..fetchCompanies(),
      child: BlocBuilder<CompanyCubit, List<Company>>(
        builder: (ctx, state) {
          if (state.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 6),
                  child: Text(
                    "$title",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Autocomplete<String>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      }
                      return state.map((e) => e.name).where((String option) {
                        return option
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase());
                      });
                    }, onSelected: (String selection) {
                      valueChanged!(selection);
                    }, fieldViewBuilder: (BuildContext context,
                            TextEditingController textEditingController,
                            FocusNode focusNode,
                            VoidCallback onFieldSubmitted) {
                      return TextField(
                          controller: textEditingController,
                          focusNode: focusNode,
                          onChanged: valueChanged,
                          style:
                              const TextStyle(color: AppColors.secondaryColor),
                          decoration: buildInputDecoration(hint ?? ''));
                    })),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

InputDecoration buildInputDecoration(String hint) => InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(color: Colors.grey, fontSize: 12.sp),
    fillColor: AppColors.cardBg,
    filled: true,
    focusedBorder: buildInputBorder(),
    errorBorder: buildInputBorder(),
    errorMaxLines: 2,
    focusedErrorBorder: buildInputBorder(),
    disabledBorder: buildInputBorder(),
    enabledBorder: buildInputBorder());

OutlineInputBorder buildInputBorder() {
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(0)),
      borderSide: BorderSide(color: Colors.transparent, width: 0));
}
