import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../app_bar/app_bar.dart';
import '../../../bottom_nav_bar/bottom_nav_bar.dart';
import '../../../constents/pageview.dart';
import '../../../home/side_bar/side_bar_widget.dart';

class ScheduleAppointment extends StatefulWidget {
  const ScheduleAppointment({super.key});

  @override
  State<ScheduleAppointment> createState() => _ScheduleAppointmentState();
}

class _ScheduleAppointmentState extends State<ScheduleAppointment>
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

  late PageController _pageController;

  setPageController() {
    _pageController.animateToPage(currentIndex,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  String selectedItem = 'Decayed Tooth';
  List imgList1 = [
    '07:30 am - 08:15 am',
    '08:15 am - 09:00 am',
    '09:00 am - 09:45 am',
    '09:45 am - 10:30 am',
    '10:30 am - 11:15 am',
    '11:15 am - 12:00 pm',
    '07:30 am - 08:15 am',
    '08:15 am - 09:00 am',
    '09:00 am - 09:45 am',
  ];

  List imgList2 = [
    '12:00 pm - 12:45 pm',
    '12:45 pm - 01:30 pm',
    '01:30 pm - 02:15 pm',
    '02:15 pm - 03:00 pm',
    '03:00 pm - 03:30 pm',
    '03:30 pm - 04:00 pm',
    '12:00 pm - 12:45 pm',
    '12:45 pm - 01:30 pm',
    '01:30 pm - 02:15 pm',
  ];

  List imgList3 = [
    '04:00 pm - 04:45 pm',
    '04:45 pm - 05:30 pm',
    '05:30 pm - 06:15 pm',
    '06:15 pm - 07:00 pm',
    '07:00 pm - 08:30 pm',
    '08:30 pm - 09:00 pm',
    '04:00 pm - 04:45 pm',
    '04:45 pm - 05:30 pm',
    '05:30 pm - 06:15 pm',
  ];

  List currentList = [];

  List monthsList = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  List daysList = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  int currentIndex = 0;
  DateTime _selectedDate = DateTime.now();

  setindex(index) {
    setState(() {
      currentIndex = index;
      if (index == 0) {
        currentList = imgList1;
      } else if (index == 1) {
        currentList = imgList2;
      } else {
        currentList = imgList3;
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
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
    setState(() {
      currentList = imgList1;
      _pageController = PageController(
        initialPage: 0,
      );
    });
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
          color: Color(0xFFF2ECF3),
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
                                      "Schedule",
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Text(
                                    "Appointment",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Image.asset(
                                "lib/appointments/pages/schedule_appointment/assets/calender.png",
                                height: 56,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 40,
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20, top: 0),
                            decoration: BoxDecoration(
                              color: HexColor("#ECC0D9"),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(30)),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Date",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 38),
                                          child: GestureDetector(
                                            onTap: () {
                                              if ('${_selectedDate.day}-${_selectedDate.month}-${_selectedDate.year}' !=
                                                  '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}') {
                                                setState(() {
                                                  _selectedDate = _selectedDate
                                                      .subtract(const Duration(
                                                          days: 1));
                                                });
                                              }
                                            },
                                            child: Image.asset(
                                              "lib/appointments/pages/"
                                              "schedule_appointment/assets/${'${_selectedDate.day}-${_selectedDate.month}-${_selectedDate.year}' == '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}' ? 'prev-disabled' : 'prev'}.png",
                                              height: 58,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: -6,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _selectedDate = _selectedDate
                                                    .add(const Duration(
                                                        days: 1));
                                              });
                                              print(_selectedDate.day);
                                            },
                                            child: Image.asset(
                                              "lib/appointments/pages/"
                                              "schedule_appointment/assets/next.png",
                                              height: 58,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  height: 70,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      color: HexColor("#F3EDF4"),
                                      boxShadow: [
                                        BoxShadow(
                                            color: HexColor("#ECC0D9"),
                                            offset: const Offset(8, 8),
                                            blurRadius: 15),
                                        BoxShadow(
                                            color: HexColor("#ECC0D9"),
                                            offset: const Offset(-8, -8),
                                            blurRadius: 15),
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, top: 8, bottom: 8, right: 16),
                                    child: Row(
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              height: 48,
                                              width: 48,
                                              decoration: BoxDecoration(
                                                  color: HexColor("#ECC0D9"),
                                                  shape: BoxShape.circle),
                                            ),
                                            GradientText(
                                              _selectedDate.day.toString(),
                                              style: const TextStyle(
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w800),
                                              colors: [
                                                HexColor("#AD37E0"),
                                                HexColor("#EE2B3B"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if ('${_selectedDate.day}-${_selectedDate.month}-${_selectedDate.year}' ==
                                                '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}')
                                              Container(
                                                height: 16,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Center(
                                                  child: GradientText(
                                                    "Today",
                                                    colors: [
                                                      HexColor("#AD37E0"),
                                                      HexColor("#EE2B3B"),
                                                    ],
                                                    style: const TextStyle(
                                                        fontSize: 8,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                ),
                                              ),
                                            Row(
                                              children: [
                                                Text(
                                                  "${monthsList[_selectedDate.month - 1]}, ",
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                                if (isCollapsed)
                                                  Text(
                                                    "${daysList[_selectedDate.weekday - 1]}",
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        if (isCollapsed) const Spacer(),
                                        if (isCollapsed)
                                          Image.asset(
                                            "assets/images/active-radio.png",
                                            height: 36,
                                            width: 36,
                                          )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 580,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 40,
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20, top: 10),
                                decoration: BoxDecoration(
                                  color: HexColor("#ECC0D9"),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Time",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Stack(
                                          alignment: Alignment.centerRight,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 38),
                                              child: GestureDetector(
                                                onTap: () {
                                                  if (currentIndex > 0) {
                                                    setState(() {
                                                      currentIndex--;
                                                    });
                                                    setPageController();
                                                  }
                                                },
                                                child: Image.asset(
                                                  "lib/appointments/pages/"
                                                  "schedule_appointment/assets/${currentIndex == 0 ? 'prev-disabled' : 'prev'}.png",
                                                  height: 58,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: -6,
                                              child: GestureDetector(
                                                onTap: () {
                                                  if (currentIndex < 2) {
                                                    setState(() {
                                                      currentIndex++;
                                                    });
                                                    setPageController();
                                                  }
                                                },
                                                child: Image.asset(
                                                  "lib/appointments/pages/"
                                                  "schedule_appointment/assets/${currentIndex == 2 ? 'next-disabled' : 'next'}.png",
                                                  height: 58,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 60, left: 20, right: 20),
                              child: MyPageView(
                                pageViewHeight: 490,
                                callback: setindex,
                                pageController: _pageController,
                                pagesCount: 3,
                                itemBuilder: (con, ind) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 16,
                                          left: 16,
                                          right: 18,
                                          bottom: 0),
                                      decoration: BoxDecoration(
                                        color: HexColor("#F3EDF4"),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              currentIndex == 0
                                                  ? "Morning"
                                                  : currentIndex == 1
                                                      ? "Afternoon"
                                                      : "Evening",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: HexColor("#D06FA6"),
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Expanded(
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  for (int i = 0; i < 9; i++)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 12),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            selectedItem =
                                                                currentList[i];
                                                          });
                                                        },
                                                        child: Card(
                                                          elevation: 6,
                                                          shadowColor: HexColor(
                                                              "#DFD3E1"),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30)),
                                                          child: Container(
                                                            height: 50,
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              color: HexColor(
                                                                  "#F3EDF4"),
                                                              // boxShadow: [
                                                              //   BoxShadow(
                                                              //     color: HexColor("#ECC0D9"),
                                                              //     offset: const Offset(5, 5),
                                                              //     blurRadius: 20),
                                                              //   BoxShadow(
                                                              //     color: HexColor("#ECC0D9"),
                                                              //     offset: const Offset(-5, -5),
                                                              //     blurRadius: 10),
                                                              // ]
                                                            ),
                                                            child: Center(
                                                              child: selectedItem !=
                                                                      currentList[
                                                                          i]
                                                                  ? Text(
                                                                      currentList[
                                                                          i],
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.w800),
                                                                    )
                                                                  : GradientText(
                                                                      currentList[
                                                                          i],
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.w800),
                                                                      colors: [
                                                                        HexColor(
                                                                            "#AD37E0"),
                                                                        HexColor(
                                                                            "#EE2B3B"),
                                                                      ],
                                                                    ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 110,
                        )
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
