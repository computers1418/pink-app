import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/gradient_text_widget.dart';
import 'package:flutter_application_1/constents/commen_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ParentsWidget extends StatefulWidget {
  const ParentsWidget({super.key});

  @override
  State<ParentsWidget> createState() => _ParentsWidgetState();
}

class _ParentsWidgetState extends State<ParentsWidget> {
  final _pageController = PageController();
  late int progress = 1;
  @override
  Widget build(BuildContext context) {
    String assets="lib/doctor/assets/";

    return Container(
      color: const Color(0xFFF3EDF4),
      child: Column(
        children: [
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What',
                      style: TextStyle(fontFamily: "Metropolis",
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Parents Says',
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
            height: 450  ,
            child: PageView.builder(
              itemCount: 3,
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Image.asset(
                      '${assets}Frame 115.png',
                      width: MediaQuery.of(context).size.width,
                      height: 480,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 45,
                        left: 45,
                        right: 30,
                      ),
                      child: Row(
                        children:  [
                          const Expanded(
                            child: GradientText(
                              'Kids Love This Place, Friendly Doctors',
                              style: TextStyle(fontFamily: "Metropolis",
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFAD37E0),
                                  Color(0xFFEE2B3B),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            width: 70+5,
                            height:22+20+5,

                            decoration:CommonWidgets.imageDecoration("${assets}Rectangle 262 (4).png"),

                alignment:Alignment.center,
                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                SvgPicture.asset("${assets}Star (3).svg",color: Colors.black,height: 16,width: 16,),
                                const SizedBox(width: 3,),
                                const Text(
                                  '4.5',
                                  style: TextStyle(fontFamily: "Metropolis",
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(

                      margin: const EdgeInsets.only(
                        top: 105,
                        left: 45,
                        right: 45,
                      ),
                      padding:const EdgeInsets.symmetric(
                        horizontal: 15,vertical: 20
                      ),
                      decoration:CommonWidgets.imageDecoration("${assets}Rectangle 813 (1).png"),
                      child: const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus.',
                        style: TextStyle(fontFamily: "Metropolis",
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 220,
                        left: 30,
                        right: 30,
                        bottom: 30,
                      ),
                      padding: const EdgeInsets.all(16),
                      decoration: CommonWidgets.imageDecoration("${assets}Frame 88.png"),
                      
                      child: ClipRRect(borderRadius:BorderRadius.circular(20),
                          
                          child: Image.asset("${assets}angled-mirror-used-by-dentist-doctor-little-girl-with-mouth-open-dental-office-dentistry-specialist-during-child-cavity-consultation-stomatology-office-using-modern-technology (1).png")),
                    )
                  ],
                );
              },
              onPageChanged: (int index) {
                setState(() {
                  progress = index == 1
                      ? 2
                      : index == 2
                          ? 3
                          : 1;
                });
              },
            ),
          ),
          const SizedBox(height: 20),

        ],
      ),
    );
  }
}
