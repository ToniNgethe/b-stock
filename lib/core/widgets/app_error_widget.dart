import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String error;

  const AppErrorWidget({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        height: double.infinity,
        child: Text(
          error,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
