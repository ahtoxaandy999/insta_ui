import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    final String className = bloc.runtimeType.toString();

    log('$event', name: 'onEvent $className');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    final String className = bloc.runtimeType.toString();

    log('$transition', name: 'onTransition $className');
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    if (bloc is! Bloc) {
      final String className = bloc.runtimeType.toString();

      log('$change', name: 'onChange $className');
    }
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    final String className = bloc.runtimeType.toString();

    log('$error', name: 'onError $className');
    super.onError(bloc, error, stackTrace);
  }
}
