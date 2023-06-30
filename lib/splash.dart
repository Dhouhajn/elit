import 'dart:ui';

import 'package:flutter/material.dart';

// import 'home.dart';
import 'login.dart';
import 'package:rive/rive.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 8000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage(title: 'ISE',)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: Center(
     child: Stack(
          children: [
            Positioned(
             width: MediaQuery.of(context).size.width * 1.9,
              // left: 50,
              bottom: 100,
              child: Image.asset(
                "assets/Backgrounds/Spline.png",
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: const SizedBox(),
              ),
            ),
            const RiveAnimation.asset(
               "assets/RiveAssets/on.riv",
              //  "assets/RiveAssets/onboding_animation.riv",
              // "assets/RiveAssets/shapes.riv",
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: const SizedBox(),
              ),
            ),
            AnimatedPositioned(
              // top: isShowSignInDialog ? -50 : 0,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              duration: const Duration(milliseconds: 260),
              child: SafeArea(
                // child: Padding(
                  // padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                            Column(
                            children: List.generate(6, (_) => SizedBox(height: 32)),
                          ),

                      SizedBox(
                        width: 300,
                        child: Column(
                          children:  [
                            // Positioned(
                              Center(
                             child: Image.asset(
                               "assets/icons/images.png",
                               ),
                            ),
                           
                          ],
                        ),
                      ),
         
                    ],
                  ),
                // ),
              ),
            ),
          ],
        ),
   ),
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(
      //         // height:100,
      //         // width:100, 
      //         // color: Colors.blue,
      //          // height: 50,
      //       // width: MediaQuery.of(context).size.width * 1.7,
      //       width: MediaQuery.of(context).size.width ,
      //       // left: 50,
      //       // bottom: 100,
      //       child: Image.asset(
      //         "assets/Backgrounds/Spline.png",
      //       ),
      //       ),
      //       Container(
      //         child: BackdropFilter(
      //         filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      //         child: const SizedBox(),
      //       ),
      //       ),
      //       Container(
      //       //     child: Text(
      //       //   'Splash Screen',
      //       //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      //       // )
      //       child: const RiveAnimation.asset(
      //        "assets/RiveAssets/on.riv",
      //       ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
