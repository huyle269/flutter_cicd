import 'package:crm_app/representation/widgets/app_bar_container.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({Key? key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      title: 'Công việc',
      child: Container(),
    );
  }
}