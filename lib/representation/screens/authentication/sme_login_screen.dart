import 'package:crm_app/core/app_assets/AppAssets.dart';
import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:crm_app/core/utilities/quick_actions.dart';
import 'package:crm_app/representation/screens/authentication/sme_widgets/auth_error_dialog.dart';
import 'package:crm_app/representation/screens/authentication/sme_widgets/auth_input_form.dart';
import 'package:crm_app/representation/screens/authentication/sme_widgets/auth_signin_validate_dialog.dart';
import 'package:crm_app/representation/screens/authentication/sme_widgets/auth_supp_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SMELoginScreen extends StatefulWidget {
  const SMELoginScreen({Key? key}) : super(key: key);
  static String routeName = 'SMELoginScreen';
  @override
  _SMELoginScreenState createState() => _SMELoginScreenState();
}

class _SMELoginScreenState extends State<SMELoginScreen> {
  late bool _signedin = true;
  late TextEditingController usernameTextController = TextEditingController();
  late TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          QuickActions.dismissKeyboard(context);
        },
        child: Stack(
          children: [
            //Background color
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Color(0xffEDF6F7),
            ),
            //UI
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                AppAssets.bottomBg,
                width: 375.toScreenSize,
                height: 275.toScreenSize,
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(
                    24.toScreenSize,
                    _signedin ? 69.toScreenSize : 99.toScreenSize,
                    24.toScreenSize,
                    0.toScreenSize),
                child: Column(
                  children: [
                    //Logo
                    Image.asset(
                      AppAssets.logo,
                      width:
                          _signedin ? 105.88.toScreenSize : 176.46.toScreenSize,
                      height: _signedin ? 24.toScreenSize : 40.toScreenSize,
                    ),
                    //Sign In form
                    Form(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: _signedin ? 40.toScreenSize : 80.toScreenSize),
                        child: Column(
                          children: [
                            _signedin
                                ? Column(
                                    children: [
                                      Container(
                                        width: 90.toScreenSize,
                                        height: 90.toScreenSize,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(45)),
                                          border: Border.all(
                                              color: Colors.white,
                                              width: 4.toScreenSize),
                                          image: DecorationImage(
                                              image: ExactAssetImage(
                                                  AppAssets.avatar),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 16.toScreenSize,
                                          bottom: 12.toScreenSize,
                                        ),
                                        child: Text(
                                          'Nguyễn Ngọc Thanh Tâm'.toUpperCase(),
                                          style: TextStyle(
                                            color: Color(0xff00B74F),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          print(
                                              'Đăng nhập bằng tài khoản khác');
                                          setState(() {
                                            _signedin = !_signedin;
                                          });
                                        },
                                        child: Container(
                                          height: 24.toScreenSize,
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                AppAssets.repeat,
                                                width: 24.toScreenSize,
                                                height: 24.toScreenSize,
                                              ),
                                              Text(
                                                'Đăng nhập bằng tài khoản khác',
                                                style: TextStyle(
                                                  color: Color(0xff999999),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : AuthInputForm(
                                    textEditingController:
                                        usernameTextController,
                                    hintText: 'Tên đăng nhập',
                                    validator: [
                                      RequiredValidator(
                                          errorText:
                                              '* Vui lòng nhập tên đăng nhập')
                                    ],
                                    suffix: Image.asset(
                                      AppAssets.close,
                                      width: 20.toScreenSize,
                                      height: 20.toScreenSize,
                                    ),
                                    obscureText: false,
                                  ),
                            AuthInputForm(
                              textEditingController: passwordTextController,
                              hintText: 'Nhập mật khẩu',
                              validator: [
                                RequiredValidator(
                                    errorText: '* Vui lòng nhập mật khẩu'),
                                MinLengthValidator(8,
                                    errorText:
                                        '* Mật khẩu cần tối thiểu 8 kí tự'),
                                PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                                    errorText:
                                        '* Mật khẩu phải chứa ít nhất 1 kí tự đặc biệt'),
                              ],
                              obscureText: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    //Sign In buttons
                    Container(
                      margin: EdgeInsets.only(
                          top: 64.toScreenSize, bottom: 80.toScreenSize),
                      width: double.infinity,
                      height: 48.toScreenSize,
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => onSigningIn(SignInType.USERNAME),
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        stops: [
                                          0,
                                          0.77
                                        ],
                                        colors: [
                                          Color(0xff1D4289),
                                          Color(0xff00B74F)
                                        ]),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24))),
                                alignment: Alignment.center,
                                child: Text(
                                  'Đăng nhập',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                          _signedin
                              ? GestureDetector(
                                  onTap: () {
                                    print('Biometric Signin');
                                  },
                                  child: Container(
                                    width: 48.toScreenSize,
                                    height: 48.toScreenSize,
                                    margin:
                                        EdgeInsets.only(left: 16.toScreenSize),
                                    padding: EdgeInsets.all(10.toScreenSize),
                                    decoration: BoxDecoration(
                                      color: Color(0xff00B74F),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(24)),
                                    ),
                                    child: Image.asset(
                                      AppAssets.fingerID,
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                    //Support buttons
                    Container(
                      height: 74.toScreenSize,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AuthSuppButton(
                              notifications: 0,
                              icon: AppAssets.qa,
                              name: 'Q & A',
                              onTapButton: () {
                                print('Q & A');
                              }),
                          AuthSuppButton(
                              notifications: 0,
                              icon: AppAssets.support,
                              name: 'Hỗ trợ',
                              onTapButton: () {
                                print('Hỗ trợ');
                              }),
                          _signedin
                              ? AuthSuppButton(
                                  notifications: 26,
                                  icon: AppAssets.notificatiion,
                                  name: 'Thông báo',
                                  onTapButton: () {
                                    print('Thông báo');
                                  })
                              : SizedBox(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onSigningIn(SignInType type) {
    if (type == SignInType.USERNAME) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AuthErrorDialog(
              type: DialogType.SIGNOUT,
            );
          });
    } else {
      showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel: 'Dialog',
        transitionDuration: Duration(
            milliseconds:
                400), // How long it takes to popup dialog after button click
        pageBuilder: (_, __, ___) {
          // Makes widget fullscreen
          return AuthSignInValidateDialog(type: type);
        },
      );
    }
  }
}

enum SignInType { USERNAME, FINGERID, FACEID }
