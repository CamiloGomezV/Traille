import 'package:flutter/material.dart';
import 'package:flutter_application_1/intro_screen/screen1.dart';
import 'package:flutter_application_1/intro_screen/screen2.dart';
import 'package:flutter_application_1/intro_screen/screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage>{
  PageController _controller = PageController();

  bool onLastPage = false;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: ((index) {
              setState(() {
                onLastPage = (index == 2);
              });
            }),
            children: [
              screen1(),
              screen2(),
              screen3(),
            ],
          ),
          Container(
            alignment: Alignment(0,0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text("Cerrar", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),),
                ),
                SmoothPageIndicator(controller: _controller, count: 3, effect: WormEffect(dotColor: Colors.grey,activeDotColor:  Color(0xFF15CCBD)),),
                onLastPage

                  ? GestureDetector(
                    onTap: () {
                      _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                    },
                    child: Text("Comenzar",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),),
                  )
                  : GestureDetector(
                    onTap: () {
                      _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                    },
                    child: Text("Continuar",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

