import 'package:crm_app/core/app_assets/AppAssets.dart';
import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:flutter/material.dart';

class AuthErrorDialog extends StatefulWidget {
  const AuthErrorDialog({Key? key, required this.type}) : super(key: key);
  final DialogType type;
  @override
  _AuthErrorDialogState createState() => _AuthErrorDialogState();
}

class _AuthErrorDialogState extends State<AuthErrorDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: 16.toScreenSize,
                  top: 65.toScreenSize,
                  right: 16.toScreenSize,
                  bottom: 16.toScreenSize),
              margin: EdgeInsets.only(top: 45.toScreenSize),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.toScreenSize),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 10),
                        blurRadius: 10),
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    dialogTitle(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.toScreenSize),
                    child: Text(
                      dialogDescruption(),
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  widget.type == DialogType.WRONGPASSWORD
                      ? Container(
                          padding: EdgeInsets.only(top: 32.toScreenSize),
                          child: Column(
                            children: [
                              Divider(
                                color: Color(0xffBACDDF),
                                height: 1.toScreenSize,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  color: Colors.transparent,
                                  padding:
                                      EdgeInsets.only(top: 16.toScreenSize),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        AppAssets.retry,
                                        width: 20.toScreenSize,
                                        height: 20.toScreenSize,
                                      ),
                                      SizedBox(
                                        width: 12.toScreenSize,
                                      ),
                                      Text(
                                        'Thử lại',
                                        style: TextStyle(
                                            color: Color(0xff00B74F),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                  widget.type == DialogType.SESSIONEXPRIED
                      ? Container(
                          padding: EdgeInsets.only(top: 32.toScreenSize),
                          child: Column(
                            children: [
                              Divider(
                                color: Color(0xffBACDDF),
                                height: 1.toScreenSize,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  color: Colors.transparent,
                                  padding:
                                      EdgeInsets.only(top: 16.toScreenSize),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        AppAssets.signout,
                                        width: 20.toScreenSize,
                                        height: 20.toScreenSize,
                                      ),
                                      SizedBox(
                                        width: 12.toScreenSize,
                                      ),
                                      Text(
                                        'Đăng nhập lại',
                                        style: TextStyle(
                                            color: Color(0xff00B74F),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                  widget.type == DialogType.SIGNOUT
                      ? Container(
                          padding: EdgeInsets.only(top: 32.toScreenSize),
                          child: Column(
                            children: [
                              Divider(
                                color: Color(0xffBACDDF),
                                height: 1.toScreenSize,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: Container(
                                          color: Colors.transparent,
                                          padding: EdgeInsets.only(
                                              top: 16.toScreenSize),
                                          child: Text(
                                            'Huỷ',
                                            style: TextStyle(
                                                color: Color(0xff999999),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Center(
                                  //   child: Image.asset(
                                  //     AppAssets.verticalDivider,
                                  //     height: 47.toScreenSize,
                                  //   ),
                                  // ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 8.toScreenSize),
                                    color: Color(0xffBACDDF),
                                    height: 40.toScreenSize,
                                    width: 1.toScreenSize,
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: Container(
                                          color: Colors.transparent,
                                          padding: EdgeInsets.only(
                                              top: 16.toScreenSize),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                AppAssets.signout,
                                                width: 20.toScreenSize,
                                                height: 20.toScreenSize,
                                              ),
                                              SizedBox(
                                                width: 12.toScreenSize,
                                              ),
                                              Text(
                                                'Đăng xuất',
                                                style: TextStyle(
                                                    color: Color(0xff00B74F),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
            Positioned(
              left: 20.toScreenSize,
              right: 20.toScreenSize,
              child: Image.asset(
                AppAssets.note,
                width: 126.5.toScreenSize,
                height: 105.7.toScreenSize,
              ),
            ),
            Positioned(
              right: 16.toScreenSize,
              top: 56.toScreenSize,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  AppAssets.closeCircle,
                  width: 24.toScreenSize,
                  height: 24.toScreenSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String dialogTitle() {
    switch (widget.type) {
      case DialogType.ACCOUNTNOTAVAILABLE:
        return 'Tài khoản không tồn tại';
      case DialogType.WRONGPASSWORD:
        return 'Mật khẩu không chính xác';
      case DialogType.ACCOUNTLOCKED:
        return 'Tài khoản đã bị khóa';
      case DialogType.SIGNOUT:
        return 'Bạn chắc chắn muốn đăng xuất?';
      case DialogType.SESSIONEXPRIED:
        return 'Phiên đăng nhập hết hạn';
      default:
        return '';
    }
  }

  String dialogDescruption() {
    switch (widget.type) {
      case DialogType.ACCOUNTNOTAVAILABLE:
        return 'Tài khoản đăng nhập không tồn tại. Vui lòng liên hệ sme.support@vpbank.com.vn để được hỗ trợ.';
      case DialogType.WRONGPASSWORD:
        return 'Mật khẩu đăng nhập không chính xác. Bạn còn 03 lần đăng nhập trước khi bị khóa.';
      case DialogType.ACCOUNTLOCKED:
        return 'Tài khoản đăng nhập đã bị khóa. Vui lòng liên hệ sme.support@vpbank.com.vn để được hỗ trợ.';
      case DialogType.SIGNOUT:
        return 'Tài khoản của bạn sẽ bị đăng xuất khỏi hệ thống.';
      case DialogType.SESSIONEXPRIED:
        return 'Vui lòng đăng nhập lại để tiếp tục sử dụng dịch vụ.';
      default:
        return '';
    }
  }
}

enum DialogType {
  ACCOUNTNOTAVAILABLE,
  WRONGPASSWORD,
  ACCOUNTLOCKED,
  SIGNOUT,
  SESSIONEXPRIED
}
