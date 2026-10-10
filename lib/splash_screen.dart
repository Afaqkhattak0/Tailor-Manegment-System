import 'package:flutter/material.dart';
import 'package:tailor_manegment/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  //=========================================================
  //                 LOADING ANIMATION
  //=========================================================

  late AnimationController loadingController;

  //=========================================================
  //                    DOT ANIMATION
  //=========================================================

  late AnimationController dotController;

  @override
  void initState() {
    super.initState();

    //=======================================================
    //              LOADING LINE CONTROLLER
    //=======================================================
    // 3 seconds mein loading line 0 se 100% hogi.

    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Loading complete hone par HomeScreen open hogi.
    loadingController.forward().whenComplete(() {

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });

    //=======================================================
    //                  DOT CONTROLLER
    //=======================================================
    // 3 dots continuously animate karenge.

    dotController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {

    // Controllers ko dispose karna zaroori hai.
    loadingController.dispose();
    dotController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            //=================================================
            //                 MAIN CONTENT
            //=================================================
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //=================================================
                  //                    APP ICON
                  //=================================================
                  Container(
                    height: 150,
                    width: 150,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),

                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,

                        colors: [
                          Color(0xff2563EB),
                          Color(0xff1D4ED8),
                        ],
                      ),

                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x402563EB),
                          blurRadius: 20,
                          spreadRadius: 2,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),

                    child: const Center(
                      child: Icon(
                        Icons.content_cut,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  //=================================================
                  //                   APP NAME
                  //=================================================
                  const Text(
                    "Tailor",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff0F172A),
                    ),
                  ),
                  const Text(
                    "Measurement",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 44,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff2563EB),
                    ),
                  ),
                  const SizedBox(height: 30),
                  //=================================================
                  //                    SUBTITLE
                  //=================================================
                  const Text(
                    "Save Customer Measurements\nEasily",
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff64748B),
                    ),
                  ),
                  const SizedBox(height: 60),
                  //=================================================
                  //                 ANIMATED DOTS
                  //=================================================
                  AnimatedBuilder(
                    animation: dotController,
                    builder: (context, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildDot(0),
                          const SizedBox(width: 15),
                          _buildDot(1),
                          const SizedBox(width: 15),
                          _buildDot(2),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  //=================================================
                  //              ANIMATED LOADING BAR
                  //=================================================
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    child: AnimatedBuilder(
                      animation: loadingController,
                      builder: (context, child) {
                        return Container(
                          height: 10,
                          width: double.infinity,

                          decoration: BoxDecoration(
                            color: const Color(0xffE2E8F0),
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Align(
                            alignment: Alignment.centerLeft,

                            child: FractionallySizedBox(
                              widthFactor:
                              loadingController.value,

                              child: Container(
                                height: 10,

                                decoration: BoxDecoration(
                                  color: const Color(0xff2563EB),
                                  borderRadius:
                                  BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  //=================================================
                  //                 LOADING TEXT
                  //=================================================
                  AnimatedBuilder(
                    animation: loadingController,

                    builder: (context, child) {

                      int percentage =
                      (loadingController.value * 100).round();

                      return Text(
                        "Loading... $percentage%",
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff64748B),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //=========================================================
  //                  DOT BUILDER
  //=========================================================

  Widget _buildDot(int index) {

    // Har dot ka animation thora different time par chalega.
    double value =
        (dotController.value * 3 - index) % 3;

    // Dot ko smoothly up/down move karna.
    double scale = 1.0;

    if (value < 1) {
      scale = 1.0 + (value * 0.5);
    } else if (value < 2) {
      scale = 1.5 - ((value - 1) * 0.5);
    }

    return Transform.scale(
      scale: scale,

      child: Container(
        height: 14,
        width: 14,

        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff2563EB),
        ),
      ),
    );
  }
}