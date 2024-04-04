import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/common/gradient_text_widget.dart';
import 'package:flutter_svg/svg.dart';

import '../back_popup/back_popup.dart';
import '../constents/commen_styles.dart';

class ForgetPasswordWidget extends StatefulWidget {
  const ForgetPasswordWidget({super.key});

  @override
  State<ForgetPasswordWidget> createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordWidget> {
  FocusNode focusNode = FocusNode();

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
    String assets = "lib/forget_password/assets/";

    return Scaffold(
      backgroundColor: const Color(0xFF252525),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();

          return true;
        },
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xFF252525),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Container(
                      color: const Color(0xFF252525),
                      height: 190,
                    ),
                    Positioned(
                      top: -120,
                      left: 0,
                      child: Image.asset(
                        'assets/images/forget_password.png',
                        height: 388,
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 25,
                        top: 40,
                        left: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              backAlertDialog(
                                  context,
                                  Text.rich(
                                      textAlign: TextAlign.center,
                                      TextSpan(children: [
                                        TextSpan(
                                            text:
                                                "Complete this process to\nchange password.\nGoing back takes you to\nLOGIN screen.",
                                            style: CommonStyle.metropolis16W700(
                                                color: Colors.white)),
                                      ])));
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/mode.png',
                                height: 62,
                                width: 62,
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Light Mode',
                                style: TextStyle(
                                  fontFamily: "Metropolis",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 288,
                  margin: const EdgeInsets.only(left: 25),
                  child: const GradientText(
                    'Forgot Password',
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontSize: 48,
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
                Container(
                  margin: const EdgeInsets.only(
                    left: 25,
                    top: 5,
                    right: 25,
                  ),
                  child: const Text(
                    'Enter your registered email or phone number to recieve a verification code.',
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 74),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Image.asset(
                        focusNode.hasFocus
                            ? 'assets/images/name_sign_up.png'
                            : 'assets/images/password_login.png',
                      ),
                    ),
                    Visibility(
                      visible: focusNode.hasFocus,
                      child: Positioned(
                        top: -8,
                        left: 50,
                        child: Container(
                          color: const Color(0xFF252525),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            'User ID',
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 45,
                        right: 45,
                        top: 4,
                      ),
                      child: TextFormField(
                        focusNode: focusNode,
                        decoration: InputDecoration(
                          hintText: 'Email / Phone no.',
                          hintStyle: TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                          setState(() {});
                        },
                        onTap: () {
                          setState(() {});
                        },
                        style: const TextStyle(
                          fontFamily: "Metropolis",
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 111,
                        height: 18,
                        margin: const EdgeInsets.only(bottom: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF0000).withOpacity(0.2),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              "${assets}Warning.svg",
                              height: 10,
                              width: 10,
                            ),
                            const Text(
                              'Invalid User ID',
                              style: TextStyle(
                                fontFamily: "Metropolis",
                                color: Color(0xFFFF0000),
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/book_now.png',
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 14),
                        child: const Center(
                          child: Text(
                            'SEND',
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
                const SizedBox(height: 30),
                Stack(
                  children: [
                    Container(
                      color: const Color(0xFF252525),
                      height: 128,
                    ),
                    Positioned(
                      bottom: -135,
                      right: -100,
                      child: Image.asset(
                        'assets/images/forget_password_bottom.png',
                        height: 388,
                        width: 388,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
