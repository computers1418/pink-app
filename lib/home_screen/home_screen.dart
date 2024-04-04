import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../app_bar/app_bar.dart';
import '../bottom_nav_bar/bottom_nav_bar.dart';
import '../common/gradient_text_widget.dart';
import '../constents/commen_widgets.dart';
import '../home/side_bar/side_bar_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
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
  List services = [
    'Dental Braces',
    'Dental Crown',
    'Tooth Extraction',
    'Root Canal',
    'Whitening',
    'Tooth Straightening',
    //repeating
    'Dental Braces',
    'Dental Crown',
    'Tooth Extraction',
    'Root Canal',
    'Whitening',
    'Tooth Straightening',
  ];
  String selectedService = "";
  final serviceController = TextEditingController();
  bool showServices = false;
  List testsAndMedicines = [
    'Dental Braces',
    'Dental Crown',
    'Tooth Extraction',
    'Root Canal',
    'Whitening',
    'Tooth Straightening',
    //repeating
    'Dental Braces',
    'Dental Crown',
    'Tooth Extraction',
    'Root Canal',
    'Whitening',
    'Tooth Straightening',
  ];
  String selectedTestOrMedicine = "";
  final testAndMedicineController = TextEditingController();
  bool showMedicines = false;
  List consultations = ['Video Call', 'Voice Call', 'Clinic Consultation'];
  final consultationController = TextEditingController();
  String selectedConsultation = "";
  bool showConsultations = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      // statusBarBrightness: Brightness.dark // Set your desired color
    ));
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
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
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          // statusBarBrightness: Brightness.dark // Set your desired color
        ));
      } else {
        _scrollController.animateTo(0.0,
            duration: const Duration(microseconds: 10), curve: Curves.easeIn);
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          // statusBarBrightness: Brightness.dark // Set your desired color
        ));
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
              lightMode: true,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: isCollapsed
                      ? const AlwaysScrollableScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  child: Container(
                    color: const Color(0xFFF2ECF3),
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        // Stack(
                        //   children: [
                        //     Image.asset(
                        //       'assets/images/search.png',
                        //     ),
                        //     Container(
                        //       margin: const EdgeInsets.symmetric(
                        //           horizontal: 70, vertical: 18),
                        //       child: TextFormField(
                        //         decoration: const InputDecoration(
                        //           hintText: 'Search here',
                        //           hintStyle: TextStyle(
                        //             fontFamily: "Metropolis",
                        //             color: Color(0xff636363),
                        //             fontSize: 16,
                        //             fontWeight: FontWeight.w600,
                        //           ),
                        //           border: InputBorder.none,
                        //         ),
                        //         onChanged: (String? value) {
                        //           // This optional block of code can be used to run
                        //           // code when the user saves the form.
                        //           setState(() {});
                        //         },
                        //         onTap: () {},
                        //         style: const TextStyle(
                        //           fontFamily: "Metropolis",
                        //           color: Colors.black,
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.w800,
                        //         ),
                        //       ),
                        //     ),
                        //     // const Positioned(
                        //     //   top: 35,
                        //     //   left: 70,
                        //     //   child: Text(
                        //     //     'Search here',
                        //     //     style: TextStyle(fontFamily: "Metropolis",
                        //     //       color: Color(0xFF636363),
                        //     //       fontSize: 16,
                        //     //       fontWeight: FontWeight.w600,
                        //     //     ),
                        //     //   ),
                        //     // ),
                        //   ],
                        // ),
                        //
                        Stack(
                          children: [
                            Image.asset(
                              '${assets}Group 1 (6).png',
                            ),
                            const Positioned(
                              top: 30,
                              left: 50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Doctor of The',
                                    style: TextStyle(
                                      fontFamily: "Metropolis",
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'Month',
                                    style: TextStyle(
                                      fontFamily: "Metropolis",
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 150,
                              left: 50,
                              child: Container(
                                height: 94,
                                width: 124,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image:
                                      AssetImage("${assets}Rectangle 263.png"),
                                )),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'This month',
                                      style: TextStyle(
                                        fontFamily: "Metropolis",
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 0),
                                    Text(
                                      '150+',
                                      style: TextStyle(
                                        fontFamily: "Metropolis",
                                        color: Colors.white,
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      'Patients',
                                      style: TextStyle(
                                        fontFamily: "Metropolis",
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (isCollapsed)
                              Positioned(
                                top: 30,
                                right: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.asset(
                                          "${assets}cheerful-curly-business-girl-wearing-glasses 1.png",
                                          fit: BoxFit.scaleDown,
                                          width: 108,
                                          height: 108,
                                        )),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      'Dr. Lela Huff',
                                      style: TextStyle(
                                        fontFamily: "Metropolis",
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    const Text(
                                      'BDS, MDS',
                                      style: TextStyle(
                                        fontFamily: "Metropolis",
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Text(
                                      'Dental Specialist ',
                                      style: TextStyle(
                                        fontFamily: "Metropolis",
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 32 + 20,
                                      width: 72 + 20,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage(
                                            "${assets}Rectangle 262.png"),
                                      )),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          SvgPicture.asset(
                                            "${assets}Star (1).svg",
                                            fit: BoxFit.scaleDown,
                                            height: 20,
                                            width: 20,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text(
                                            '4.5',
                                            style: TextStyle(
                                              fontFamily: "Metropolis",
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            if (isCollapsed)
                              Positioned(
                                  top: 250,
                                  right: 0,
                                  left: 0,
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: FractionallySizedBox(
                                      widthFactor: 1.0,
                                      child: SfCartesianChart(
                                          margin: EdgeInsets.zero,
                                          plotAreaBorderColor:
                                              Colors.transparent,
                                          borderColor: Colors.transparent,
                                          primaryXAxis: const CategoryAxis(
                                            isVisible: false,
                                            // Hide the X-axis
                                          ),
                                          primaryYAxis: const NumericAxis(
                                            isVisible: false, // Hide the Y-axis
                                          ),
                                          series: <CartesianSeries>[
                                            SplineSeries<ChartData, String>(
                                              color: Colors.white,
                                              width: 3,
                                              markerSettings:
                                                  const MarkerSettings(
                                                      isVisible: false),
                                              dataLabelSettings:
                                                  const DataLabelSettings(
                                                      isVisible: false),
                                              dataSource: <ChartData>[
                                                ChartData(
                                                    'Jan', 35, Colors.white),
                                                ChartData(
                                                    'Feb', 28, Colors.white),
                                                ChartData(
                                                    'Mar', 34, Colors.white),
                                                ChartData(
                                                    'Apr', 32, Colors.white),
                                                ChartData(
                                                    'May', 40, Colors.white),
                                                ChartData(
                                                    'Jun', 28, Colors.white),
                                                // ChartData('Jul', 34, Colors.white),
                                                // ChartData('Aug', 32, Colors.white),
                                              ],
                                              xValueMapper:
                                                  (ChartData sales, _) =>
                                                      sales.x,
                                              yValueMapper:
                                                  (ChartData sales, _) =>
                                                      sales.y,
                                            ),
                                          ]),
                                    ),
                                  )),
                            const Positioned(
                                top: 380,
                                right: 40,
                                left: 40,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("MON",
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w800,
                                        )),
                                    Text("TUE",
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w800,
                                        )),
                                    Text("WED",
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w800,
                                        )),
                                    Text("THU",
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w800,
                                        )),
                                    Text("FRI",
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w800,
                                        )),
                                    Text("SAT",
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w800,
                                        )),
                                  ],
                                ))
                          ],
                        ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        selectedGradientColor:
                                            const LinearGradient(
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
                                height: 400,
                                child: PageView.builder(
                                  itemCount: 3,
                                  controller: _pageController,
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Stack(
                                      children: [
                                        Image.asset(
                                          'assets/images/rating_doctor.png',
                                        ),
                                        Positioned(
                                          top: !isCollapsed ? 50 : 40,
                                          left: 45,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 190,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/realself_logo.png',
                                                      width: 92,
                                                      height: 23,
                                                    ),
                                                    if (isCollapsed)
                                                      const SizedBox(
                                                          height: 10),
                                                    if (isCollapsed)
                                                      const Text(
                                                        'Ratings On RealSelf By Our 5768 Patients.',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Metropolis",
                                                          color:
                                                              Color(0xFF636363),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 15),
                                              if (isCollapsed)
                                                const Stack(
                                                  alignment: Alignment.center,
                                                  // crossAxisAlignment:
                                                  //     CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 5),
                                                      child: GradientText(
                                                        '4.5',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Metropolis",
                                                          fontSize: 64,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                                        gradient:
                                                            LinearGradient(
                                                          begin:
                                                              Alignment.topLeft,
                                                          end: Alignment
                                                              .bottomRight,
                                                          colors: [
                                                            Color(0xFFAD37E0),
                                                            Color(0xFFEE2B3B),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 0,
                                                      child: Text(
                                                        'of 5',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Metropolis",
                                                          color:
                                                              Color(0xFF252525),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: !isCollapsed ? 150 : 220,
                                          left: 45,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 190,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/seek_icon.png',
                                                      width: 43,
                                                      height: 43,
                                                    ),
                                                    if (isCollapsed)
                                                      const SizedBox(
                                                          height: 10),
                                                    if (isCollapsed)
                                                      const Text(
                                                        'Ratings On RealSelf By Our 5768 Patients.',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Metropolis",
                                                          color:
                                                              Color(0xFF636363),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 15),
                                              if (isCollapsed)
                                                const Stack(
                                                  alignment: Alignment.center,
                                                  // crossAxisAlignment:
                                                  //     CrossAxisAlignment.center,
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 5),
                                                      child: GradientText(
                                                        '8.0',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Metropolis",
                                                          fontSize: 64,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                                        gradient:
                                                            LinearGradient(
                                                          begin:
                                                              Alignment.topLeft,
                                                          end: Alignment
                                                              .bottomRight,
                                                          colors: [
                                                            Color(0xFFAD37E0),
                                                            Color(0xFFEE2B3B),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 0,
                                                      child: Text(
                                                        'of 10',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Metropolis",
                                                          color:
                                                              Color(0xFF252525),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        ),
                                        if (isCollapsed)
                                          const Positioned(
                                            top: 320,
                                            left: 45,
                                            child: SizedBox(
                                              width: 304,
                                              child: StepProgressIndicator(
                                                totalSteps: 5,
                                                currentStep: 4,
                                                size: 19,
                                                padding: 0.01,
                                                roundedEdges:
                                                    Radius.circular(10),
                                                selectedGradientColor:
                                                    LinearGradient(
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
                                        if (isCollapsed)
                                          const Positioned(
                                            top: 150,
                                            left: 45,
                                            child: SizedBox(
                                              width: 304,
                                              child: StepProgressIndicator(
                                                totalSteps: 5,
                                                currentStep: 4,
                                                size: 19,
                                                padding: 0.01,
                                                roundedEdges:
                                                    Radius.circular(10),
                                                selectedGradientColor:
                                                    LinearGradient(
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
                        Container(
                          color: const Color(0xFFECC0D9),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              const SizedBox(height: 50),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Our',
                                          style: TextStyle(
                                            fontFamily: "Metropolis",
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          'Services',
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
                                        selectedGradientColor:
                                            const LinearGradient(
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
                                height: 464,
                                child: PageView.builder(
                                  itemCount: 3,
                                  controller: _pageController,
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Stack(
                                      children: [
                                        Image.asset(
                                          'assets/images/service_frame.png',
                                          width: 378,
                                          height: 464,
                                        ),
                                        Positioned(
                                          top: 55,
                                          left: 65,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomRight: Radius.circular(40),
                                            ),
                                            child: Image.asset(
                                              'assets/images/service_first.png',
                                              width: 130,
                                              height: 150,
                                            ),
                                          ),
                                        ),
                                        const Positioned(
                                          top: 40,
                                          left: 45,
                                          child: SizedBox(
                                            width: 100,
                                            child: GradientText(
                                              'Dental Braces',
                                              style: TextStyle(
                                                fontFamily: "Metropolis",
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
                                        ),
                                        Positioned(
                                          top: 288,
                                          left: 62,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomRight: Radius.circular(40),
                                            ),
                                            child: Image.asset(
                                              'assets/images/service_four.png',
                                              width: 130,
                                              height: 150,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 90,
                                          right: 25,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomRight: Radius.circular(40),
                                            ),
                                            child: Image.asset(
                                              'assets/images/service_second.png',
                                              width: 130,
                                              height: 150,
                                            ),
                                          ),
                                        ),
                                        const Positioned(
                                          top: 40,
                                          left: 230,
                                          child: SizedBox(
                                            width: 100,
                                            child: GradientText(
                                              'Decayed Tooth',
                                              style: TextStyle(
                                                fontFamily: "Metropolis",
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
                                        ),
                                        const Positioned(
                                          top: 250,
                                          left: 45,
                                          child: SizedBox(
                                            width: 100,
                                            child: GradientText(
                                              'Dental Crown',
                                              style: TextStyle(
                                                fontFamily: "Metropolis",
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
                                        ),
                                        Positioned(
                                          top: 312,
                                          right: 20,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomRight: Radius.circular(40),
                                            ),
                                            child: Image.asset(
                                              'assets/images/service_three.png',
                                              width: 130,
                                              height: 120,
                                            ),
                                          ),
                                        ),
                                        const Positioned(
                                          top: 280,
                                          left: 230,
                                          child: SizedBox(
                                            width: 100,
                                            child: GradientText(
                                              'Root Canal',
                                              style: TextStyle(
                                                fontFamily: "Metropolis",
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
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        Container(
                          color: const Color(0xFFF3EDF4),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Book',
                                      style: TextStyle(
                                        fontFamily: "Metropolis",
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      'Appointment',
                                      style: TextStyle(
                                        fontFamily: "Metropolis",
                                        color: Colors.black,
                                        fontSize: 40,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    // Image.asset(
                                    //   'assets/images/book_frame.png',
                                    // ),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(
                                          'lib/home_screen/assets/text-field-bg.png',
                                          width: double.infinity,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 2.5),
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 40),
                                              hintText: 'Enter name',
                                              hintStyle: TextStyle(
                                                fontFamily: "Metropolis",
                                                color: Color(
                                                  0xFF636363,
                                                ),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              border: InputBorder.none,
                                            ),
                                            onChanged: (String? value) {
                                              // This optional block of code can be used to run
                                              // code when the user saves the form.
                                              setState(() {});
                                            },
                                            onTap: () {},
                                            style: const TextStyle(
                                              fontFamily: "Metropolis",
                                              color: Color(
                                                0xFF636363,
                                              ),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(
                                          'lib/home_screen/assets/text-field-bg.png',
                                          width: double.infinity,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 2.5),
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 40),
                                              hintText: 'Choose Date & Time',
                                              hintStyle: TextStyle(
                                                fontFamily: "Metropolis",
                                                color: Color(
                                                  0xFF636363,
                                                ),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              border: InputBorder.none,
                                            ),
                                            onChanged: (String? value) {
                                              // This optional block of code can be used to run
                                              // code when the user saves the form.
                                              setState(() {});
                                            },
                                            onTap: () {},
                                            style: const TextStyle(
                                              fontFamily: "Metropolis",
                                              color: Color(
                                                0xFF636363,
                                              ),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    GestureDetector(
                                      onTap: () => setState(() {
                                        showServices = !showServices;
                                      }),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                            'lib/home_screen/assets/text-field-bg.png',
                                            width: double.infinity,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 2.5),
                                            child: TextFormField(
                                              readOnly: true,
                                              decoration: const InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 40),
                                                hintText: 'Choose Services',
                                                hintStyle: TextStyle(
                                                  fontFamily: "Metropolis",
                                                  color: Color(
                                                    0xFF636363,
                                                  ),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                border: InputBorder.none,
                                              ),
                                              controller: serviceController,
                                              onChanged: (String? value) {
                                                // This optional block of code can be used to run
                                                // code when the user saves the form.
                                                setState(() {});
                                              },
                                              onTap: () => setState(() {
                                                showServices = !showServices;
                                              }),
                                              style: const TextStyle(
                                                fontFamily: "Metropolis",
                                                color: Color(
                                                  0xFF636363,
                                                ),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 28,
                                            child: Icon(
                                              showServices
                                                  ? Icons.keyboard_arrow_up
                                                  : Icons.keyboard_arrow_down,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    if (showServices)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 12, left: 16, right: 16),
                                        child: Container(
                                          // padding:
                                          // const EdgeInsets.only(left: 20, right: 20, bottom: 0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: HexColor("#ECC0D9")),
                                          child: SizedBox(
                                            height: 273,
                                            child: ListView.builder(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16,
                                                      horizontal: 20),
                                              shrinkWrap: true,
                                              itemCount: services.length,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    selectedService
                                                                .toLowerCase() ==
                                                            services[index]
                                                                .toString()
                                                                .toLowerCase()
                                                        ? GradientText(
                                                            services[index],
                                                            style: const TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800),
                                                          )
                                                        : SizedBox(
                                                            width:
                                                                double.infinity,
                                                            child:
                                                                GestureDetector(
                                                              onTap: () async {
                                                                setState(() {
                                                                  selectedService =
                                                                      services[
                                                                          index];
                                                                  serviceController
                                                                          .text =
                                                                      selectedService;
                                                                });

                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            1000));

                                                                setState(() {
                                                                  showServices =
                                                                      false;
                                                                });
                                                              },
                                                              child: Text(
                                                                services[index],
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: HexColor(
                                                                        "#D972AE")),
                                                              ),
                                                            ),
                                                          ),
                                                    Divider(
                                                      color: HexColor("#E1AACA")
                                                          .withOpacity(.51),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),

                                    GestureDetector(
                                      onTap: () => setState(() {
                                        showMedicines = !showMedicines;
                                      }),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                            'lib/home_screen/assets/text-field-bg.png',
                                            width: double.infinity,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 2.5),
                                            child: TextFormField(
                                              readOnly: true,
                                              decoration: const InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 40),
                                                hintText:
                                                    'Choose Test & Medicine',
                                                hintStyle: TextStyle(
                                                  fontFamily: "Metropolis",
                                                  color: Color(
                                                    0xFF636363,
                                                  ),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                border: InputBorder.none,
                                              ),
                                              controller:
                                                  testAndMedicineController,
                                              onChanged: (String? value) {
                                                // This optional block of code can be used to run
                                                // code when the user saves the form.
                                                setState(() {});
                                              },
                                              onTap: () => setState(() {
                                                showMedicines = !showMedicines;
                                              }),
                                              style: const TextStyle(
                                                fontFamily: "Metropolis",
                                                color: Color(
                                                  0xFF636363,
                                                ),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 28,
                                            child: Icon(
                                              showMedicines
                                                  ? Icons.keyboard_arrow_up
                                                  : Icons.keyboard_arrow_down,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    if (showMedicines)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 12, left: 16, right: 16),
                                        child: Container(
                                          // padding:
                                          // const EdgeInsets.only(left: 20, right: 20, bottom: 0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: HexColor("#ECC0D9")),
                                          child: SizedBox(
                                            height: 273,
                                            child: ListView.builder(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16,
                                                      horizontal: 20),
                                              shrinkWrap: true,
                                              itemCount:
                                                  testsAndMedicines.length,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    selectedTestOrMedicine
                                                                .toLowerCase() ==
                                                            testsAndMedicines[
                                                                    index]
                                                                .toString()
                                                                .toLowerCase()
                                                        ? GradientText(
                                                            testsAndMedicines[
                                                                index],
                                                            style: const TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800),
                                                          )
                                                        : SizedBox(
                                                            width:
                                                                double.infinity,
                                                            child:
                                                                GestureDetector(
                                                              onTap: () async {
                                                                setState(() {
                                                                  selectedTestOrMedicine =
                                                                      testsAndMedicines[
                                                                          index];
                                                                  testAndMedicineController
                                                                          .text =
                                                                      selectedTestOrMedicine;
                                                                });

                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            1000));

                                                                setState(() {
                                                                  showMedicines =
                                                                      false;
                                                                });
                                                              },
                                                              child: Text(
                                                                testsAndMedicines[
                                                                    index],
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: HexColor(
                                                                        "#D972AE")),
                                                              ),
                                                            ),
                                                          ),
                                                    Divider(
                                                      color: HexColor("#E1AACA")
                                                          .withOpacity(.51),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),

                                    GestureDetector(
                                      onTap: () => setState(() {
                                        showConsultations = !showConsultations;
                                      }),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                            'lib/home_screen/assets/text-field-bg.png',
                                            width: double.infinity,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 2.5),
                                            child: TextFormField(
                                              readOnly: true,
                                              decoration: const InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 40),
                                                hintText: 'Choose Consultation',
                                                hintStyle: TextStyle(
                                                  fontFamily: "Metropolis",
                                                  color: Color(
                                                    0xFF636363,
                                                  ),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                border: InputBorder.none,
                                              ),
                                              controller:
                                                  consultationController,
                                              onChanged: (String? value) {
                                                // This optional block of code can be used to run
                                                // code when the user saves the form.
                                                setState(() {});
                                              },
                                              onTap: () => setState(() {
                                                showConsultations =
                                                    !showConsultations;
                                              }),
                                              style: const TextStyle(
                                                fontFamily: "Metropolis",
                                                color: Color(
                                                  0xFF636363,
                                                ),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 28,
                                            child: Icon(
                                              showConsultations
                                                  ? Icons.keyboard_arrow_up
                                                  : Icons.keyboard_arrow_down,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    if (showConsultations)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 12, left: 16, right: 16),
                                        child: Container(
                                          // padding:
                                          // const EdgeInsets.only(left: 20, right: 20, bottom: 0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: HexColor("#ECC0D9")),
                                          child: SizedBox(
                                            height: 173,
                                            child: ListView.builder(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16,
                                                      horizontal: 20),
                                              shrinkWrap: true,
                                              itemCount: consultations.length,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    selectedConsultation
                                                                .toLowerCase() ==
                                                            consultations[index]
                                                                .toString()
                                                                .toLowerCase()
                                                        ? GradientText(
                                                            consultations[
                                                                index],
                                                            style: const TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800),
                                                          )
                                                        : SizedBox(
                                                            width:
                                                                double.infinity,
                                                            child:
                                                                GestureDetector(
                                                              onTap: () async {
                                                                setState(() {
                                                                  selectedConsultation =
                                                                      consultations[
                                                                          index];
                                                                  consultationController
                                                                          .text =
                                                                      selectedConsultation;
                                                                });

                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            1000));

                                                                setState(() {
                                                                  showConsultations =
                                                                      false;
                                                                });
                                                              },
                                                              child: Text(
                                                                consultations[
                                                                    index],
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: HexColor(
                                                                        "#D972AE")),
                                                              ),
                                                            ),
                                                          ),
                                                    Divider(
                                                      color: HexColor("#E1AACA")
                                                          .withOpacity(.51),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),

                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4),
                                            child: Image.asset(
                                              "lib/home_screen/assets/shadow-book-now.png",
                                              width: double.infinity,
                                            ),
                                          ),
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Image.asset(
                                                "lib/home_screen/assets/book-now-btn.png",
                                                width: double.infinity,
                                              ),
                                              const Text(
                                                'BOOK NOW',
                                                style: TextStyle(
                                                  fontFamily: "Metropolis",
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Our Top',
                                          style: TextStyle(
                                            fontFamily: "Metropolis",
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          'Doctors',
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
                                        selectedGradientColor:
                                            const LinearGradient(
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
                                height: 630,
                                child: PageView.builder(
                                  itemCount: 3,
                                  controller: _pageController,
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Image.asset(
                                              "${assets}Group 2.png",
                                            ),
                                            Positioned(
                                              top: 40,
                                              left: 42,
                                              child: Image.asset(
                                                'assets/images/top_doctor.png',
                                                width: 113,
                                                height: 113,
                                              ),
                                            ),
                                            Positioned(
                                              top: 165,
                                              left: 40,
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      "${assets}charm_clock.svg"),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  const Text(
                                                    '10:00am - 4:00pm',
                                                    style: TextStyle(
                                                      fontFamily: "Metropolis",
                                                      color: Color(0xFF252525),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: 85,
                                              right: 50,
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 2,
                                                    right: 5,
                                                    top: 2,
                                                    bottom: 2),
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffECC0D9),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        "${assets}Star (2).svg"),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const Text(
                                                      '4.5',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "Metropolis",
                                                        color:
                                                            Color(0xFF252525),
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 135,
                                              right: 45,
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 16,
                                                    right: 16,
                                                    top: 10,
                                                    bottom: 10),
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                  "${assets}Rectangle 281.png",
                                                ))),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        "${assets}mingcute_bill-line.svg"),
                                                    const SizedBox(
                                                      width: 13,
                                                    ),
                                                    const GradientText(
                                                      '₹ 1000',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "Metropolis",
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                      gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                        colors: [
                                                          Color(0xFFAD37E0),
                                                          Color(0xFFEE2B3B),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Positioned(
                                              top: 50,
                                              left: 170,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  GradientText(
                                                    'Dr. Julie Smith',
                                                    style: TextStyle(
                                                      fontFamily: "Metropolis",
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                      colors: [
                                                        Color(0xFFAD37E0),
                                                        Color(0xFFEE2B3B),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    'BDS, MDS',
                                                    style: TextStyle(
                                                      fontFamily: "Metropolis",
                                                      color: Color(0xFF252525),
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    'Dental Specialist',
                                                    style: TextStyle(
                                                      fontFamily: "Metropolis",
                                                      color: Color(0xFF252525),
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: 235,
                                              left: 42,
                                              child: Image.asset(
                                                'assets/images/top_doctor_two.png',
                                                width: 113,
                                                height: 113,
                                              ),
                                            ),
                                            Positioned(
                                              top: 362,
                                              left: 40,
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      "${assets}charm_clock.svg"),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  const Text(
                                                    '10:00am - 4:00pm',
                                                    style: TextStyle(
                                                      fontFamily: "Metropolis",
                                                      color: Color(0xFF252525),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: 280,
                                              right: 50,
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 2,
                                                    right: 5,
                                                    top: 2,
                                                    bottom: 2),
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffECC0D9),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        "${assets}Star (2).svg"),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const Text(
                                                      '4.5',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "Metropolis",
                                                        color:
                                                            Color(0xFF252525),
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 328,
                                              right: 45,
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 16,
                                                    right: 16,
                                                    top: 10,
                                                    bottom: 10),
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                  "${assets}Rectangle 281.png",
                                                ))),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        "${assets}mingcute_bill-line.svg"),
                                                    const SizedBox(
                                                      width: 13,
                                                    ),
                                                    const GradientText(
                                                      '₹ 1000',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "Metropolis",
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                      gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                        colors: [
                                                          Color(0xFFAD37E0),
                                                          Color(0xFFEE2B3B),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Positioned(
                                              top: 245,
                                              left: 170,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  GradientText(
                                                    'Dr. Brian Stanley',
                                                    style: TextStyle(
                                                      fontFamily: "Metropolis",
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                      colors: [
                                                        Color(0xFFAD37E0),
                                                        Color(0xFFEE2B3B),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    'BDS, MDS',
                                                    style: TextStyle(
                                                      fontFamily: "Metropolis",
                                                      color: Color(0xFF252525),
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    'Dental Specialist',
                                                    style: TextStyle(
                                                      fontFamily: "Metropolis",
                                                      color: Color(0xFF252525),
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: 430,
                                              left: 42,
                                              child: Image.asset(
                                                'assets/images/top_doctor_three.png',
                                                width: 113,
                                                height: 113,
                                              ),
                                            ),
                                            Positioned(
                                              top: 558,
                                              left: 40,
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      "${assets}charm_clock.svg"),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  const Text(
                                                    '10:00am - 4:00pm',
                                                    style: TextStyle(
                                                      fontFamily: "Metropolis",
                                                      color: Color(0xFF252525),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: 475,
                                              right: 50,
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 2,
                                                    right: 5,
                                                    top: 2,
                                                    bottom: 2),
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffECC0D9),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        "${assets}Star (2).svg"),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const Text(
                                                      '4.5',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "Metropolis",
                                                        color:
                                                            Color(0xFF252525),
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 522,
                                              right: 45,
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 16,
                                                    right: 16,
                                                    top: 10,
                                                    bottom: 10),
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                  "${assets}Rectangle 281.png",
                                                ))),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        "${assets}mingcute_bill-line.svg"),
                                                    const SizedBox(
                                                      width: 13,
                                                    ),
                                                    const GradientText(
                                                      '₹ 1000',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "Metropolis",
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                      gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                        colors: [
                                                          Color(0xFFAD37E0),
                                                          Color(0xFFEE2B3B),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Positioned(
                                              top: 442,
                                              left: 170,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  GradientText(
                                                    'Dr. Brian Stanley',
                                                    style: TextStyle(
                                                      fontFamily: "Metropolis",
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                      colors: [
                                                        Color(0xFFAD37E0),
                                                        Color(0xFFEE2B3B),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    'BDS, MDS',
                                                    style: TextStyle(
                                                      fontFamily: "Metropolis",
                                                      color: Color(0xFF252525),
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    'Dental Specialist',
                                                    style: TextStyle(
                                                      fontFamily: "Metropolis",
                                                      color: Color(0xFF252525),
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
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
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Image.asset(
                              '${assets}Frame 132 (1).png',
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
                              right: 24,
                              bottom: 16,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.white.withOpacity(0.2))),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 2.0, sigmaY: 2.0),
                                    child: Container(
                                      width: 204,
                                      height: 94,
                                      padding: const EdgeInsets.only(
                                          left: 23, top: 17, bottom: 17),
                                      child: const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GradientText(
                                            'Dental Clinic',
                                            style: TextStyle(
                                              fontFamily: "Metropolis",
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
                                              fontFamily: "Metropolis",
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
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        Stack(
                          children: [
                            Image.asset(
                              '${assets}Frame 126.png',
                            ),
                            const Positioned(
                              left: 50,
                              top: 50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'This Months',
                                    style: TextStyle(
                                      fontFamily: "Metropolis",
                                      color: Color(
                                        0xFF252525,
                                      ),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'Stats',
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
                              right: 61,
                              top: 100,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        width: 1,
                                        color: const Color(0xffC133AD)
                                            .withOpacity(0.2))),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10.0, sigmaY: 10.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: 104,
                                      child: const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GradientText(
                                            '60+',
                                            style: TextStyle(
                                              fontFamily: "Metropolis",
                                              fontSize: 30,
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
                                          Text(
                                            'Patients',
                                            style: TextStyle(
                                              fontFamily: "Metropolis",
                                              color: Color(
                                                0xFF252525,
                                              ),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 22,
                              left: 22,
                              top: 160,
                              child: Image.asset("${assets}Vector 1 (1).png"),
                            ),
                            const Positioned(
                                top: 275,
                                right: 40,
                                left: 40,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("MON",
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          color: Color(0xffD52F79),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w800,
                                        )),
                                    Text("TUE",
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          color: Color(0xffD52F79),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w800,
                                        )),
                                    Text("WED",
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          color: Color(0xffD52F79),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w800,
                                        )),
                                    Text("THU",
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          color: Color(0xffD52F79),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w800,
                                        )),
                                    Text("FRI",
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          color: Color(0xffD52F79),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w800,
                                        )),
                                    Text("SAT",
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          color: Color(0xffD52F79),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w800,
                                        )),
                                  ],
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Major City',
                                        style: TextStyle(
                                          fontFamily: "Metropolis",
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        'Reviews',
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
                                      selectedGradientColor:
                                          const LinearGradient(
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
                              height: 710,
                              child: PageView.builder(
                                itemCount: 3,
                                controller: _pageController,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Stack(
                                    children: [
                                      Image.asset(
                                        '${assets}Group 2 (1).png',
                                      ),
                                      Positioned(
                                        top: 40,
                                        left: 40,
                                        right: 40,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.asset(
                                            '${assets}unsplash_zWsLmkWgirU (1).png',
                                            width: 310,
                                            height: 190,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 160,
                                        left: 40,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "${assets}Rectangle 834.png"))),
                                          alignment: Alignment.center,
                                          width: 107 + 40,
                                          height: 30 + 40,
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                                right: 15, top: 15),
                                            child: GradientText(
                                              'Delhi',
                                              style: TextStyle(
                                                fontFamily: "Metropolis",
                                                fontSize: 16,
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
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        top: 240,
                                        left: 42,
                                        child: SizedBox(
                                          width: 325,
                                          child: Text(
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit.',
                                            style: TextStyle(
                                              fontFamily: "Metropolis",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 360,
                                        left: 40,
                                        right: 40,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.asset(
                                            '${assets}unsplash_B4qmgZdSQp0 (1).png',
                                            width: 310,
                                            height: 190,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 480,
                                        left: 40,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "${assets}Rectangle 834 (1).png"))),
                                          alignment: Alignment.center,
                                          width: 154 + 40,
                                          height: 30 + 40,
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                                right: 15, top: 15),
                                            child: GradientText(
                                              'Bangalore',
                                              style: TextStyle(
                                                fontFamily: "Metropolis",
                                                fontSize: 16,
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
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        top: 566,
                                        left: 42,
                                        child: SizedBox(
                                          width: 325,
                                          child: Text(
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit.',
                                            style: TextStyle(
                                              fontFamily: "Metropolis",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
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
                          ],
                        ),
                        Container(
                          height: 345,
                          color: const Color(0xFFECC0D9),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              const SizedBox(height: 30),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Get',
                                          style: TextStyle(
                                            fontFamily: "Metropolis",
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          'Insurance',
                                          style: TextStyle(
                                            fontFamily: "Metropolis",
                                            color: Colors.black,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 224,
                                child: ListView.builder(
                                  itemCount: 4,
                                  controller: _pageController,
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: index == 0 ? 10 : 0),
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            '${assets}Frame 118.png',
                                            width: 279,
                                            height: 214,
                                            fit: BoxFit.fill,
                                          ),
                                          Positioned(
                                            bottom: 75,
                                            right: 30,
                                            child: Image.asset(
                                              index == 1
                                                  ? "${assets}1200px-SBI_Life_Insurance_Company_Limited 1.png"
                                                  : '${assets}HDFC_Life_Logo 1 (1).png',
                                              width: index == 1 ? 78 : 50,
                                              height: index == 1 ? 30 : 35,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Positioned(
                                            top: 36,
                                            left: 30,
                                            child: SizedBox(
                                              width: 220,
                                              child: GradientText(
                                                index == 1
                                                    ? "SBI Life Insurance Company Ltd."
                                                    : 'HDFC Life Insurance Company Ltd.',
                                                style: const TextStyle(
                                                  fontFamily: "Metropolis",
                                                  fontSize: 20,
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
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 22,
                                            left: 10,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                              child: Image.asset(
                                                '${assets}happy-family-sitting-couch-living-room (1) 1.png',
                                                width: 170,
                                                height: 110,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Donate To',
                                          style: TextStyle(
                                            fontFamily: "Metropolis",
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          'NGO',
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
                                        selectedGradientColor:
                                            const LinearGradient(
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
                                height: 320,
                                child: PageView.builder(
                                  itemCount: 3,
                                  controller: _pageController,
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Image.asset(
                                              'assets/images/ngo_frame.png',
                                            ),
                                            Positioned(
                                              top: 35,
                                              left: 210,
                                              child: Image.asset(
                                                'assets/images/women_ngo.png',
                                                width: 146,
                                                height: 118,
                                              ),
                                            ),
                                            const Positioned(
                                              top: 50,
                                              left: 40,
                                              child: SizedBox(
                                                width: 177,
                                                child: GradientText(
                                                  'Bharati Foundation',
                                                  style: TextStyle(
                                                    fontFamily: "Metropolis",
                                                    fontSize: 24,
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
                                            ),
                                            Positioned(
                                              top: 176,
                                              left: 210,
                                              child: Image.asset(
                                                'assets/images/ngo_girl.png',
                                                width: 146,
                                                height: 112,
                                              ),
                                            ),
                                            const Positioned(
                                              top: 185,
                                              left: 40,
                                              child: SizedBox(
                                                width: 177,
                                                child: GradientText(
                                                  'Ipas Development Foundation',
                                                  style: TextStyle(
                                                    fontFamily: "Metropolis",
                                                    fontSize: 24,
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
                                            ),
                                          ],
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
                            ],
                          ),
                        ),
                        const SizedBox(height: 120),
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

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
