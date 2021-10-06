// ignore: implementation_imports
import 'package:crm_app/core/extensions/color_palette.dart';
import 'package:crm_app/main.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:crm_app/core/constants/constants.dart';
import 'package:crm_app/core/constants/constants_button_styles.dart';
import 'package:crm_app/core/logging/logger.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  static String routeName = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? token;

  @override
  void initState() {
    super.initState();
    loadHiveBox();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });
  }

  Box<dynamic>? hiveBox;
  void loadHiveBox() async {
    hiveBox = await Hive.openBox(HiveKeys.boxName);
  }

  @override
  Widget build(BuildContext context) {
    final bool english = hiveBox?.get(HiveKeys.currentLanguage) ?? true;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          TextButton(
            style: CustomButtonStyles.appBarAction,
            onPressed: () {
              hiveBox?.put(HiveKeys.currentLanguage, !english);
              context.setLocale(english ? LocaleVI : LocaleEN);
              setState(() {
                Logger.printOut('change language');
              });
            },
            child: Text(
              english ? 'Tieng Viet' : 'English',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        color: Colors.white,
        child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'login'.tr().toUpperCase(),
                  style: TextStyle(color: ColorPalette.normalTextColor),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(hintText: 'email'),
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'email is required'),
                    EmailValidator(errorText: 'enter a valid email address'),
                  ]),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(hintText: 'password'),
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'password is required'),
                    MinLengthValidator(8,
                        errorText: 'password must be at least 8 digits long'),
                    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                        errorText:
                            'passwords must have at least one special character'),
                  ]),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: Text('login').tr(),
                ),
              ],
            )),
      ),
    );
  }
}
