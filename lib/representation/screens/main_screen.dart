import 'dart:async';

import 'package:crm_app/core/constants/constants.dart';
import 'package:crm_app/core/extensions/color_palette.dart';
import 'package:crm_app/representation/screens/other_tab/other_screen.dart';
import 'package:crm_app/representation/screens/statistic_tab/statistic_screen.dart';
import 'package:crm_app/representation/screens/task_tab/task_screen.dart';
import 'package:crm_app/representation/widgets/icon_widget.dart';
import 'package:crm_app/ultilities/image_helper/asset_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_tab/home_screen.dart';
import 'leads_tab/leads_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);
  static String routeName = 'MainScreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final StreamController<int> _tabBarStreamController = StreamController<int>.broadcast();

  final bottomBarData = [
    {
      'title': 'Hôm nay',
      'icon': const Padding(
        padding: EdgeInsets.only(bottom: kMinPadding),
        child: IconWidget(imagePath: AssetHelper.ico_home_svg),
      ),
      'active_icon': const Padding(
        padding: EdgeInsets.only(bottom: kMinPadding),
        child: IconWidget(imagePath: AssetHelper.ico_home_svg, fillColor: ColorPalette.primaryColor),
      ),
    },
    {
      'title': 'Lead',
      'icon': const Padding(
        padding: EdgeInsets.only(bottom: kMinPadding),
        child: IconWidget(imagePath: AssetHelper.ico_lead_svg),
      ),
      'active_icon': const Padding(
        padding: EdgeInsets.only(bottom: kMinPadding),
        child: IconWidget(imagePath: AssetHelper.ico_lead_svg, fillColor: ColorPalette.primaryColor),
      ),
    },
    {
      'title': 'Công việc',
      'icon': const Padding(
        padding: EdgeInsets.only(bottom: kMinPadding),
        child: IconWidget(imagePath: AssetHelper.ico_task_svg),
      ),
      'active_icon': const Padding(
        padding: EdgeInsets.only(bottom: kMinPadding),
        child: IconWidget(imagePath: AssetHelper.ico_task_svg, fillColor: ColorPalette.primaryColor),
      ),
    },
    {
      'title': 'Thống Kê',
      'icon': const Padding(
        padding: EdgeInsets.only(bottom: kMinPadding),
        child: IconWidget(imagePath: AssetHelper.ico_statistic_svg),
      ),
      'active_icon': const Padding(
        padding: EdgeInsets.only(bottom: kMinPadding),
        child: IconWidget(imagePath: AssetHelper.ico_statistic_svg, fillColor: ColorPalette.primaryColor),
      ),
    },
    {
      'title': 'Khác',
      'icon': const Padding(
        padding: EdgeInsets.only(bottom: kMinPadding),
        child: IconWidget(imagePath: AssetHelper.ico_other_svg),
      ),
      'active_icon': const Padding(
        padding: EdgeInsets.only(bottom: kMinPadding),
        child: IconWidget(imagePath: AssetHelper.ico_other_svg, fillColor: ColorPalette.primaryColor),
      ),
    },
  ];

  static List<Widget> _pages = <Widget>[
    HomeScreen(),
    LeadScreen(),
    TaskScreen(),
    StatisticScreen(),
    OtherScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<int>(
        initialData: 0,
        stream: _tabBarStreamController.stream,
        builder: (context, snapshot) {
          return IndexedStack(
            index: snapshot.data!,
            children: _pages,
          );
        },
      ),
      bottomNavigationBar: StreamBuilder<int>(
        initialData: 0,
        stream: _tabBarStreamController.stream,
        builder: (context, snapshot) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              _tabBarStreamController.add(index);
            },
            items: bottomBarData
                .map(
                  (tab) => BottomNavigationBarItem(
                    icon: tab['icon'] as Widget,
                    label: tab['title'] as String,
                    activeIcon: tab['active_icon'] as Widget,
                  ),
                )
                .toList(),
            currentIndex: snapshot.data!,
            selectedItemColor: ColorPalette.primaryColor,
          );
        },
      ),
    );
  }
}
