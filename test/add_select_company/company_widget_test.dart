import 'package:bstock/core/database/models/company.dart';
import 'package:bstock/feature/add_select_company/add_select_company_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CompanyWidget displays name and symbol', (tester) async {
    final company = Company(name: 'Test', symbol: 'TST', selected: true);

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CompanyWidget(company: company),
      ),
    ));

    expect(find.text('Test'), findsOneWidget);
    expect(find.text('TST'), findsOneWidget);
  });
}
