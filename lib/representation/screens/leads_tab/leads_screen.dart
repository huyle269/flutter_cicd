import 'package:crm_app/representation/widgets/app_bar_container.dart';
import 'package:flutter/material.dart';

class LeadScreen extends StatefulWidget {
  LeadScreen({Key? key}) : super(key: key);

  @override
  _LeadScreenState createState() => _LeadScreenState();
}

class _LeadScreenState extends State<LeadScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      title: 'Leads',
      child: Container(),
    );
  }
}
