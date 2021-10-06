import 'package:crm_app/core/extensions/color_extension.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final ButtonStyle? style;
  final Gradient? gradient;
  final double thickness;
  final double? width;
  final double? height;

  const GradientButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.style,
    this.gradient,
    this.thickness = 0,
    this.width = double.infinity,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultGradient = LinearGradient(
      colors: <Color>[
        HexColors.fromHex('5FA6E3'),
        HexColors.fromHex('0060BD'),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    return Container(
      width: width ?? double.infinity,
      height: height ?? 56.0,
      margin: EdgeInsets.all(thickness),
      decoration: BoxDecoration(
        gradient: gradient ?? defaultGradient,
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        style: style ??
            OutlinedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: EdgeInsets.all(0),
            ),
        child: child,
      ),
    );
  }
}
