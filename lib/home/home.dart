import 'package:flutter/material.dart';
import 'package:flutter_application_1/create_password/create_password.dart';
import 'package:flutter_application_1/create_password/set_password.dart';
import 'package:flutter_application_1/doctor/doctor_widget.dart';
import 'package:flutter_application_1/doctor_description/doctor_description.dart';
import 'package:flutter_application_1/forget_password/forget_password.dart';
import 'package:flutter_application_1/home/side_bar/side_bar_widget.dart';
import 'package:flutter_application_1/intro/intro_widget.dart';
import 'package:flutter_application_1/login/login.dart';
import 'package:flutter_application_1/map/map.dart';
import 'package:flutter_application_1/payment/payment.dart';
import 'package:flutter_application_1/signup/signup.dart';
import 'package:flutter_application_1/verification/verification.dart';
import 'package:page_transition/page_transition.dart';

import '../appointments/pages/previous_apointments_list/previous_appointments_list.dart';
import '../appointments/pages/previous_appointment_details/previous_appointment_details.dart';
import '../appointments/pages/schedule_appointment/schedule_appointment.dart';
import '../appointments/pages/success_page/success_screen.dart';
import '../appointments/pages/upcoming_appointment_details/upcoming_appointment_details.dart';
import '../appointments/pages/upcoming_appointments_list/upcoming_appointments_list.dart';
import '../consultation/pages/choose_medicine/choose_medicine.dart';
import '../consultation/pages/choose_service/choose_service.dart';
import '../home_screen/home_screen.dart';
import '../module_name/pages/doctor_description_screen/doctor_description_screen.dart';
import '../module_name/pages/donation_screen/donation_screen.dart';
import '../module_name/pages/insurance_screen/insurance_screen.dart';
import '../module_name/pages/privacy_policy_terms_conditions/privacy_policy.dart';
import '../module_name/pages/privacy_policy_terms_conditions/terms_conditions.dart';
import '../module_name/pages/problem_description/problem_description_screen.dart';
import '../module_name/pages/reschedule_appointment/reschedule_appointment_screen.dart';
import '../profile/pages/edit_profile/edit_profile_screen.dart';
import '../profile/pages/profile/profile_screen.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeWidgetState();
  }
}

class HomeWidgetState extends State<HomeWidget>
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

  List<Map> data = [
    {'text': "Donation Screen", "page": const DonationScreen()},
    {'text': "Insurance Screen", "page": const InsuranceScreen()},
    {'text': "Privacy Policy", "page": const PrivacyPolicy()},
    {'text': "Terms And Conditions", "page": const TermsAndConditions()},
    {'text': "Reschedule Appointment", "page": const RescheduleAppointment()},
    {'text': "Problem Description", "page": const ProblemDescription()},
    {
      'text': "Doctor Description Screen",
      "page": const DoctorDescriptionScreen()
    },
  ];

  @override
  void initState() {
    super.initState();
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

      print("pressed");
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
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
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: isCollapsed
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            child: Container(
              margin: const EdgeInsets.all(15),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isCollapsed)
                          _controller.forward();
                        else
                          _controller.reverse();

                        isCollapsed = !isCollapsed;
                      });
                      // Navigator.push(
                      //   context,
                      //   PageTransition(
                      //     type: PageTransitionType.leftToRight,
                      //     child: const SideBarWidget(),
                      //   ),
                      // );
                    },
                    child: const Icon(
                      Icons.menu,
                      size: 25,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const LoginWidget(),
                            ),
                          );
                        },
                        child: Container(
                          color: Colors.black,
                          padding: const EdgeInsets.all(25),
                          child: const Text(
                            "Login screen",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      if (isCollapsed)
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: const DoctorWidget(),
                              ),
                            );
                          },
                          child: Container(
                            color: Colors.black,
                            padding: const EdgeInsets.all(25),
                            child: const Text(
                              "Doctor screen",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const SignUpWidget(),
                            ),
                          );
                        },
                        child: Container(
                          color: Colors.black,
                          padding: const EdgeInsets.all(25),
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child: const Text(
                              "Sign up screen",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (isCollapsed)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: const MyHomePage(),
                              ),
                            );
                          },
                          child: Container(
                            color: Colors.black,
                            padding: const EdgeInsets.all(25),
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              child: const Text(
                                "Details page",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const ForgetPasswordWidget(),
                            ),
                          );
                        },
                        child: Container(
                          color: Colors.black,
                          padding: const EdgeInsets.all(25),
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child: const Text(
                              "Forget password",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (isCollapsed)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: PaymentWidget(),
                              ),
                            );
                          },
                          child: Container(
                            color: Colors.black,
                            padding: const EdgeInsets.all(25),
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              child: const Text(
                                "Payment",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const CreatePasswordWidget(),
                            ),
                          );
                        },
                        child: Container(
                          color: Colors.black,
                          padding: const EdgeInsets.all(25),
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child: const Text(
                              "Create password",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (isCollapsed)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: const DoctorDescriptionWidget(),
                              ),
                            );
                          },
                          child: Container(
                            color: Colors.black,
                            padding: const EdgeInsets.all(25),
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              child: const Text(
                                "Doctor des.",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const SetPasswordWidget(),
                            ),
                          );
                        },
                        child: Container(
                          color: Colors.black,
                          padding: const EdgeInsets.all(25),
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child: const Text(
                              "Set password",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (isCollapsed)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: const MapWidget(),
                              ),
                            );
                          },
                          child: Container(
                            color: Colors.black,
                            padding: const EdgeInsets.all(25),
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              child: const Text(
                                "Map",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const VerificationWidget(
                            email: 'abc@gmail.com',
                            number: '9876578910',
                            userID: '',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.black,
                      padding: const EdgeInsets.all(25),
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        child: const Text(
                          "Verification password screen",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const IntroWidget(),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.black,
                      padding: const EdgeInsets.all(25),
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        child: const Text(
                          "Intro screen",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  for (int index = 0; index < data.length; index++)
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                data[index]["page"],
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "${data[index]["text"]}",
                        ),
                      ),
                    ),

                  // GestureDetector(
                  //   onTap: () => Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => const CancelAppointmentScreen())
                  //   ),
                  //   child: const Card(
                  //     child: ListTile( title: Text("Cancel Appointment"),
                  //     ),
                  //   ),
                  // ),

                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScheduleAppointment())),
                    child: const Card(
                      child: ListTile(
                        title: Text("Schedule Appointment"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChooseMedicine())),
                    child: const Card(
                      child: ListTile(
                        title: Text("Choose Medicine"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChooseService())),
                    child: const Card(
                      child: ListTile(
                        title: Text("Choose Service"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen())),
                    child: const Card(
                      child: ListTile(
                        title: Text("Profile"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfileScreen())),
                    child: const Card(
                      child: ListTile(
                        title: Text("Edit Profile"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PreviousAppointmentsListScreen())),
                    child: const Card(
                      child: ListTile(
                        title: Text("Previous Appointments List"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PreviousAppointmentDetailsScreen())),
                    child: const Card(
                      child: ListTile(
                        title: Text("Previous Appointment Details"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UpcomingAppointmentsListScreen())),
                    child: const Card(
                      child: ListTile(
                        title: Text("Upcoming Appointments List"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UpcomingAppointmentDetailsScreen())),
                    child: const Card(
                      child: ListTile(
                        title: Text("Upcoming Appointment Details"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SuccessScreen(
                                  type: "cancelled",
                                ))),
                    child: const Card(
                      child: ListTile(
                        title: Text("Appointment Cancelled"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SuccessScreen(
                                  type: "rescheduled",
                                ))),
                    child: const Card(
                      child: ListTile(
                        title: Text("Reschedule Successful"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SuccessScreen(
                                  type: "confirmed",
                                ))),
                    child: const Card(
                      child: ListTile(
                        title: Text("Booking Confirmed"),
                      ),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () => Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => ConsultationPageConsultationDetails())
                  //   ),
                  //   child: const Card(
                  //     child: ListTile( title: Text("Consultation Page Consultation Details"),
                  //     ),
                  //   ),
                  // ),
                  // GestureDetector(
                  //   onTap: () => Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => SearchPageConsultationDetails())
                  //   ),
                  //   child: const Card(
                  //     child: ListTile( title: Text("Search Page Consultation Details"),
                  //     ),
                  //   ),
                  // ),
                  // GestureDetector(
                  //   onTap: () => Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => SetPrice())
                  //   ),
                  //   child: const Card(
                  //     child: ListTile( title: Text("Set Price"),
                  //     ),
                  //   ),
                  // ),
                  // GestureDetector(
                  //   onTap: () => Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => IconScreen())
                  //   ),
                  //   child: const Card(
                  //     child: ListTile( title: Text("Icon Screen"),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
