import 'package:flutter/material.dart';

import '../../feature/add_select_company/add_select_company_page.dart';
import '../../feature/splash/splash_page.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => const SplashPage(),
  AddSelectCompanyPage.routeName: (context) => const AddSelectCompanyPage()
};
