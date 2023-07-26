import 'package:bstock/app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../feature/splash/splash_page.dart';
import 'app_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        theme: AppTheme.themeData(context),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [],
        routes: routes,
        initialRoute: SplashPage.routeName,
        home: child,
      ),
    );
  }
}
