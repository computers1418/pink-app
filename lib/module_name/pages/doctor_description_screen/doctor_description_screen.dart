import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../common/gradient_text_widget.dart';
import '../../../constents/commen_styles.dart';
import '../../../constents/commen_widgets.dart';
import '../app_bar/app_bar.dart';
class DoctorDescriptionScreen extends StatefulWidget {
  const DoctorDescriptionScreen({super.key});

  @override
  State<DoctorDescriptionScreen> createState() => _DoctorDescriptionScreenState();
}

class _DoctorDescriptionScreenState extends State<DoctorDescriptionScreen> {
  final _pageController = PageController();
  final _pageController2 = PageController();
  late int progress = 1;
  late int progress2 = 1;

  @override
  Widget build(BuildContext context) {
    String assets="lib/module_name/pages/doctor_description_screen/assets/";
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light
          .copyWith(statusBarColor: Colors.transparent),
      child: CustomAppBar(
        child: Scaffold(
          backgroundColor: const Color(0xffF3EDF4),
          body: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: Container(
                color: const Color(0xffF3EDF4),

                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: CommonWidgets.imageDecoration("${assets}Group 1 (9).png"),
                      child: Column(
                        children: [
                          const SizedBox(height: 50,),
                          Padding(
                            padding: const EdgeInsets.only(left: 35,right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Dr. Johnathan\nGray "
                                            ,style: CommonStyle.metropolis24W900(color: Colors.white),
                                          ),
                                          TextSpan(
                                            text: "( BDS, MDS )"
                                            ,style: CommonStyle.metropolis11W600(color: Colors.white),
                                          ),
                                        ]
                                      )
                                    ),
                                    const SizedBox(height: 5,),

                                    Text("Dental Specialist",style: CommonStyle.metropolis13W600(color: Colors.white),)

                                  ],
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                    child: Image.asset("${assets}portrait-smiling-handsome-man-eyeglasses (1) 1 (1).png",height: 108,width: 113,fit: BoxFit.fill,))
                              ],
                            ),
                          ),
                          const SizedBox(height: 20,),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [Expanded(child:Container(
                                height: 32+25,
                                decoration: CommonWidgets.imageDecoration("${assets}Rectangle 262 (2).png"),
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    SvgPicture.asset("${assets}Star (3).svg"),
                                    const SizedBox(width: 5,),
                                    Text("4.5 out of 5.0",style: CommonStyle.metropolis14W900(color: Colors.white),)
                                  ],
                                ),
                              )),Expanded(child:Container(
                                height: 32+25,
                                decoration: CommonWidgets.imageDecoration("${assets}Rectangle 819.png"),
                                padding: const EdgeInsets.symmetric(horizontal: 20),

                                child: Row(
                                  children: [
                                    SvgPicture.asset("${assets}Star (4).svg"),
                                    const SizedBox(width: 5,),
                                    Text.rich(TextSpan(
                                      children:[ TextSpan(
                                        text: "575  ",style: CommonStyle.metropolis14W900(color: Colors.white),
                                      ),
                                        TextSpan(
                                        text: "Patients review",
                                        style: CommonStyle.metropolis9W900(color: Colors.white),
                                      )]
                                    ))
                                  ],
                                ),

                              ))],
                            ),
                          ),
                          const SizedBox(height: 30,),
                          Align(alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("About",style: CommonStyle.metropolis16W700(color: Colors.white),),
                                  Text("Doctor",style: CommonStyle.metropolis40W900(color: Colors.white),),
                                  const SizedBox(height: 5,),

                                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan.",style: CommonStyle.metropolis13W400(color: Colors.white),),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 20,),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.white.withOpacity(0.3),width: 1)
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                    child: Container(
                                      height: 84,
                                      width: 100,
                                      color: Colors.black.withOpacity(0.03),

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset("${assets}Calendar (1).svg"),
                                          const SizedBox(height: 5,),

                                          Text("6+",style: CommonStyle.metropolis21W900(color: Colors.white),),
                                          const SizedBox(height: 3,),

                                          Text("Years Exp",style: CommonStyle.metropolis10W900(color: Colors.white),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.white.withOpacity(0.3),width: 1)
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                    child: Container(
                                      height: 84,
                                      width: 100,
                                      color: Colors.black.withOpacity(0.03),

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset("${assets}nurse.svg"),
                                          const SizedBox(height: 5,),

                                          Text("8K+",style: CommonStyle.metropolis21W900(color: Colors.white),),
                                          const SizedBox(height: 3,),

                                          Text("Patients",style: CommonStyle.metropolis10W900(color: Colors.white),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20,),


                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.white.withOpacity(0.3),width: 1)
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                    child: Container(
                                      height: 84,
                                      width: 100,
                                      color: Colors.black.withOpacity(0.03),

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset("${assets}Best.svg"),
                                          const SizedBox(height: 5,),

                                          Text("20+",style: CommonStyle.metropolis21W900(color: Colors.white),),
                                          const SizedBox(height: 3,),

                                          Text("Awards",style: CommonStyle.metropolis10W900(color: Colors.white),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20,),

                            ],
                          ),
                          const SizedBox(height: 34,),

                        ],

                      ),

                    ),
                    const SizedBox(height: 30,),

                    Align(alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Doctors",style: CommonStyle.metropolis16W700(color: Colors.black),),
                                Text("Speaciality",style: CommonStyle.metropolis40W900(color: Colors.black),),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: SizedBox(
                                width: 55,
                                child: StepProgressIndicator(
                                  totalSteps: 3,
                                  currentStep: progress2,
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
                            ),

                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),

                    SizedBox(
                      height: 110,
                      child: PageView.builder(

                        itemCount: 3,
                        controller: _pageController2,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 80+12,
                                      width: 80+12,
                                      decoration: CommonWidgets.imageDecoration("${assets}Group 1 (10).png"),
                                      alignment: Alignment.center,
                                      child: SvgPicture.asset("${assets}Frame 128.svg"),
                                    ),
                                    GradientText("Implant",style: CommonStyle.metropolis10W900(),)
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 80+12,
                                      width: 80+12,
                                      decoration: CommonWidgets.imageDecoration("${assets}Group 1 (10).png"),
                                      alignment: Alignment.center,
                                      child: SvgPicture.asset("${assets}Frame 129.svg"),
                                    ),
                                    GradientText("Braces",style: CommonStyle.metropolis10W900(),)
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 80+12,
                                      width: 80+12,
                                      decoration: CommonWidgets.imageDecoration("${assets}Group 1 (10).png"),
                                      alignment: Alignment.center,
                                      child: SvgPicture.asset("${assets}Frame 130.svg"),
                                    ),
                                    GradientText("Root Canal",style: CommonStyle.metropolis10W900(),)
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 80+12,
                                      width: 80+12,
                                      decoration: CommonWidgets.imageDecoration("${assets}Group 1 (10).png"),
                                      alignment: Alignment.center,
                                      child: SvgPicture.asset("${assets}Frame 131.svg"),
                                    ),
                                    GradientText("Extraction",style: CommonStyle.metropolis10W900(),)
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        onPageChanged: (int index) {
                          setState(
                                () {
                              progress2 = index == 1
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

                    const SizedBox(height: 35,),

                    Stack(
                      children: [
                        Image.asset(
                          width: double.infinity,

                          '${assets}Group 1 (11).png',height: 235,fit: BoxFit.fill,
                        ),
                        const Positioned(
                          top: 15,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Doctors',
                                style: TextStyle(
                                  fontFamily: "Metropolis",
                                  color: Color(
                                    0xFF252525,
                                  ),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                'Location',
                                style: TextStyle(
                                  fontFamily: "Metropolis",
                                  color: Color(
                                    0xFF252525,
                                  ),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 40,
                          bottom: 40,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    width: 1,
                                    color: Colors.white.withOpacity(0.2))),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                                child: Container(
                                  width: 204,
                                  height: 94,
                                  color: Colors.black.withOpacity(0.03),
                                  padding: const EdgeInsets.only(
                                      left: 23, top: 17, bottom: 17),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  [
                                      GradientText(
                                        'Dental Clinic',
                                        style: CommonStyle.metropolis20W800(),

                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        '12/2, Mathura Road, Sector 37, Faridabad - Delhi',
                                        style: CommonStyle.metropolis11W600(),

                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),

                    Container(
                      color: const Color(0xFFF3EDF4),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    Text(
                                      'Read Patients',
                                      style: CommonStyle.metropolis16W700(),
                                    ),
                                    Text(
                                      'Reviews',
                                      style: CommonStyle.metropolis40W900(),

                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: SizedBox(
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
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 275+50,
                            child: PageView.builder(

                              itemCount: 3,
                              controller: _pageController,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
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
    );
  }
}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}