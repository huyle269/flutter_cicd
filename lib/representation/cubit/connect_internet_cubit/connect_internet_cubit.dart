// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:connectivity/connectivity.dart';
// import 'package:crm_app/core/api_service/data_connection_checker.dart';

// part 'connect_internet_state.dart';

// class ConnectInternetCubit extends Cubit<bool> {
//   late final StreamSubscription<ConnectivityResult> subscription;

//   ConnectInternetCubit() : super(false) {
//     try {
//       checkInternetConnected();
//       subscription = Connectivity().onConnectivityChanged.listen(
//         (ConnectivityResult result) async {
//           if (result == ConnectivityResult.none) {
//             emit(false);
//           } else {
//             checkInternetConnected();
//           }
//         },
//       );
//     } catch (e) {
//       print(e);
//     }
//   }

//   void checkInternetConnected() async {
//     final isDeviceConnected = await DataConnectionChecker().hasConnection;
//     if (isDeviceConnected) {
//       emit(true);
//     } else {
//       emit(false);
//     }
//   }
// }
