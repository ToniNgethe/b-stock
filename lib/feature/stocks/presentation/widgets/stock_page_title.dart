import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/utils/assets.dart';

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
        const Spacer(),
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
