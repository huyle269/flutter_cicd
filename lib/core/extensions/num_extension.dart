import 'package:crm_app/core/app_config/size_config.dart';

const double screenWidthInDesign = 375.0;
const double screenHeightInDesign = 812.0;

extension ExtendedNumber on num {
  double get toScreenSize {
    double designRatio = screenWidthInDesign / screenHeightInDesign;
    double deviceRatio = SizeConfig.screenWidth / SizeConfig.screenHeight;
    if (deviceRatio <= designRatio) {
      return (this / screenWidthInDesign) * SizeConfig.screenWidth;
    } else {
      return (this / screenHeightInDesign) * SizeConfig.screenHeight;
    }
    // return (this / screenWidthInDesign) * SizeConfig.screenWidth;
  }

  double get toScreenWidthHeight {
    double designRatio =
        screenWidthInDesign / screenHeightInDesign; // iphone 12 pro max
    return (this * designRatio) / SizeConfig.sizeRatio;
  }
}
