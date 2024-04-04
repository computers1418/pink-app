import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../constents/commen_styles.dart';
import '../constents/commen_widgets.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({super.key});

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  final _pageController = PageController();
  late int progress = 1;
  @override
  Widget build(BuildContext context) {
    String assets="lib/doctor/assets/";

    return Container(
      color: const Color(0xFFF3EDF4),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Read Patients',
                      style: TextStyle(fontFamily: "Metropolis",
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Reviews',
                      style: TextStyle(fontFamily: "Metropolis",
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 55,
                  child: StepProgressIndicator(
                    totalSteps: 3,
                    currentStep: progress,
                    size: 5,
                    padding: 0.01,
                    roundedEdges: const Radius.circular(10),
                    selectedGradientColor: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFAD37E0),
                        Color(0xFFEE2B3B),
                      ],
                    ),
                    unselectedColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 275+50+275+50,
            child: PageView.builder(

              itemCount: 3,
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Container(
                      height: 275+40,
                      width: MediaQuery.of(context).size.width,
                      decoration: CommonWidgets.imageDecoration("${assets}Frame 120.png"),
                      child: Stack(
                        fit: StackFit.loose,

                        children: [
                          // SizedBox(width: double.infinity,height: 274+40,),

                          Padding(
                            padding: const EdgeInsets.only(left: 25,top: 30),
                            child: Stack(
                              children: [
                                const SizedBox(width: double.infinity,),

                                Container(

                                  decoration: CommonWidgets.imageDecoration("${assets}Frame 125 (5).png"),
                                  height: 90+40,width: 90+40,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(bottom: 5,right: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 45,
                                        backgroundColor: Colors.transparent,

                                        backgroundImage: AssetImage(
                                            "${assets}Pexels Photo by Lokman Sevim.png"
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 115,top: 40),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Text("Ruth Frazier",style: CommonStyle.metropolis16W700(),),
                                      ),
                                      Container(

                                        decoration: CommonWidgets.imageDecoration("${assets}Rectangle 262 (3).png"),
                                        width: 50+25,
                                        height: 22+25,
                                        alignment: Alignment.center,
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 15,),
                                            SvgPicture.asset("${assets}Star (3).svg",height: 16,width: 16,color: Colors.black,),
                                            const SizedBox(width: 2,),

                                            Text("4.5",style: CommonStyle.metropolis10W900(),)
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                Positioned(top: 30,

                                    right:60,
                                    child: SvgPicture.asset("${assets}Quotes.svg")),

                              ],
                            ),
                          ),
                          Positioned(

                            bottom: 45,
                            right: 40,
                            left: 40,

                            child: Container(


                              decoration: CommonWidgets.imageDecoration("${assets}Rectangle 813.png"),
                              height: 121,
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),

                              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus",style: CommonStyle.metropolis13W400(),),
                            ),
                          )

                        ],
                      ),
                    ),
                    Positioned(
                      top:285,
                      child: Container(
                        height: 275+40,
                        width: MediaQuery.of(context).size.width,
                        decoration: CommonWidgets.imageDecoration("${assets}Frame 120.png"),
                        child: Stack(
                          fit: StackFit.loose,

                          children: [
                            // SizedBox(width: double.infinity,height: 274+40,),

                            Padding(
                              padding: const EdgeInsets.only(left: 25,top: 30),
                              child: Stack(
                                children: [
                                  const SizedBox(width: double.infinity,),

                                  Container(

                                    decoration: CommonWidgets.imageDecoration("${assets}Frame 125 (5).png"),
                                    height: 90+40,width: 90+40,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(bottom: 5,right: 5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 45,
                                          backgroundColor: Colors.transparent,

                                          backgroundImage: AssetImage(
                                              "${assets}Pexels Photo by Lokman Sevim.png"
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 115,top: 40),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: Text("Ruth Frazier",style: CommonStyle.metropolis16W700(),),
                                        ),
                                        Container(

                                          decoration: CommonWidgets.imageDecoration("${assets}Rectangle 262 (3).png"),
                                          width: 50+25,
                                          height: 22+25,
                                          alignment: Alignment.center,
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 15,),
                                              SvgPicture.asset("${assets}Star (3).svg",height: 16,width: 16,color: Colors.black,),
                                              const SizedBox(width: 2,),

                                              Text("4.5",style: CommonStyle.metropolis10W900(),)
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  Positioned(top: 30,

                                      right:60,
                                      child: SvgPicture.asset("${assets}Quotes.svg")),

                                ],
                              ),
                            ),
                            Positioned(

                              bottom: 45,
                              right: 40,
                              left: 40,

                              child: Container(


                                decoration: CommonWidgets.imageDecoration("${assets}Rectangle 813.png"),
                                height: 121,
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),

                                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus",style: CommonStyle.metropolis13W400(),),
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              onPageChanged: (int index) {
                setState(
                      () {
                    progress = index == 1
                        ? 2
                        : index == 2
                        ? 3
                        : index == 3
                        ? 4
                        : 1;
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 70),



        ],
      ),
    );
  }
}
