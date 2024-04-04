import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  final _pageController = PageController();
  late int progress = 1;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          child: Image.asset(
            progress == 1
                ? 'assets/images/polina_zimmerman.png'
                : progress == 2
                    ? 'assets/images/anna_shvets.png'
                    : 'assets/images/anna.png',
            width: 238,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 35,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                  const SizedBox(width: 30),
                  SizedBox(
                    height: 33,
                    width: 150,
                    child: PageView.builder(
                      itemCount: 3,
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              progress == 1
                                  ? '50 Clinic'
                                  : progress == 2
                                      ? '60 Cities'
                                      : '1Lakh Patients',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: 55,
                              child: StepProgressIndicator(
                                totalSteps: 3,
                                currentStep: progress,
                                size: 5,
                                padding: 2.0,
                                roundedEdges: const Radius.circular(10),
                                selectedColor: Colors.white,
                                unselectedColor: Colors.transparent,
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
              ),
              Image.asset(
                'assets/images/settings.png',
                height: 30,
                width: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
