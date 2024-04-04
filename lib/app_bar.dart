import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constents/commen_styles.dart';
import '../../../constents/commen_widgets.dart';
import 'common/gradient_text_widget.dart';



class CustomAppBar extends StatefulWidget {
  final bool lightMode;
  final String? leftSideIcon;
  final String? rightSideIcon;
  final Color? backgroundColor;
  final Color? sliderColor;
  final double? shadow;

  const CustomAppBar(
      {super.key,
        this.lightMode = false,
        this.leftSideIcon,
        this.rightSideIcon,
        this.backgroundColor,
        this.sliderColor,
        this.shadow});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    String assets = "lib/app_bar/assets/";

    return Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: widget.backgroundColor,
            decoration: widget.lightMode
                ? null
                : CommonWidgets.imageDecoration("${assets}Frame 123.png"),
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 16, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  widget.leftSideIcon != null
                      ? widget.leftSideIcon!
                      : "${assets}eva_arrow-back-fill.svg",
                  color: widget.lightMode ? Colors.black : null,
                ),
                SvgPicture.asset(
                  widget.rightSideIcon != null
                      ? widget.rightSideIcon!
                      : "${assets}Settings.svg",
                  color: widget.lightMode ? Colors.black : null,
                ),
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Delhi",
                    style: CommonStyle.metropolis15W800(
                        color: !widget.lightMode ? Colors.white : Colors.black),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: !widget.lightMode ? Colors.white : Colors.black,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 206,
                height: 56,
                decoration: BoxDecoration(
                    color: widget.sliderColor ?? const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff38113F)
                              .withOpacity(widget.shadow ?? 0.15),
                          offset: const Offset(0, 10),
                          blurRadius: 20),
                      BoxShadow(
                          color: const Color(0xffFAF6FB).withOpacity(0.2),
                          offset: const Offset(0, -10),
                          blurRadius: 20),
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: CarouselSlider(
                    carouselController: buttonCarouselController,
                    options:
                    CarouselOptions(viewportFraction: 1, autoPlay: true,autoPlayAnimationDuration: const Duration(seconds:1),autoPlayInterval: const Duration(seconds: 3) ),
                    items: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffF3EDF4),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0xffDFD3E1),
                                        offset: Offset(5, 5),
                                        blurRadius: 10),
                                    BoxShadow(
                                        color: Color(0xffffffff),
                                        offset: Offset(-5, -5),
                                        blurRadius: 20),
                                  ]),
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset(
                                "${assets}Hospital Location (1).svg",
                                fit: BoxFit.scaleDown,
                                height: 15,
                                width: 15,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GradientText("50",
                                    style: CommonStyle.metropolis13W900(),
                                    gradient: const LinearGradient(colors: [
                                      Color(0xffAD37E0),
                                      Color(0xffEE2B3B),
                                    ])
                                ),
                                Text(
                                  "Cities",
                                  style: CommonStyle.metropolis11W700(),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffF3EDF4),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0xffDFD3E1),
                                        offset: Offset(5, 5),
                                        blurRadius: 10),
                                    BoxShadow(
                                        color: Color(0xffffffff),
                                        offset: Offset(-5, -5),
                                        blurRadius: 20),
                                  ]),
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset(
                                "${assets}doctor (1).svg",
                                fit: BoxFit.scaleDown,
                                height: 15,
                                width: 15,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GradientText("60",
                                    style: CommonStyle.metropolis13W900(),
                                    gradient: const LinearGradient(colors: [
                                      Color(0xffAD37E0),
                                      Color(0xffEE2B3B),
                                    ])),
                                Text(
                                  "Clinics",
                                  style: CommonStyle.metropolis11W700(),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffF3EDF4),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0xffDFD3E1),
                                        offset: Offset(5, 5),
                                        blurRadius: 10),
                                    BoxShadow(
                                        color: Color(0xffffffff),
                                        offset: Offset(-5, -5),
                                        blurRadius: 20),
                                  ]),
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset(
                                "${assets}doctor (1).svg",
                                fit: BoxFit.scaleDown,
                                height: 15,
                                width: 15,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GradientText("1 Lakh",
                                    style: CommonStyle.metropolis13W900(),
                                    gradient: const LinearGradient(colors: [
                                      Color(0xffAD37E0),
                                      Color(0xffEE2B3B),
                                    ])),
                                Text(
                                  "Patients treated",
                                  style: CommonStyle.metropolis11W700(),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      );
  }
}
