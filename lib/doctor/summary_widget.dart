import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SummaryWidget extends StatefulWidget {
  const SummaryWidget({super.key});

  @override
  State<SummaryWidget> createState() => _SummaryWidgetState();
}

class _SummaryWidgetState extends State<SummaryWidget> {
  final _pageController = PageController();
  late int progress = 1;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 32, left: 25),
            child: Image.asset(
              'assets/images/summary_third_rectangle.png',
              width: 324,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Image.asset(
              'assets/images/summary_second_rectangle.png',
              width: 352,
            ),
          ),
          Image.asset(
            'assets/images/summary_rectangle.png',
            width: 370,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 24,
              left: 30,
              right: 50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Summary',
                  style: TextStyle(
                    fontFamily: "Metropolis",
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  width: 55,
                  child: StepProgressIndicator(
                    totalSteps: 6,
                    currentStep: progress,
                    size: 5,
                    padding: 0.01,
                    roundedEdges: const Radius.circular(10),
                    selectedColor: Colors.white,
                    unselectedColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 210,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 48,
              ),
              child: PageView.builder(
                itemCount: 6,
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.only(
                      top: 60,
                    ),
                    child: const SingleChildScrollView(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus.',
                        style: TextStyle(
                          fontFamily: "Metropolis",
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                },
                onPageChanged: (int index) {
                  setState(() {
                    progress = index == 1
                        ? 2
                        : index == 2
                            ? 3
                            : index == 3
                                ? 4
                                : index == 4
                                    ? 5
                                    : index == 5
                                        ? 6
                                        : 1;
                  });
                },
              ),
            ),
          ),
          Positioned(
            right: 5,
            top: 100,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  progress = progress + 1;
                  if (currentIndex < 5) {
                    currentIndex++;
                  } else {
                    currentIndex = 0;
                  }
                  _pageController.animateToPage(currentIndex,
                      // 275 * double.parse(progress.toString()),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                });
              },
              child: Image.asset(
                'assets/images/forward_arrow.png',
                width: 41,
                height: 41,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
