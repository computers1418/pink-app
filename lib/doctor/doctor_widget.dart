import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/app_bar/app_bar.dart';
import 'package:flutter_application_1/common/gradient_text_widget.dart';
import 'package:flutter_application_1/constents/commen_widgets.dart';
import 'package:flutter_application_1/doctor/coupon_widget.dart';
import 'package:flutter_application_1/doctor/details_widget.dart';
import 'package:flutter_application_1/doctor/invoice_widget.dart';
import 'package:flutter_application_1/doctor/option_widget.dart';
import 'package:flutter_application_1/doctor/parents_widget.dart';
import 'package:flutter_application_1/doctor/rating_widget.dart';
import 'package:flutter_application_1/doctor/review_widget.dart';
import 'package:flutter_application_1/doctor/summary_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bottom_nav_bar/bottom_nav_bar.dart';
import '../home/side_bar/side_bar_widget.dart';

class DoctorWidget extends StatefulWidget {
  const DoctorWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return DoctorWidgetState();
  }
}

class DoctorWidgetState extends State<DoctorWidget>
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

      print("pressed");
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
    String assets = "lib/doctor/assets/";
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
              shadow: 0.3,
              callback: callback,
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
                    children: [
                      Container(
                        decoration: CommonWidgets.imageDecoration(
                            "${assets}Group 2 (2).png"),
                        width: MediaQuery.of(context).size.width,
                        child: const Column(
                          children: [
                            SizedBox(height: 50),
                            DetailsWidget(),
                            SizedBox(height: 30),
                            SummaryWidget(),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                      Container(
                        color: const Color(0xFFF3EDF4),
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 30,
                              ),
                              child: RatingWidget(),
                            ),
                            SizedBox(height: 50),
                            CouponWidget(),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                      const InvoiceWidget(),
                      const ParentsWidget(),
                      const OptionWidget(),
                      const ReviewWidget(),
                    ],
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
