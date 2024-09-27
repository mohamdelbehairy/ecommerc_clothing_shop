import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('change: $change');
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    log('close: ${bloc.runtimeType}');
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    log('create: ${bloc.runtimeType}');
    super.onCreate(bloc);
  }
}
