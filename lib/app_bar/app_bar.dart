import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../common/gradient_text_widget.dart';
import '../constents/commen_styles.dart';
import '../constents/commen_widgets.dart';
import '../home/side_bar/side_bar_widget.dart';
import '../main.dart';
import 'package:http/http.dart' as http;

class CustomAppBar extends StatefulWidget {
  final Widget child;
  final bool lightMode;
  final String? leftSideIcon;
  final String? rightSideIcon;
  final Color? backgroundColor;
  final Color? sliderColor;
  final double? shadow;
  final Function callback;
  final bool isCollapsed;

  const CustomAppBar(
      {super.key,
      required this.child,
      this.lightMode = false,
      this.leftSideIcon,
      this.rightSideIcon,
      this.backgroundColor,
      this.sliderColor,
      this.shadow,
      required this.callback,
      required this.isCollapsed});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  CarouselController buttonCarouselController = CarouselController();
  final TextEditingController cityFieldController = TextEditingController();
  List cities = [];

  bool showCityPicker = false;
  bool cityNotFound = true;
  String city = '';

  getCitiesByCountry(country) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://api.geonames.org/searchJSON?q=$country&featureClass=P&type=json&username=pankajvaishnav'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      List resp = jsonDecode(await response.stream.bytesToString())['geonames'];
      setState(() {
        cities = resp;
        cities.sort((a, b) => a['name'].compareTo(b['name']));
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  selectCity(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width - 32,
          height: 566,
          child: AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 16),
            contentPadding: const EdgeInsets.all(8),
            // title: Text("Alert Dialog"),
            content: StatefulBuilder(builder: (context, setState) {
              return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 536,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/choose-location.png",
                          width: double.infinity,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          // padding:
                          // const EdgeInsets.only(left: 20, right: 20, bottom: 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: HexColor("#FAE2F0")),
                          child: SizedBox(
                            height: 273,
                            child: cityNotFound &&
                                    cityFieldController.text.isNotEmpty
                                ? Center(
                                    child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text: "City not found !\n",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white
                                                    .withOpacity(.5)),
                                          ),
                                          TextSpan(
                                            text:
                                                "You can type manually to save your city name",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white
                                                    .withOpacity(.5)),
                                          ),
                                          // TextSpan(text: '\'${cityFieldController.text}\'',
                                          // style:  TextStyle(
                                          //   fontSize: 18,
                                          //   fontWeight: FontWeight.w700,
                                          //   color: Colors.white.withOpacity(.5)
                                          // ),),
                                          // TextSpan(text: " for you",
                                          // style:  TextStyle(
                                          //   fontSize: 16,
                                          //   fontWeight: FontWeight.w500,
                                          //   color: Colors.white.withOpacity(.5)
                                          // ),),
                                        ])),
                                  )
                                : ListView.builder(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 20),
                                    shrinkWrap: true,
                                    itemCount: cities.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          selectedCity.toLowerCase() ==
                                                  cities[index]['name']
                                                      .toString()
                                                      .toLowerCase()
                                              ? Text(
                                                  cities[index]['name'],
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                )
                                              : SizedBox(
                                                  width: double.infinity,
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      setState(() {
                                                        city = selectedCity;
                                                        cityNotFound = false;
                                                        selectedCity =
                                                            cities[index]
                                                                ['name'];

                                                        cityFieldController
                                                                .text =
                                                            selectedCity;
                                                      });

                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  1000));

                                                      setState(() {
                                                        showCityPicker = false;
                                                      });
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Text(
                                                      cities[index]['name'],
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: HexColor(
                                                              "#D972AE")),
                                                    ),
                                                  ),
                                                ),
                                          Divider(
                                            color: HexColor("#F5D3E7"),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Image.asset(
                                    'assets/images/shadow-grd.png',
                                    width: 124,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/save-grd.png',
                                        width: 124,
                                      ),
                                      const Text(
                                        "Save",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ));
            }),
          ),
        );
      },
    ).then((value) {
      setState(() {
        city = selectedCity;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      city = selectedCity;
    });
    getCitiesByCountry(selectedCountry);
  }

  @override
  Widget build(BuildContext context) {
    return content(context);
  }

  Widget content(context) {
    String assets = "lib/app_bar/assets/";
    return GestureDetector(
      onTap: () {
        if (!widget.isCollapsed) {
          widget.callback();
        }
      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 100),
            child: widget.child,
          ),
          Container(
            height: 100,
            width: double.infinity,
            color: !widget.lightMode ? null : widget.backgroundColor,
            decoration: widget.lightMode
                ? null
                : CommonWidgets.imageDecoration("${assets}Frame 123.png"),
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 16, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (widget.leftSideIcon != null) {
                      widget.callback();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: SvgPicture.asset(
                    widget.leftSideIcon != null
                        ? widget.leftSideIcon!
                        : "${assets}eva_arrow-back-fill.svg",
                    color: widget.lightMode ? Colors.black : Colors.white,
                  ),
                ),
                SvgPicture.asset(
                  widget.rightSideIcon != null
                      ? widget.rightSideIcon!
                      : "${assets}Settings.svg",
                  color: widget.lightMode ? Colors.black : Colors.white,
                ),
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () => selectCity(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      city.isEmpty ? "Delhi" : city,
                      style: CommonStyle.metropolis15W800(
                          color:
                              !widget.lightMode ? Colors.white : Colors.black),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: !widget.lightMode ? Colors.white : Colors.black,
                    ),
                  ],
                ),
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
                    options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayAnimationDuration: const Duration(seconds: 1),
                        autoPlayInterval: const Duration(seconds: 3)),
                    items: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0xffDFD3E1),
                                        offset: Offset(5, 5),
                                        blurRadius: 10),
                                    BoxShadow(
                                        color: Color(0xffFAF6FB),
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
                                    ])),
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
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0xffDFD3E1),
                                        offset: Offset(5, 5),
                                        blurRadius: 10),
                                    BoxShadow(
                                        color: Color(0xffFAF6FB),
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
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0xffDFD3E1),
                                        offset: Offset(5, 5),
                                        blurRadius: 10),
                                    BoxShadow(
                                        color: Color(0xffFAF6FB),
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
      ),
    );
  }
}
