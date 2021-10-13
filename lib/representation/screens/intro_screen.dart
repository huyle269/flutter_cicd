import 'package:crm_app/core/constants/constants.dart';
import 'package:crm_app/representation/screens/authentication/sme_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key? key}) : super(key: key);

  static String routeName = 'IntroScreen';

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "GENERAL",
        description:
            "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        styleDescription: TextStyle(color: Color(0xff000000)),
        pathImage: "assets/images/intro_1.jpg",
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        title: "MANAGE CUSTOMER",
        description:
            "Ye indulgence unreserved connection alteration appearance",
        styleDescription: TextStyle(color: Color(0xff000000)),
        pathImage: "assets/images/intro_2.jpg",
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        title: "ANALYSIS",
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        styleDescription: TextStyle(color: Color(0xff000000)),
        pathImage: "assets/images/intro_3.jpg",
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        title: "REPORT",
        description: "And something else...",
        styleDescription: TextStyle(color: Color(0xff000000)),
        pathImage: "assets/images/intro_4.jpg",
        backgroundColor: Colors.white,
      ),
    );
  }

  void onDonePress() async {
    // jump to login, dont show intro next time
    var box = await Hive.openBox(HiveKeys.boxName);
    box.put(HiveKeys.ignoreIntro, true);
    print("End of slides");
    // Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    Navigator.pushReplacementNamed(context, SMELoginScreen.routeName);
  }

  void onSkipPress() async {
    // jump to login, keep showing intro next time
    var box = await Hive.openBox(HiveKeys.boxName);
    box.put(HiveKeys.ignoreIntro, false);
    print("Ignore slides");
    // Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    Navigator.pushReplacementNamed(context, SMELoginScreen.routeName);
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
      overlayColor: MaterialStateProperty.all<Color>(Color(0x33ffcc5c)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      backgroundColorAllSlides: Colors.white,
      slides: this.slides,
      onDonePress: this.onDonePress,
      doneButtonStyle: myButtonStyle(),
      onSkipPress: this.onSkipPress,
      skipButtonStyle: myButtonStyle(),
    );
  }
}
