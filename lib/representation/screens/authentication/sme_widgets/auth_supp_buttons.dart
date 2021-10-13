import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:flutter/material.dart';

class AuthSuppButton extends StatefulWidget {
  const AuthSuppButton(
      {Key? key,
      required this.notifications,
      required this.icon,
      required this.name,
      required this.onTapButton})
      : super(key: key);
  final int notifications;
  final String icon;
  final String name;
  final VoidCallback onTapButton;
  @override
  _AuthSuppButtonState createState() => _AuthSuppButtonState();
}

class _AuthSuppButtonState extends State<AuthSuppButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.onTapButton,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.toScreenSize),
            padding: EdgeInsets.all(8.toScreenSize),
            width: 48.toScreenSize,
            height: 48.toScreenSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0.5, 0.5), // changes position of shadow
                ),
              ],
            ),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    widget.icon,
                    width: 22.toScreenSize,
                    height: 22.toScreenSize,
                  ),
                ),
                widget.notifications > 0
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 16.toScreenSize,
                          height: 16.toScreenSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                                color: Colors.white, width: 2.toScreenSize),
                            color: Color(0xffFF6763),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            widget.notifications.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 8),
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.toScreenSize),
          child: Text(
            widget.name,
            style: TextStyle(
                color: Color(0xff666666),
                fontSize: 13,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
