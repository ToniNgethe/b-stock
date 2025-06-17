import 'package:bstock/core/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('buildInputDecoration sets hint text', () {
    const hint = 'Search';
    final decoration = buildInputDecoration(hint);
    expect(decoration.hintText, hint);
  });
}
