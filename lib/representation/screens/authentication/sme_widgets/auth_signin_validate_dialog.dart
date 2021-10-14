import 'dart:ui';

import 'package:crm_app/core/app_assets/AppAssets.dart';
import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:crm_app/representation/screens/authentication/sme_login_screen.dart';
import 'package:flutter/material.dart';

class AuthSignInValidateDialog extends StatefulWidget {
  const AuthSignInValidateDialog({Key? key, required this.type})
      : super(key: key);
  final SignInType type;
  @override
  _AuthSignInValidateDialogState createState() =>
      _AuthSignInValidateDialogState();
}

class _AuthSignInValidateDialogState extends State<AuthSignInValidateDialog> {
  late bool _isInvalid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xffEDF6F7),
        child: Stack(
          children: <Widget>[
            //Background
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                AppAssets.bottomBg,
                width: 375.toScreenSize,
                height: 275.toScreenSize,
              ),
            ),
            //Title
            Container(
              margin: EdgeInsets.only(top: 43.toScreenSize),
              height: 21.toScreenSize,
              child: Stack(
                children: [
                  Center(
                    child: Text(titleDialog(),
                        style: TextStyle(
                            color: Color(0xff146A76),
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  ),
                  Align(
                    alignment: Alignment(-0.94, 0),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(AppAssets.arrowBack,
                          width: 21.toScreenSize, height: 21.toScreenSize),
                    ),
                  ),
                ],
              ),
            ),
            //Content
            Align(
              alignment: Alignment(0, -0.2),
              child: Container(
                width: 174.41.toScreenSize,
                height: 119.06.toScreenSize,
                child: Stack(
                  children: [
                    Image.asset(
                      AppAssets.validateBg,
                      width: 174.41.toScreenSize,
                      height: 119.06.toScreenSize,
                    ),
                    Align(
                      alignment: Alignment(0, -0.3),
                      child: signInMethodIcon(),
                    )
                  ],
                ),
              ),
            ),
            _isInvalid
                ? Align(
                    alignment: Alignment(0, 0.05),
                    child: Text(
                      biometricSignInFailed(),
                      style: TextStyle(
                          color: Color(0xffFF6763),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                : Align(
                    alignment: Alignment(0, 0.05),
                    child: Text(
                      'Đang kiểm tra ...',
                      style: TextStyle(
                          color: Color(0xff00B74F),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),

            _isInvalid
                ? Align(
                    alignment: Alignment(0, 0.2),
                    child: GestureDetector(
                      onTap: () {
                        print('Try again');
                        setState(() {
                          _isInvalid = false;
                        });
                      },
                      child: Container(
                        width: 327.toScreenSize,
                        height: 48.toScreenSize,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [0, 0.77],
                                colors: [Color(0xff1D4289), Color(0xff00B74F)]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        alignment: Alignment.center,
                        child: Text(
                          'Thử lại',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
            _isInvalid
                ? Align(
                    alignment: Alignment(0, 0.35),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        'Về màn hình đăng nhập',
                        style: TextStyle(
                            color: Color(0xff666666),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  String titleDialog() {
    switch (widget.type) {
      case SignInType.FACEID:
        return 'Nhận diện Face ID';
      case SignInType.FINGERID:
        return 'Nhận diện Touch ID';
      case SignInType.USERNAME:
        return '';
      default:
        return '';
    }
  }

  String biometricSignInFailed() {
    switch (widget.type) {
      case SignInType.FACEID:
        return 'Không nhận diện được Face ID';
      case SignInType.FINGERID:
        return 'Không nhận diện được Touch ID';
      case SignInType.USERNAME:
        return '';
      default:
        return '';
    }
  }

  Widget signInMethodIcon() {
    switch (widget.type) {
      case SignInType.FACEID:
        return Image.asset(
          _isInvalid ? AppAssets.faceIDInvalid : AppAssets.faceIDValid,
          width: 35.toScreenSize,
          height: 40.toScreenSize,
        );
      case SignInType.FINGERID:
        return Image.asset(
          _isInvalid ? AppAssets.fingerIDInvalid : AppAssets.fingerIDValid,
          width: 35.toScreenSize,
          height: 40.toScreenSize,
        );
      case SignInType.USERNAME:
        return SizedBox();
      default:
        return SizedBox();
    }
  }
}
