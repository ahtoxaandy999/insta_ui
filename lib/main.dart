import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_ui/presentation/app.dart';
import 'package:insta_ui/presentation/app_wrapper.dart';
import 'package:insta_ui/src/bloc/observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  runZonedGuarded(
    () => runApp(
      const AppWrapper(
        child: MyApp(),
      ),
    ),
    (exception, stack) => log(
      exception.toString(),
      stackTrace: stack,
      time: DateTime.now(),
      name: 'Exception',
    ),
  );
}
