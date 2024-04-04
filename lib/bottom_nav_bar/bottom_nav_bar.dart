import 'package:flutter/material.dart';
import 'package:flutter_application_1/constents/commen_styles.dart';
import 'dart:ui' as ui;

import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  String selectedIcon="home";
  @override
  Widget build(BuildContext context) {
    String assets = "lib/bottom_nav_bar/assets/";
    return Container(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 46),
            child: CustomPaint(
              size: const Size(68, 68),
              //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RPSCustomPainterCircle(),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SvgPicture.asset("${assets}plus.svg"),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              color: Colors.transparent,
              child: CustomPaint(
                size: const Size(0, 0),
                painter: RPSCustomPainter(),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 35,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: (){
                              setState((){
                                selectedIcon="home";
                              });

                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("${assets}home.svg"),
                                const SizedBox(height: 5),
                                Text("Home",style: CommonStyle.metropolis10W900(color: Colors.white),)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: (){
                              setState((){
                                selectedIcon="bill";
                              });

                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("${assets}bill.svg"),
                                const SizedBox(height: 5),
                                Text("Booking",style: CommonStyle.metropolis10W900(color: Colors.white),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: (){
                              setState((){
                                selectedIcon="call";
                              });

                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("${assets}call.svg"),
                                const SizedBox(height: 5),
                                Text("Call",style: CommonStyle.metropolis10W900(color: Colors.white),)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: (){
                              setState((){
                                selectedIcon="account";
                              });

                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("${assets}account.svg"),
                                const SizedBox(height: 5),
                                Text("Account",style: CommonStyle.metropolis10W900(color: Colors.white),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.5875000);
    path_0.cubicTo(
        size.width * 0.5411519,
        size.height * 0.5875000,
        size.width * 0.5770164,
        size.height * 0.4663963,
        size.width * 0.5958224,
        size.height * 0.2871688);
    path_0.cubicTo(size.width * 0.6109836, size.height * 0.1426912,
        size.width * 0.6349182, 0, size.width * 0.6658879, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, 0);
    path_0.lineTo(size.width * 0.3341121, 0);
    path_0.cubicTo(
        size.width * 0.3650818,
        0,
        size.width * 0.3890164,
        size.height * 0.1426925,
        size.width * 0.4041776,
        size.height * 0.2871688);
    path_0.cubicTo(
        size.width * 0.4229836,
        size.height * 0.4663963,
        size.width * 0.4588481,
        size.height * 0.5875000,
        size.width * 0.5000000,
        size.height * 0.5875000);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(const Offset(0, 0),
        Offset(size.width * 0.1288925, size.height * 2.361100), [
      const Color(0xffAD37E0).withOpacity(1),
      const Color(0xffEE2B3B).withOpacity(1)
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainterCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        const Offset(0, 0),
        Offset(size.width * 1.163450, size.height * 0.7446088),
        [const Color(0xffAD37E0).withOpacity(1), const Color(0xffEE2B3B).withOpacity(1)],
        [0, 1]);
    canvas.drawCircle(Offset(size.width * 0.5000000, size.height * 0.5000000),
        size.width * 0.5000000, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
