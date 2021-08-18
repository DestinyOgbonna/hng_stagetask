import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';


import 'homepage.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);


  //method created to skip the welcome screens.
  void skipWelcome(context) {
   Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context) => const Homepage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(

        // displaying/styling the necessary buttons for the welcomeScreen
        showDoneButton: true,
        showNextButton: true,
        showSkipButton: true,

        next: const Icon(
          Icons.navigate_next_rounded, size: 41, color: Color(0xff000000),),
        done: Text('Done', style: GoogleFonts.montserrat(fontSize: 19,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF000000)),),
        skip: Text('Skip', style: GoogleFonts.montserrat(fontSize: 19,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF000000)),),
        skipFlex: 0,
        nextFlex: 0,
        // on clicking the done/skip button move to the homepage
        onDone: (){
          skipWelcome(context);
        },

        onSkip: (){
          skipWelcome(context);
        },
        // =====================Setting the display in the welcome Pages=================
        pages:[
          PageViewModel(
            image: Image.asset('images/hnglogo.png', height: 150, width: 200),
            title: 'Welcome to the Hng Task 2',
            body: 'Impact',
            decoration: PageDecoration(
                pageColor:const Color(0xFFFFFAFA),
                titleTextStyle: GoogleFonts.montserrat(fontSize: 40,
                    fontWeight: FontWeight.w800),
                bodyTextStyle: GoogleFonts.montserrat(fontSize: 19,
                    fontWeight: FontWeight.w300)
            ),
          ),

          PageViewModel(
            image: Image.asset('images/zurilogo.png', height: 150, width: 200),
            title: 'Sponsored by the Zuri Team',
            body: 'Learn, Build, Grow',
            decoration: PageDecoration(
                pageColor:const Color(0xFFFFFAFA),
                titleTextStyle: GoogleFonts.montserrat(fontSize: 40,
                    fontWeight: FontWeight.w800),
                bodyTextStyle: GoogleFonts.montserrat(fontSize: 19,
                    fontWeight: FontWeight.w300)
            ),
          ),
        ],

//==========================Styling the Navigation Dots ===========================
        dotsDecorator: const DotsDecorator(
          size: Size(5.0, 4.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          color: Color(0xFFFFFAFA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
