import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:crm_app/representation/widgets/app_bar_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      title: 'Hôm nay',
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300.toScreenSize,
              height: 180.toScreenSize,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
