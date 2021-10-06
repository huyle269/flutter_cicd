// ignore: implementation_imports
import 'package:crm_app/core/app_assets/AppAssets.dart';
import 'package:crm_app/core/app_config/size_config.dart';
import 'package:crm_app/core/extensions/color_palette.dart';
import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:crm_app/core/extensions/textstyle_extension.dart';
import 'package:crm_app/core/extensions/textstyles.dart';
import 'package:crm_app/core/utilities/quick_actions.dart';
import 'package:crm_app/main.dart';
import 'package:crm_app/representation/widgets/gradient_button.dart';
// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:crm_app/core/constants/constants.dart';
import 'package:crm_app/data/repository/authen_repository.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, required this.authenRepositoryImpl}) : super(key: key);

  final AuthenRepositoryImpl authenRepositoryImpl;

  static String routeName = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? token;
  bool rememberLogin = false;

  @override
  void initState() {
    super.initState();
    loadHiveBox();
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
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
            ),
          );
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
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
            },
          );
        }
      },
    );
  }

  Box<dynamic>? hiveBox;
  void loadHiveBox() async {
    hiveBox = await Hive.openBox(HiveKeys.boxName);
  }

  @override
  Widget build(BuildContext context) {
    // final bool english = hiveBox?.get(HiveKeys.currentLanguage) ?? true;
    rememberLogin = hiveBox?.get(HiveKeys.rememberLogin) ?? false;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   actions: [
      //     TextButton(
      //       style: CustomButtonStyles.appBarAction,
      //       onPressed: () {
      //         hiveBox?.put(HiveKeys.currentLanguage, !english);
      //         context.setLocale(english ? LocaleVI : LocaleEN);
      //         setState(() {
      //           // Logger.printOut('change language');
      //         });
      //       },
      //       child: Text(
      //         english ? 'Tieng Viet' : 'English',
      //         style: TextStyle(color: Colors.black),
      //       ),
      //     ),
      //   ],
      // ),
      // body: Container(
      //   padding: EdgeInsets.symmetric(horizontal: 40),
      //   color: Colors.white,
      //   child: Form(
      //     key: _formKey,
      //     autovalidateMode: AutovalidateMode.onUserInteraction,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text(
      //           'login'.tr().toUpperCase(),
      //           style: TextStyle(color: ColorPalette.normalTextColor),
      //         ),
      //         const SizedBox(height: 20),
      //         TextFormField(
      //           decoration: InputDecoration(hintText: 'email'),
      //           validator: MultiValidator([
      //             RequiredValidator(errorText: 'email is required'),
      //             EmailValidator(errorText: 'enter a valid email address'),
      //           ]),
      //         ),
      //         const SizedBox(height: 8),
      //         TextFormField(
      //           decoration: InputDecoration(hintText: 'password'),
      //           validator: MultiValidator(
      //             [
      //               RequiredValidator(errorText: 'password is required'),
      //               MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
      //               PatternValidator(r'(?=.*?[#?!@$%^&*-])',
      //                   errorText: 'passwords must have at least one special character'),
      //             ],
      //           ),
      //         ),
      //         const SizedBox(height: 20),
      //         TextButton(
      //           onPressed: () async {
      //             try {
      //               if (_formKey.currentState!.validate()) {
      //                 // If the form is valid, display a snackbar. In the real world,
      //                 // Validate returns true if the form is valid, or false otherwise.

      //                 // you'd often call a server or save the information in a database.
      //                 final loginModel = await widget.authenRepositoryImpl.login();
      //                 HttpClient.setAuthorization(loginModel.item.accessToken);
      //                 ScaffoldMessenger.of(context).showSnackBar(
      //                   const SnackBar(content: Text('Processing Data')),
      //                 );
      //               }
      //               // Navigator.pushReplacementNamed(context, MainScreen.routeName);
      //             } catch (e) {
      //               Logger.printOut('Lỗi rồi');
      //             }
      //           },
      //           child: Text('login').tr(),
      //         ),
      //         TextButton(
      //           onPressed: () async {
      //             try {
      //               final success = await widget.authenRepositoryImpl.logOut('kidclient');
      //               if (success) {
      //                 HttpClient.setBasicAuthorization();
      //               }
      //             } catch (e) {
      //               Logger.printOut('Lỗi rồi');
      //             }
      //           },
      //           child: Text('logOut').tr(),
      //         ),
      //       ],
      //     ),
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   actions: [
      //     TextButton(
      //       style: CustomButtonStyles.appBarAction,
      //       onPressed: () {
      //         hiveBox?.put(HiveKeys.currentLanguage, !english);
      //         context.setLocale(english ? LocaleVI : LocaleEN);
      //         setState(() {
      //           Logger.printOut('change language');
      //         });
      //       },
      //       child: Text(
      //         english ? 'Tieng Viet' : 'English',
      //         style: TextStyle(color: Colors.black),
      //       ),
      //     ),
      //   ],
      // ),
      body: GestureDetector(
        onTap: () {
          QuickActions.dismissKeyboard(context);
        },
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(AppAssets.loginBg),
            ),
            Positioned(
                top: (320.toScreenSize - 112.toScreenSize) / 2,
                left: (SizeConfig.screenWidth - 112.toScreenSize) / 2,
                child: Image.asset(AppAssets.iconLinkID, width: 112.toScreenSize, height: 112.toScreenSize)),
            Container(
              color: Colors.transparent,
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                  reverse: false,
                  child: Container(
                    height: SizeConfig.screenHeight - 320.toScreenSize + 20,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                            SizedBox(height: 40.toScreenSize),
                            Text(
                              'login_form_title'.tr().toUpperCase(),
                              style: TextStyles.heading3Text.text1Color,
                            ),
                            SizedBox(height: 60.toScreenSize),
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(hintText: 'email'),
                              style: TextStyles.body1Text.bold,
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'email is required'),
                                EmailValidator(errorText: 'enter a valid email address'),
                              ]),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(hintText: 'password'.tr()),
                              obscureText: true,
                              style: TextStyles.body1Text.bold,
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'password is required'),
                                MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
                                PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                                    errorText: 'passwords must have at least one special character'),
                              ]),
                            ),
                            SizedBox(height: 16.toScreenSize),
                            SizedBox(
                              width: double.infinity,
                              child: InkWell(
                                onTap: () {
                                  rememberLogin = !rememberLogin;
                                  hiveBox?.put(HiveKeys.rememberLogin, rememberLogin);
                                  setState(() {});
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      rememberLogin ? AppAssets.iconCheckboxOn : AppAssets.iconCheckboxOff,
                                      width: 18.toScreenSize,
                                      height: 18.toScreenSize,
                                    ),
                                    SizedBox(width: 8),
                                    Text('remember_login'.tr(), style: TextStyles.body1Text),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 16.toScreenSize),
                            GradientButton(
                              onPressed: () {
                                QuickActions.dismissKeyboard(context);
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
                              child: Text(
                                'login_button_title'.tr(),
                                style: TextStyles.heading5Text.lightTextColor,
                              ),
                            ),
                            SizedBox(height: 40.toScreenSize),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: ColorPalette.bg2Color,
                                    thickness: 3,
                                  ),
                                ),
                                SizedBox(width: 16.toScreenSize),
                                Text('or_continue_login'.tr(), style: TextStyles.body1Text),
                                SizedBox(width: 16.toScreenSize),
                                Expanded(
                                  child: Divider(
                                    color: ColorPalette.bg2Color,
                                    thickness: 3,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40.toScreenSize),
                            GradientButton(
                              width: 48.toScreenSize,
                              height: 48.toScreenSize,
                              onPressed: () {},
                              child: Image.asset(
                                AppAssets.iconFingerPrint,
                                width: 30.toScreenSize,
                                height: 30.toScreenSize,
                              ),
                            ),
                          ],
                        )),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
