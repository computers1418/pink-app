import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/gradient_text_widget.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class RatingWidget extends StatefulWidget {
  const RatingWidget({super.key});

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  final _pageController = PageController();
  late int progress = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Doctors',
                  style: TextStyle(
                    fontFamily: "Metropolis",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Ratings',
                  style: TextStyle(
                    fontFamily: "Metropolis",
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
        const SizedBox(height: 10),
        SizedBox(
          height: 230,
          child: PageView.builder(
            itemCount: 3,
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/doctor_rating.png',
                        width: 383,
                        height: 179,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 54,
                          right: 58,
                          top: 70,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GradientText(
                              '4.5',
                              style: TextStyle(
                                fontFamily: "Metropolis",
                                fontSize: 40,
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
                            GradientText(
                              '4.5',
                              style: TextStyle(
                                fontFamily: "Metropolis",
                                fontSize: 40,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 50,
                      right: 55,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GradientText(
                          'Attention',
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 16,
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
                        GradientText(
                          'Passion',
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 16,
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
                      ],
                    ),
                  ),
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
      ],
    );
  }
}
