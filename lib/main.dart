import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import 'app/app.dart';
import 'app/di/injector.dart';
import 'app/utils/app_bloc_observer.dart';

void main() async{
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.prod);

  Bloc.observer = AppBlocObserver();
  runApp(const App());
}
