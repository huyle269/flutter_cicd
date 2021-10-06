import 'package:crm_app/representation/widgets/app_bar_container.dart';
import 'package:flutter/material.dart';

class StatisticScreen extends StatefulWidget {
  StatisticScreen({Key? key}) : super(key: key);

  @override
  _StatisticScreenState createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      title: 'Thống kê',
      child: Container(),
    );
  }
}
