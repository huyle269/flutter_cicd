import 'package:bloc/bloc.dart';
import 'package:crm_app/core/logging/logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    Logger.printOut(
        'onEvent => event: ' + '${event.runtimeType}'.toUpperCase());
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Logger.printOut('onError => error: ' + '${bloc.runtimeType}'.toUpperCase());
  }
}
