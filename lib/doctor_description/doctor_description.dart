import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/common/gradient_text_widget.dart';
import 'package:flutter_application_1/doctor/review_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../app_bar/app_bar.dart';
import '../bottom_nav_bar/bottom_nav_bar.dart';
import '../home/side_bar/side_bar_widget.dart';

class DoctorDescriptionWidget extends StatefulWidget {
  const DoctorDescriptionWidget({super.key});

  @override
  State<DoctorDescriptionWidget> createState() =>
      _DoctorDescriptionWidgetState();
}

class _DoctorDescriptionWidgetState extends State<DoctorDescriptionWidget>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  late double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _menuScaleAnimation;
  late Animation<Offset> _slideAnimation;

  final _scrollController = ScrollController();
  double _currentOffset = 0.0;

  final _pageController = PageController();
  late int progress = 1;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light // Set your desired color
        ));
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  callback() {
    setState(() {
      if (_scrollController.offset != 0) {
        _currentOffset = _scrollController.offset;
      }

      if (isCollapsed) {
        _controller.forward();
      } else {
        _controller.reverse();
      }

      isCollapsed = !isCollapsed;

      if (isCollapsed) {
        _scrollController.animateTo(_currentOffset,
            duration: const Duration(microseconds: 10), curve: Curves.easeIn);
      } else {
        _scrollController.animateTo(0.0,
            duration: const Duration(microseconds: 10), curve: Curves.easeIn);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF2ECF3),
      extendBody: true,
      bottomNavigationBar: !isCollapsed ? null : const BottomNavBar(),
      body: Stack(
        children: <Widget>[
          SideBarWidget(
            callback: callback,
          ),
          content(context),
        ],
      ),
    );
  }

  Widget content(context) {
    String assets = "lib/home_screen/assets/";
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: Colors.white,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(40)),
            child: CustomAppBar(
              isCollapsed: isCollapsed,
              callback: callback,
              sliderColor: const Color(0xffF3EDF4),
              backgroundColor: const Color(0xFFF2ECF3),
              leftSideIcon: "${assets}gg_menu-motion.svg",
              rightSideIcon: "${assets}Group 1.svg",
              lightMode: false,
              child: Container(
                color: const Color(0xFFF2ECF3),
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowIndicator();

                    return true;
                  },
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: isCollapsed
                        ? const AlwaysScrollableScrollPhysics()
                        : const NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // height: 695,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(-1.0, 0.0),
                              end: Alignment(1.0, 0.0),
                              colors: [
                                Color(0xFFAD37E0),
                                Color(0xFFEE2B3B),
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 50),
                              Container(
                                margin: const EdgeInsets.only(
                                  right: 25,
                                  left: 40,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: const TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Dr. Johnathan Gray  ',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Metropolis',
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '( BDS, MDS )',
                                                  style: TextStyle(
                                                    fontFamily: 'Metropolis',
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          const Text(
                                            'Dental Specialist ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // john
                                    if (isCollapsed)
                                      Image.asset(
                                        'assets/images/john.png',
                                        width: 113,
                                        height: 108,
                                      ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 35),
                              Stack(
                                children: [
                                  Container(
                                    height: 160,
                                    //color: Colors.amber,
                                  ),
                                  Positioned(
                                    left: -30,
                                    child: Image.asset(
                                      'assets/images/layout_doctor_details.png',
                                      width: 159,
                                      height: 159,
                                    ),
                                  ),
                                  Positioned(
                                    left: 40,
                                    top: 35,
                                    child: Image.asset(
                                      'assets/images/detais.png',
                                      width: 348,
                                      height: 70,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const Positioned(
                                    left: 85,
                                    top: 62,
                                    child: Text(
                                      '4.5 out of 5.0',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    left: 255,
                                    top: 62,
                                    child: Text(
                                      '575',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    left: 290,
                                    top: 68,
                                    child: Text(
                                      'Patients review',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    left: 25,
                                    top: 140,
                                    child: Text(
                                      'About',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 25.0),
                                child: Text(
                                  'Doctor',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 38,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    height: 160,
                                    //color: Colors.amber,
                                  ),
                                  Positioned(
                                    right: -30,
                                    top: -80,
                                    child: Image.asset(
                                      'assets/images/doctor_design.png',
                                      width: 159,
                                      height: 159,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 25,
                                      right: 14,
                                    ),
                                    child: Image.asset(
                                      'assets/images/doctor_exp.png',
                                      height: 105,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 52,
                                      right: 56,
                                      top: 5,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/calendar.svg',
                                              width: 30,
                                              height: 30,
                                            ),
                                            const SizedBox(height: 2),
                                            Stack(
                                              alignment: Alignment.topCenter,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 24),
                                                  child: const Text(
                                                    'Years Exp',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                ),
                                                const Text(
                                                  '6+',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 21,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // const SizedBox(height: 3),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/user.svg',
                                              width: 30,
                                              height: 30,
                                            ),
                                            const SizedBox(height: 2),
                                            const Stack(
                                              alignment: Alignment.topCenter,
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 24),
                                                  child: Text(
                                                    'Patients',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '8K+',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 21,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // const SizedBox(height: 3),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/award.svg',
                                              width: 30,
                                              height: 30,
                                            ),
                                            const SizedBox(height: 2),
                                            const Stack(
                                              alignment: Alignment.topCenter,
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 24),
                                                  child: const Text(
                                                    'Awards',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                ),
                                                const Text(
                                                  '20+',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 21,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // const SizedBox(height: 3),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Doctors',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'Speaciality',
                                    style: TextStyle(
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
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: SizedBox(
                            height: 130,
                            child: PageView.builder(
                              itemCount: 3,
                              controller: _pageController,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset(
                                              'lib/doctor_description/assets/doctor-speciality1.png',
                                              width: 95,
                                              height: 94,
                                            ),
                                            Image.asset(
                                              'lib/doctor_description/assets/doctor-speciality2.png',
                                              width: 85,
                                              height: 84,
                                            ),
                                            Image.asset(
                                              'lib/doctor_description/assets/doctor-speciality3.png',
                                              width: 59,
                                              height: 58,
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/implant.svg',
                                              width: 25,
                                              height: 25,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        const GradientText(
                                          'Implant',
                                          style: TextStyle(
                                            fontSize: 10,
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
                                    Column(
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset(
                                              'lib/doctor_description/assets/doctor-speciality1.png',
                                              width: 95,
                                              height: 94,
                                            ),
                                            Image.asset(
                                              'lib/doctor_description/assets/doctor-speciality2.png',
                                              width: 85,
                                              height: 84,
                                            ),
                                            Image.asset(
                                              'lib/doctor_description/assets/doctor-speciality3.png',
                                              width: 59,
                                              height: 58,
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/braces.svg',
                                              width: 25,
                                              height: 25,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        const GradientText(
                                          'Braces',
                                          style: TextStyle(
                                            fontSize: 10,
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
                                    Column(
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset(
                                              'lib/doctor_description/assets/doctor-speciality1.png',
                                              width: 95,
                                              height: 94,
                                            ),
                                            Image.asset(
                                              'lib/doctor_description/assets/doctor-speciality2.png',
                                              width: 85,
                                              height: 84,
                                            ),
                                            Image.asset(
                                              'lib/doctor_description/assets/doctor-speciality3.png',
                                              width: 59,
                                              height: 58,
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/root_canal.svg',
                                              width: 25,
                                              height: 25,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        const GradientText(
                                          'Root canal',
                                          style: TextStyle(
                                            fontSize: 10,
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
                                    Column(
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset(
                                              'lib/doctor_description/assets/doctor-speciality1.png',
                                              width: 95,
                                              height: 94,
                                            ),
                                            Image.asset(
                                              'lib/doctor_description/assets/doctor-speciality2.png',
                                              width: 85,
                                              height: 84,
                                            ),
                                            Image.asset(
                                              'lib/doctor_description/assets/doctor-speciality3.png',
                                              width: 59,
                                              height: 58,
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/extraction.svg',
                                              width: 25,
                                              height: 25,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        const GradientText(
                                          'Extraction',
                                          style: TextStyle(
                                            fontSize: 10,
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
                        ),
                        Visibility(
                          visible: false,
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/location.png',
                              ),
                              const Positioned(
                                left: 200,
                                top: 125,
                                child: SizedBox(
                                  width: 159,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GradientText(
                                        'Dental Clinic',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800,
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
                                      SizedBox(height: 5),
                                      Text(
                                        '12/2, Mathura Road, Sector 37, Faridabad - Delhi',
                                        style: TextStyle(
                                          color: Color(
                                            0xFF252525,
                                          ),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const ReviewWidget(),
                        const SizedBox(height: 110),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
