import 'package:crm_app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    Key? key,
    required this.imagePath,
    this.fillColor,
    this.sizeIcon = kSizeIcon,
    this.boxFit = BoxFit.cover,
    this.isUseSvg = true,
  }) : super(key: key);

  final String imagePath;
  final Color? fillColor;
  final double? sizeIcon;
  final BoxFit boxFit;
  final bool isUseSvg;

  @override
  Widget build(BuildContext context) {
    return isUseSvg
        ? SvgPicture.asset(
            imagePath,
            color: fillColor,
            width: sizeIcon,
            height: sizeIcon,
            fit: boxFit,
          )
        : Image.asset(
            imagePath,
            color: fillColor,
            width: sizeIcon,
            height: sizeIcon,
            fit: boxFit,
          );
  }
}
