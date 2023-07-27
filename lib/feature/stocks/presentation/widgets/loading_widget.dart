import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        height: double.infinity,
        child: const CircularProgressIndicator(
          strokeWidth: 1,
        ),
      ),
    );
  }
}