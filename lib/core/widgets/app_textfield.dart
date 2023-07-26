import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/utils/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String? title;
  final String? hint;
  final ValueChanged? valueChanged;
  final FormFieldValidator? formFieldValidator;

  const AppTextField(
      {Key? key,
      this.valueChanged,
      this.formFieldValidator,
      this.hint,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: TextFormField(
            validator: formFieldValidator,
            style: const TextStyle(color: AppColors.secondaryColor),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: valueChanged,
            decoration: buildInputDecoration(hint ?? ''),
          ),
        ),
      ],
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
