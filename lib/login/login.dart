import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/common/gradient_text_widget.dart';
import 'package:flutter_application_1/doctor/doctor_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  /// For user name field
  late TextEditingController userNameFieldController;
  late bool enterUserName;
  late FocusNode userNameFocus;
  late bool userNameFieldEmpty;

  /// For password field
  late TextEditingController passwordFieldController;
  late bool enterPassword;
  late FocusNode passwordFocus;
  late bool passwordFieldEmpty;

  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light // Set your desired color
        ));

    /// For user name field
    userNameFieldController = TextEditingController();
    enterUserName = false;
    userNameFocus = FocusNode();
    userNameFieldEmpty = false;

    /// For password field
    passwordFieldController = TextEditingController();
    enterPassword = false;
    passwordFocus = FocusNode();
    passwordFieldEmpty = false;
  }

  @override
  Widget build(BuildContext context) {
    String assets = "lib/login/assets/";

    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();

          return true;
        },
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xFF252525),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      color: const Color(0xFF252525),
                      height: 240,
                    ),
                    Positioned(
                      top: -100,
                      right: -10,
                      child: Image.asset(
                        'assets/images/ellipse_login.png',
                        height: 388,
                        width: 200,
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 25,
                      child: Image.asset(
                        'assets/images/mode.png',
                        height: 62,
                        width: 62,
                      ),
                    ),
                    const Positioned(
                      top: 80,
                      left: 25,
                      right: 28,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 160,
                            child: GradientText(
                              'Hello There.',
                              style: TextStyle(
                                fontFamily: "Metropolis",
                                fontSize: 50,
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
                        ],
                      ),
                    ),
                    const Positioned(
                      right: 27,
                      top: 110,
                      child: Text(
                        'Light Mode',
                        style: TextStyle(
                          fontFamily: "Metropolis",
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 220,
                      left: 25,
                      child: Text(
                        'Login or Sign up to continue.',
                        style: TextStyle(
                          fontFamily: "Metropolis",
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                // Stack(
                //   children: [
                //     Image.asset(
                //       'assets/images/login_method.png',
                //       height: 90,
                //       width: 378,
                //       fit: BoxFit.fill,
                //     ),
                //     Positioned(
                //       left: 45,
                //       top: 32,
                //       child: Row(
                //         children: [
                //           Image.asset(
                //             'assets/images/facebook.png',
                //             height: 24,
                //             width: 24,
                //             fit: BoxFit.fill,
                //           ),
                //           const SizedBox(width: 10),
                //           const Text(
                //             'Facebook',
                //             style: TextStyle(fontFamily: "Metropolis",
                //               fontSize: 16,
                //               fontWeight: FontWeight.w600,
                //               color: Colors.white,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     Positioned(
                //       right: 70,
                //       top: 32,
                //       child: Row(
                //         children: [
                //           Image.asset(
                //             'assets/images/google.png',
                //             height: 24,
                //             width: 24,
                //             fit: BoxFit.fill,
                //           ),
                //           const SizedBox(width: 10),
                //           const Text(
                //             'Google',
                //             style: TextStyle(fontFamily: "Metropolis",
                //               fontSize: 16,
                //               fontWeight: FontWeight.w600,
                //               color: Colors.white,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                //
                // const Text(
                //   'Or',
                //   style: TextStyle(fontFamily: "Metropolis",
                //     fontSize: 20,
                //     fontWeight: FontWeight.w600,
                //     color: Colors.white,
                //   ),
                // ),
                //
                const SizedBox(height: 60),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Image.asset(
                        userNameFocus.hasFocus
                            ? 'assets/images/name_sign_up.png'
                            : 'assets/images/password_login.png',
                      ),
                    ),
                    Visibility(
                      visible: userNameFocus.hasFocus,
                      child: Positioned(
                        top: -8,
                        left: 50,
                        child: Container(
                          color: const Color(0xFF252525),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            'User name',
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 55,
                        right: 55,
                        top: 5,
                      ),
                      child: TextFormField(
                        controller: userNameFieldController,
                        decoration: InputDecoration(
                          hintText: 'User Name',
                          hintStyle: TextStyle(
                            fontFamily: "Metropolis",
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                          border: InputBorder.none,
                        ),
                        focusNode: userNameFocus,
                        onChanged: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                          setState(() {
                            if (value != null && value.isNotEmpty) {
                              userNameFieldEmpty = false;
                            } else {
                              userNameFieldEmpty = true;
                            }
                          });
                        },
                        onTap: () {
                          setState(() {
                            enterUserName = true;
                          });
                        },
                        style: const TextStyle(
                          fontFamily: "Metropolis",
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: userNameFieldEmpty ? 10 : 0),
                Visibility(
                  visible: userNameFieldEmpty,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 108,
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
                ),
                SizedBox(height: !userNameFieldEmpty ? 25 : 0),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Image.asset(
                        passwordFocus.hasFocus
                            ? 'assets/images/name_sign_up.png'
                            : 'assets/images/password_login.png',
                      ),
                    ),
                    Visibility(
                      visible: passwordFocus.hasFocus,
                      child: Positioned(
                        left: 50,
                        top: -5,
                        child: Container(
                          color: const Color(0xFF252525),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            'Password',
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 55,
                        right: 55,
                        top: 5,
                      ),
                      child: TextFormField(
                        controller: passwordFieldController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontFamily: "Metropolis",
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                          border: InputBorder.none,
                        ),
                        focusNode: passwordFocus,
                        onChanged: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                          setState(() {
                            if (value != null && value.isNotEmpty) {
                              passwordFieldEmpty = false;
                            } else {
                              passwordFieldEmpty = true;
                            }
                          });
                        },
                        onTap: () {
                          setState(() {
                            enterPassword = true;
                          });
                        },
                        style: const TextStyle(
                          fontFamily: "Metropolis",
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/remember_login.png',
                            height: 15,
                            width: 15,
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            'Remember me',
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: passwordFieldEmpty,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 45),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 122,
                                  height: 18,
                                  margin: const EdgeInsets.only(bottom: 14),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFF0000)
                                        .withOpacity(0.2),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SvgPicture.asset(
                                        "${assets}Warning.svg",
                                        height: 10,
                                        width: 10,
                                      ),
                                      const Text(
                                        'Wrong Password',
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
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 45),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () async {
                      final check = await signUP();
                      if (check) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DoctorWidget(),
                          ),
                        );
                      } else {
                        passwordFieldEmpty = true;
                        userNameFieldEmpty = true;
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Result'),
                            content: const Text(
                              'Some error occur',
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                        setState(() {});
                      }
                    },
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/book_now.png',
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: const Center(
                            child: Text(
                              'SIGN IN',
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
                ),
                const SizedBox(height: 25),
                const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontFamily: "Metropolis",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have account?',
                      style: TextStyle(
                        fontFamily: "Metropolis",
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 5),
                    GradientText(
                      'Register now',
                      style: TextStyle(
                        fontFamily: "Metropolis",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
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
                // ellipse_bottom_login.png
                Stack(
                  children: [
                    Container(
                      color: const Color(0xFF252525),
                      height: 128,
                    ),
                    Positioned(
                      top: -115,
                      left: -120,
                      child: Image.asset(
                        'assets/images/ellipse_bottom_login.png',
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

  Future<bool> signUP() async {
    try {
      await http.post(
        Uri.parse("http://65.1.216.213:9091/login/loginSecond"),
        body: jsonEncode(
          {
            "username": userNameFieldController.text,
            "password": passwordFieldController.text,
          },
        ),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return true;
    } catch (e) {
      return false;
    }
  }
}
