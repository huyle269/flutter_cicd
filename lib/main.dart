import 'package:crm_app/core/api_service/api_provider.dart';
import 'package:crm_app/core/app_config/app_config.dart';
import 'package:crm_app/core/session/session_manager.dart';
import 'package:crm_app/core/app_config/size_config.dart';
import 'package:crm_app/core/theme/theme_manager.dart';
import 'package:crm_app/representation/cubit/connect_internet_cubit/connect_internet_cubit.dart';
import 'package:crm_app/ultilities/analytics_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import 'package:crm_app/core/logging/bloc_observer.dart';
import 'package:crm_app/core/constants/constants.dart';
import 'package:crm_app/core/logging/logger.dart';
import 'package:crm_app/core/logging/navigation_observer.dart';
import 'package:crm_app/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'data/repository/authen_repository.dart';
import 'representation/screens/main_screen.dart';
import 'representation/screens/intro_screen.dart';

void initializeApp(AppConfig configuration) async {
  // must-have code line to ensure that instance of WidgetsBinding has been initialized
  // which help native channel works properly
  WidgetsFlutterBinding.ensureInitialized();
  // enable EasyLocalization package
  await EasyLocalization.ensureInitialized();

  // declare observer for Bloc to track bloc's flow activities
  Bloc.observer = AppBlocObserver();

  // init Hive services
  await Hive.initFlutter();
  var box = await Hive.openBox(HiveKeys.boxName);

  // init Firebase services
  await Firebase.initializeApp();
  // set handler for background message
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runZonedGuarded(() async {
    if (AppConfig.shared.flavor != Environments.Development) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    }

    runApp(
      EasyLocalization(
        supportedLocales: [LocaleVI, LocaleEN],
        path: 'assets/translations',
        fallbackLocale: LocaleVI,
        child: MyApp(
          hiveBox: box,
        ),
      ),
    );

    // await initializeFirebaseMessage();
  }, (error, stackTrace) async {
    // do what we want with error
    // maybe we will implement Sentry or Fabric here
    await FirebaseCrashlytics.instance
        .recordError(error, stackTrace, reason: 'a non-fatal error');
  });
}

class MyApp extends StatelessWidget {
  final Box<dynamic>? hiveBox;

  const MyApp({Key? key, required this.hiveBox}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final bool ignoreIntro = hiveBox?.get(HiveKeys.ignoreIntro) ?? false;
    final bool ignoreIntro = false;
    Logger.printOut('ignore intro = $ignoreIntro');
    // set default locale
    context.setLocale(LocaleVI);
    return ThemeBuilder(
      themes: getThemes(),
      // statusBarColorBuilder: (theme) => theme!.accentColor,
      defaultThemeMode: ThemeMode.light,
      darkTheme: darkTheme,
      lightTheme: lightTheme1,
      builder: (context, regularTheme, darkTheme, themeMode) =>
          MultiRepositoryProvider(
        providers: [
          RepositoryProvider<ApiProviderRepositoryImpl>(
            create: (context) => ApiProviderRepositoryImpl(),
            lazy: false,
          ),
          RepositoryProvider<AuthenRepositoryImpl>(
              create: (context) => AuthenRepositoryImpl(context.read())),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ConnectInternetCubit>(
              create: (context) => ConnectInternetCubit(),
              lazy: false,
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'CRM App',
            theme: regularTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            navigatorObservers: [
              AppNavigationObserver(),
              AnalyticsService().getAnalyticsObserver()
            ],
            routes: routes,
            home: Builder(
              builder: (context) {
                SessionManager().start(context);
                SizeConfig.init(context);
                return ignoreIntro
                    ? MainScreen()
                    // ? LoginScreen(authenRepositoryImpl: context.read<AuthenRepositoryImpl>())
                    : IntroScreen();
              },
            ),
          ),
        ),
      ),
    );
  }
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  print(message.data);
  flutterLocalNotificationsPlugin.show(
    message.data.hashCode,
    message.data['title'],
    message.data['body'],
    NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channel.description,
      ),
    ),
  );
}
