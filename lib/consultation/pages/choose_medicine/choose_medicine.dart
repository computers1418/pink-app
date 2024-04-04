import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../app_bar.dart';
import '../../../constents/pageview.dart';

class ChooseMedicine extends StatefulWidget {
  const ChooseMedicine({super.key});

  @override
  State<ChooseMedicine> createState() => _ChooseMedicineState();
}

class _ChooseMedicineState extends State<ChooseMedicine> {
  String selectedItem = 'Decayed Tooth';
  List imgList1 = [
    'X - Ray',
    'Oral Cancer',
    'TMJ Exam',
    'Cavity Test',
    'Bone Loss Test',
    'Gum Evaluation'
  ];

  List imgList2 = [
    'Amitriptyline',
    'Penciclovir',
    'Valacycliovir',
    'Clindamycin',
    'Amoxicilin',
    'Sodium Fluoride'
  ];

  List currentList = [];

  int currentIndex = 0;

  setindex(index) {
    setState(() {
      currentIndex = index;
      if (index == 0) {
        currentList = imgList1;
      } else {
        currentList = imgList2;
      }
      print(currentList);
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      // statusBarBrightness: Brightness.dark // Set your desired color
    ));
    setState(() {
      currentList = imgList1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Expanded(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowIndicator();

                    return true;
                  },
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 16),
                                      child: Text(
                                        "Medicine",
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    Text(
                                      "Choose",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    GradientText(
                                      "Page ${currentIndex + 1} of 2",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800),
                                      colors: [
                                        HexColor("#AD37E0"),
                                        HexColor("#EE2B3B"),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 5,
                                          width: 55,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        Container(
                                          height: 5,
                                          width: currentIndex == 0 ? 27.5 : 55,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                HexColor("#AD37E0"),
                                                HexColor("#EE2B3B"),
                                              ]),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          MyPageView(
                            pageViewHeight: 580,
                            callback: setindex,
                            pagesCount: 2,
                            itemBuilder: (con, ind) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 40,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: HexColor("#ECC0D9"),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Column(
                                    children: [
                                      for (int i = 0; i < 6; i++)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedItem = currentList[i];
                                              });
                                            },
                                            child: Container(
                                              height: 70,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: HexColor("#F3EDF4"),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color:
                                                            HexColor("#DAA0C1"),
                                                        offset: const Offset(
                                                            10, 10),
                                                        blurRadius: 20),
                                                    BoxShadow(
                                                        color:
                                                            HexColor("#ECC0D9"),
                                                        offset: const Offset(
                                                            -5, -5),
                                                        blurRadius: 10),
                                                  ]),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 14,
                                                    top: 14,
                                                    bottom: 14,
                                                    right: 10),
                                                child: Row(
                                                  children: [
                                                    Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Container(
                                                          height: 36,
                                                          width: 36,
                                                          decoration: BoxDecoration(
                                                              color: HexColor(
                                                                  "#ECC0D9"),
                                                              shape: BoxShape
                                                                  .circle),
                                                        ),
                                                        Image.asset(
                                                          "lib/consultation/pages/choose_medicine/assets/${imgList1[i]}.png",
                                                          height: 18,
                                                          width: 18,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    selectedItem !=
                                                            currentList[i]
                                                        ? Expanded(
                                                            flex: 26,
                                                            child: Text(
                                                              currentList[i],
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800),
                                                            ),
                                                          )
                                                        : Expanded(
                                                            flex: 26,
                                                            child: GradientText(
                                                              currentList[i],
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800),
                                                              colors: [
                                                                HexColor(
                                                                    "#AD37E0"),
                                                                HexColor(
                                                                    "#EE2B3B"),
                                                              ],
                                                            ),
                                                          ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        color: selectedItem !=
                                                                currentList[i]
                                                            ? Colors.white
                                                            : Colors.black,
                                                      ),
                                                      child: GradientText(
                                                        "Rs. 1000",
                                                        style: const TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                        colors: [
                                                          HexColor("#AD37E0"),
                                                          HexColor("#EE2B3B"),
                                                        ],
                                                      ),
                                                    ),
                                                    const Expanded(
                                                        flex: 1,
                                                        child: SizedBox()),
                                                    selectedItem ==
                                                            currentList[i]
                                                        ? Image.asset(
                                                            "assets/images/active-radio.png",
                                                            height: 36,
                                                            width: 36,
                                                          )
                                                        : Stack(
                                                            alignment: Alignment
                                                                .center,
                                                            children: [
                                                              Image.asset(
                                                                "assets/images/radio.png",
                                                                height: 30,
                                                                width: 30,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        11.5),
                                                                child:
                                                                    Image.asset(
                                                                  "assets/images/radio2.png",
                                                                  height: 16,
                                                                  width: 16,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 48,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const CustomAppBar(
            // backgroundColor: Color(0xffF3EDF4),
            sliderColor: Color(0xffF3EDF4),
            shadow: 0.15,
            lightMode: true,
          ),
        ],
      ),
    );
  }
}
