import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/common/gradient_text_widget.dart';
import 'package:flutter_application_1/constents/commen_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_bar/app_bar.dart';
import '../bottom_nav_bar/bottom_nav_bar.dart';
import '../constents/commen_styles.dart';
import '../home/side_bar/side_bar_widget.dart';

class PaymentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PaymentWidgetState();
  }
}

class PaymentWidgetState extends State<PaymentWidget>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  late double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _menuScaleAnimation;
  late Animation<Offset> _slideAnimation;

  final _scrollController = ScrollController();
  double _currentOffset = 0.0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark // Set your desired color
        ));

    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  callback() {
    setState(() {
      if (_scrollController.offset != 0) {
        _currentOffset = _scrollController.offset;
      }

      if (isCollapsed) {
        _controller.forward();
      } else {
        _controller.reverse();
      }

      isCollapsed = !isCollapsed;

      if (isCollapsed) {
        _scrollController.animateTo(_currentOffset,
            duration: const Duration(microseconds: 10), curve: Curves.easeIn);
      } else {
        _scrollController.animateTo(0.0,
            duration: const Duration(microseconds: 10), curve: Curves.easeIn);
      }

      print("pressed");
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF2ECF3),
      extendBody: true,
      bottomNavigationBar: !isCollapsed ? null : const BottomNavBar(),
      body: Stack(
        children: <Widget>[
          SideBarWidget(
            callback: callback,
          ),
          content(context),
        ],
      ),
    );
  }

  Widget content(context) {
    String assets = "lib/payment/assets/";
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: Colors.white,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(40)),
            child: CustomAppBar(
              isCollapsed: isCollapsed,
              callback: callback,
              sliderColor: const Color(0xffF3EDF4),
              backgroundColor: const Color(0xFFF2ECF3),
              lightMode: true,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: isCollapsed
                      ? const AlwaysScrollableScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  child: Container(
                    color: const Color(0xFFF2ECF3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: Stack(
                            children: [
                              Image.asset(
                                '${assets}Group 1 (15).png',
                                width: MediaQuery.of(context).size.width,
                              ),
                              const Positioned(
                                left: 45,
                                top: 35,
                                child: Text(
                                  "Evelyn Tylor",
                                  style: TextStyle(
                                    fontFamily: "Metropolis",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Positioned(
                                left: 45,
                                top: 75,
                                child: Text(
                                  "3215    6584    8468    5888",
                                  style: TextStyle(
                                    fontFamily: "Metropolis",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Positioned(
                                left: 45,
                                top: 115,
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Expire",
                                          style: TextStyle(
                                            fontFamily: "Metropolis",
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "12/24",
                                          style: TextStyle(
                                            fontFamily: "Metropolis",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Positioned(
                                left: 172,
                                top: 115,
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "CVV",
                                          style: TextStyle(
                                            fontFamily: "Metropolis",
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "229",
                                          style: TextStyle(
                                            fontFamily: "Metropolis",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  right: 40,
                                  top: 20,
                                  child: SvgPicture.asset(
                                    "${assets}Wifi.svg",
                                    height: 34,
                                    width: 34,
                                    fit: BoxFit.scaleDown,
                                  )),
                              Positioned(
                                  right: 40,
                                  bottom: 60,
                                  child: SvgPicture.asset(
                                    "${assets}Visa.svg",
                                    height: 75,
                                    width: 75,
                                    fit: BoxFit.scaleDown,
                                  ))
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            'Choose Payment',
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            'Method',
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 500,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/payment_method.png',
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 45,
                                  vertical: 15,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Pay Cash",
                                      style: TextStyle(
                                        fontFamily: "Metropolis",
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      '${assets}money withdrawal.svg',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 45,
                                  vertical: 95,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    notAvailable(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Debit / Credit Card",
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF252525),
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        '${assets}Credit Card.svg',
                                        width: 24,
                                        height: 24,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 45,
                                  vertical: 172,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    notAvailable(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "UPI",
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF252525),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            '${assets}Frame 146.png',
                                            width: 24,
                                            height: 24,
                                          ),
                                          Image.asset(
                                            '${assets}Frame 144.png',
                                            width: 24,
                                            height: 24,
                                          ),
                                          Image.asset(
                                            '${assets}Frame 143.png',
                                            width: 24,
                                            height: 24,
                                          ),
                                          Image.asset(
                                            '${assets}Frame 145.png',
                                            width: 24,
                                            height: 24,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 45,
                                  right: 45,
                                  top: 248,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    notAvailable(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Wallet",
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF252525),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            '${assets}Frame 142.png',
                                            width: 24,
                                            height: 24,
                                          ),
                                          Image.asset(
                                            '${assets}Frame 143 (1).png',
                                            width: 24,
                                            height: 24,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 45,
                                  right: 45,
                                  top: 328,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    notAvailable(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Net Banking",
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF252525),
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        '${assets}Union (1).svg',
                                        width: 24,
                                        height: 24,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void notAvailable(BuildContext context) {
    String assets = "lib/payment/assets/";

    showDialog(
        context: context,
        barrierColor: const Color(0xffF2F7FB).withOpacity(0.5),
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Dialog(
              backgroundColor: const Color(0xffF3EDF4),
              insetPadding: const EdgeInsets.symmetric(horizontal: 25),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)), //this right here
              child: SizedBox(
                height: 316,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 55,
                              ),
                              GradientText(
                                "Sorry!",
                                style: CommonStyle.metropolis36W800(),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFAD37E0),
                                    Color(0xFFEE2B3B),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text.rich(TextSpan(children: [
                                TextSpan(
                                    text:
                                        "This option is not\navailable, Choose\n",
                                    style: CommonStyle.metropolis16W500()),
                                TextSpan(
                                    text: "Cash",
                                    style: CommonStyle.metropolis16W800()),
                                TextSpan(
                                    text: "instead",
                                    style: CommonStyle.metropolis16W500()),
                              ])),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10, left: 20),
                          height: 62,
                          width: 102,
                          decoration: CommonWidgets.imageDecoration(
                              "${assets}Group 37.png"),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(bottom: 25),
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Cash",
                                  style: CommonStyle.metropolis16W900(
                                      color: Colors.white),
                                ),
                              )),
                        ),
                      ],
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          "$assetsÑëîé_2.png",
                          height: 270,
                          width: 172,
                          fit: BoxFit.fill,
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
