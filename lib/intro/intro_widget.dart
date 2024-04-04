import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/common/gradient_text_widget.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class IntroWidget extends StatefulWidget {
  const IntroWidget({super.key});

  @override
  State<IntroWidget> createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget> {
  final _pageController = PageController();
  late int progress = 1;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light // Set your desired color
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF252525),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();

            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                SizedBox(
                  height: 500,
                  child: PageView.builder(
                    itemCount: 3,
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.topCenter,
                            children: [
                              Image.asset(
                                progress == 1
                                    ? 'assets/images/into_first_bg.png'
                                    : progress == 2
                                        ? 'assets/images/intro_second_bg.png'
                                        : 'assets/images/intro_third_bg.png',
                                width: MediaQuery.of(context).size.width,
                                height: 278,
                                fit: BoxFit.fitWidth,
                              ),
                              Image.asset(
                                progress == 1
                                    ? 'assets/images/into_first.png'
                                    : progress == 2
                                        ? 'assets/images/intro_second.png'
                                        : 'assets/images/intro_third.png',
                                width: 271,
                                height: 278,
                              ),
                            ],
                          ),
                          const SizedBox(height: 60),
                          GradientText(
                            progress == 1
                                ? 'Quick Booking'
                                : progress == 2
                                    ? 'Find Top Doctors'
                                    : 'Offers & Discounts',
                            style: const TextStyle(
                              fontFamily: "Metropolis",
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFAD37E0),
                                Color(0xFFEE2B3B),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            child: const Text(
                              'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Etiam eu turpis molestie, dictum\nest a, mattis tellus. Sed dignissim, metus nec\nfringilla accumsan, risus sem sollicitudin lacus.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Metropolis",
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
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
                const SizedBox(height: 25),
                SizedBox(
                  width: 60,
                  height: 5,
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
                const SizedBox(height: 40),
                progress != 3
                    ? Stack(
                        children: [
                          Image.asset(
                            'assets/images/intro_button.png',
                            height: 100,
                            width: 378,
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                            left: 16,
                            top: 18,
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                setState(() {
                                  _pageController.animateToPage(
                                    3,
                                    // 275 * double.parse(progress.toString()),
                                    duration: const Duration(microseconds: 1),
                                    curve: Curves.easeIn,
                                  );
                                  progress = 3;
                                });
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 58),
                                child: Text(
                                  'SKIP',
                                  style: TextStyle(
                                    fontFamily: "Metropolis",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 24,
                            top: 18,
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                setState(() {
                                  _pageController.animateTo(
                                    275 * double.parse(progress.toString()),
                                    duration: const Duration(microseconds: 1),
                                    curve: Curves.easeIn,
                                  );
                                  progress = progress + 1;
                                });
                              },
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 50),
                                  child: Text(
                                    'NEXT',
                                    style: TextStyle(
                                      fontFamily: "Metropolis",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          children: [
                            Image.asset(
                              'lib/intro/assets/book_now.png',
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: const Center(
                                child: Text(
                                  'GET STARTED',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Metropolis",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
