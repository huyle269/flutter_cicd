import 'dart:developer';

import 'package:bloc/bloc.dart';

//Change log to Logger

class AppBlocLoggingObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    log('*** OnEvent *** \n${event.runtimeType}');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // log('*** OnChange *** \n${bloc.state}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('*** OnError *** \n${error.toString()}');
    super.onError(bloc, error, stackTrace);
  }
}
