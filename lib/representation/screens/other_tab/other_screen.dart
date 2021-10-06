import 'package:crm_app/representation/widgets/app_bar_container.dart';
import 'package:flutter/material.dart';

class OtherScreen extends StatefulWidget {
  OtherScreen({Key? key}) : super(key: key);

  @override
  _OtherScreenState createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      title: 'Khác',
      child: Container(),
    );
  }
}
