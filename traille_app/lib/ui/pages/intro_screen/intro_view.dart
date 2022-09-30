import 'package:flutter/material.dart';
import 'package:traille_app/ui/pages/intro_screen/screen0.dart';
import 'package:traille_app/ui/pages/intro_screen/screen1.dart';
import 'package:traille_app/ui/pages/intro_screen/screen2.dart';
import 'package:traille_app/ui/pages/intro_screen/screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:traille_app/utils/responsive/responsive.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final PageController _controller = PageController();

  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context: context);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: ((index) {
              setState(() {
                onLastPage = (index == 3);
              });
            }),
            children: const [
              Screen0(),
              Screen1(),
              Screen2(),
              Screen3(),
            ],
          ),
          Container(
            alignment: Alignment(0, responsive.hp(0.1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/bluetooth', (Route<dynamic> route) => false);
                  },
                  child: Text(
                    "Saltar",
                    style: TextStyle(
                      fontSize: responsive.wp(4),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: const WormEffect(
                      dotColor: Colors.grey, activeDotColor: Color(0xFF15CCBD)),
                ),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/bluetooth', (Route<dynamic> route) => false);
                        },
                        child: Text(
                          "Comenzar",
                          style: TextStyle(
                            fontSize: responsive.wp(4),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          "Continuar",
                          style: TextStyle(
                            fontSize: responsive.wp(4),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
