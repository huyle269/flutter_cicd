import 'package:crm_app/core/extensions/color_palette.dart';
import 'package:flutter/material.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    Key? key,
    required this.title,
    required this.child,
    this.actions,
    this.gradientColor = ColorPalette.linearStatusBar,
    this.titleStyle,
  }) : super(key: key);
  final String title;
  final Gradient? gradientColor;
  final List<Widget>? actions;
  final TextStyle? titleStyle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: gradientColor,
          ),
        ),
        title: Text(title),
        centerTitle: true,
        actions: actions,
      ),
      body: child,
    );
  }
}
