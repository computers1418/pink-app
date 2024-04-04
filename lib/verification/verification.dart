import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/back_popup/back_popup.dart';
import 'package:flutter_application_1/common/gradient_text_widget.dart';
import 'package:flutter_application_1/login/login.dart';
import 'package:flutter_svg/svg.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:http/http.dart' as http;

import '../constents/commen_styles.dart';
import '../constents/commen_widgets.dart';

class VerificationWidget extends StatefulWidget {
  final String email;
  final String number;
  final String userID;

  const VerificationWidget({
    super.key,
    required this.email,
    required this.number,
    required this.userID,
  });

  @override
  State<VerificationWidget> createState() => _VerificationWidgetState();
}

class _VerificationWidgetState extends State<VerificationWidget> {
  late int _progressValue;
  late int timer;
  late bool verifiedOrNot;

  List<FocusNode> focusNods = [];
  List<TextEditingController> controllers = [];
  bool otpError = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light // Set your desired color
        ));
    verifiedOrNot = true;
    focusNods = List.generate(4, (index) => FocusNode());
    controllers = List.generate(4, (index) => TextEditingController());
    _progressValue = 0;
    timer = 30;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _updateProgress();
    });
  }

  void _updateProgress() {
    // _progressValue = _progressValue + 1;
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        if (timer != 0) {
          timer = timer - 1;
          _progressValue = _progressValue + 1;
        } else {
          t.cancel();
        }
      });
    });
  }

  setFocus() {
    if (controllers[3].text.isNotEmpty) {
      focusNods[3].requestFocus();
    } else if (controllers[3].text.isNotEmpty) {
      focusNods[2].requestFocus();
    } else if (controllers[3].text.isNotEmpty) {
      focusNods[1].requestFocus();
    } else {
      focusNods[0].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    String assets = "lib/verification/assets/";

    //_updateProgress();
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();

          return true;
        },
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xFF252525),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      color: const Color(0xFF252525),
                      height: 210,
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
                                                "Verification is not finished.\nYou will loose your data if you\nleave now. Verification is\ncomplete when to enter correct\nOTP and hit",
                                            style: CommonStyle.metropolis16W700(
                                                color: Colors.white)),
                                        WidgetSpan(
                                            child: GradientText(
                                          " VERIFY",
                                          style: CommonStyle.metropolis16W700(),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color(0xFFAD37E0),
                                              Color(0xFFEE2B3B),
                                            ],
                                          ),
                                        ))
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
                const SizedBox(height: 15),
                Container(
                  width: 288,
                  margin: const EdgeInsets.only(left: 25),
                  child: const GradientText(
                    'Verification Code',
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      fontSize: 38,
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
                  child: Text(
                    'Enter the 4 digit code sent to ${widget.email} and +91 ${widget.number}',
                    style: const TextStyle(
                      fontFamily: "Metropolis",
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Container(
                  width: double.infinity,
                  height: 65 + 40,
                  decoration: CommonWidgets.imageDecoration(
                    'assets/images/verification_enter_field.png',
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Positioned(
                          left: 33,
                          child: SizedBox(
                            width: 55,
                            height: 69,
                            child: TextField(
                              onTap: () => setFocus(),
                              readOnly: controllers[1].text.isNotEmpty,
                              cursorColor: Colors.white,
                              maxLength: 1,
                              autofocus: true,
                              onChanged: (value) {
                                onFieldChange(value, 0);
                              },
                              textAlign: TextAlign.center,
                              focusNode: focusNods[0],
                              controller: controllers[0],
                              decoration: const InputDecoration(
                                  border: InputBorder.none, counterText: ""),
                              style: TextStyle(
                                fontFamily: "Metropolis",
                                color: !otpError
                                    ? Colors.white
                                    : const Color(0xffFF0000),
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 123,
                          child: SizedBox(
                            width: 55,
                            height: 69,
                            child: TextField(
                              onTap: () => setFocus(),
                              readOnly: controllers[2].text.isNotEmpty,
                              cursorColor: Colors.white,
                              maxLength: 1,
                              autofocus: true,
                              focusNode: focusNods[1],
                              controller: controllers[1],
                              onChanged: (value) {
                                onFieldChange(value, 1);
                              },
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  border: InputBorder.none, counterText: ""),
                              style: TextStyle(
                                fontFamily: "Metropolis",
                                color: !otpError
                                    ? Colors.white
                                    : const Color(0xffFF0000),
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 215,
                          child: SizedBox(
                            width: 55,
                            height: 69,
                            child: TextField(
                              onTap: () => setFocus(),
                              readOnly: controllers[3].text.isNotEmpty,
                              cursorColor: Colors.white,
                              maxLength: 1,
                              autofocus: true,
                              onChanged: (value) {
                                onFieldChange(value, 2);
                              },
                              focusNode: focusNods[2],
                              controller: controllers[2],
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  border: InputBorder.none, counterText: ""),
                              style: TextStyle(
                                fontFamily: "Metropolis",
                                color: !otpError
                                    ? Colors.white
                                    : const Color(0xffFF0000),
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 305,
                          child: SizedBox(
                            width: 55,
                            height: 69,
                            child: TextField(
                              onTap: () => setFocus(),
                              cursorColor: Colors.white,
                              autofocus: true,
                              maxLength: 1,
                              focusNode: focusNods[3],
                              controller: controllers[3],
                              onChanged: (value) {
                                onFieldChange(value, 3);
                              },
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  border: InputBorder.none, counterText: ""),
                              style: TextStyle(
                                fontFamily: "Metropolis",
                                color: !otpError
                                    ? Colors.white
                                    : const Color(0xffFF0000),
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Container(
                //   margin: const EdgeInsets.symmetric(horizontal: 0),
                //   child: Stack(
                //     alignment: Alignment.center,
                //     children: [
                //       Image.asset(
                //         'assets/images/verification_enter_field.png',
                //         width: 376,
                //         height: 90,
                //         fit: BoxFit.fill,
                //       ),
                //       Positioned(
                //         left: 38,
                //         top: 10,
                //         child: Row(
                //           children: [
                //             Container(
                //               margin: const EdgeInsets.only(top: 20),
                //               width: 40,
                //               height: 30,
                //               child: Center(
                //                 child: TextFormField(
                //                   controller: firstFieldController,
                //                   decoration: const InputDecoration(
                //
                //                     border: InputBorder.none,
                //                     counterText: '',
                //                   ),
                //
                //                   ///  focusNode: repeatPasswordFocus,
                //                   onChanged: (String? value) {
                //
                //                     setState(() {
                //
                //                     });
                //                   },
                //                   maxLength: 1,
                //                   onTap: () {
                //                     setState(() {
                //                       //  enterRepeatPassword = true;
                //                     });
                //                   },
                //                   textAlign: TextAlign.center,
                //                   style: TextStyle(fontFamily: "Metropolis,
                //                     color: verifiedOrNot
                //                         ? Colors.white
                //                         : const Color(0xFFFF0000),
                //                     fontSize: 20,
                //                     fontWeight: FontWeight.w800,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             Container(
                //               margin: const EdgeInsets.only(
                //                 top: 20,
                //                 left: 45,
                //               ),
                //               width: 40,
                //               height: 30,
                //               child: Center(
                //                 child: TextFormField(
                //                   controller: secondFieldController,
                //                   decoration: const InputDecoration(
                //                       // hintText: 'Repeat Password',
                //                       // hintStyle: TextStyle(fontFamily: "Metropolis,
                //                       //   color: Colors.white.withOpacity(0.5),
                //                       //   fontSize: 16,
                //                       //   fontWeight: FontWeight.w800,
                //                       // ),
                //                       border: InputBorder.none,
                //                       counterText: ''),
                //
                //                   ///  focusNode: repeatPasswordFocus,
                //                   onChanged: (String? value) {
                //                     // This optional block of code can be used to run
                //                     // code when the user saves the form.
                //                     setState(() {
                //                       // if (value != null && value.isNotEmpty) {
                //                       //   repeatPasswordFieldEmpty = false;
                //                       // } else {
                //                       //   repeatPasswordFieldEmpty = true;
                //                       // }
                //                     });
                //                   },
                //                   maxLength: 1,
                //                   onTap: () {
                //                     setState(() {
                //                       //  enterRepeatPassword = true;
                //                     });
                //                   },
                //                   textAlign: TextAlign.center,
                //                   style: TextStyle(fontFamily: "Metropolis,
                //                     color: verifiedOrNot
                //                         ? Colors.white
                //                         : const Color(0xFFFF0000),
                //                     fontSize: 20,
                //                     fontWeight: FontWeight.w800,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             Container(
                //               margin: const EdgeInsets.only(
                //                 top: 20,
                //                 left: 50,
                //               ),
                //               width: 40,
                //               height: 30,
                //               child: Center(
                //                 child: TextFormField(
                //                   controller: threeFieldController,
                //                   decoration: const InputDecoration(
                //                       // hintText: 'Repeat Password',
                //                       // hintStyle: TextStyle(fontFamily: "Metropolis,
                //                       //   color: Colors.white.withOpacity(0.5),
                //                       //   fontSize: 16,
                //                       //   fontWeight: FontWeight.w800,
                //                       // ),
                //                       border: InputBorder.none,
                //                       counterText: ''),
                //
                //                   ///  focusNode: repeatPasswordFocus,
                //                   onChanged: (String? value) {
                //                     // This optional block of code can be used to run
                //                     // code when the user saves the form.
                //                     setState(() {
                //                       // if (value != null && value.isNotEmpty) {
                //                       //   repeatPasswordFieldEmpty = false;
                //                       // } else {
                //                       //   repeatPasswordFieldEmpty = true;
                //                       // }
                //                     });
                //                   },
                //                   maxLength: 1,
                //                   onTap: () {
                //                     setState(() {
                //                       //  enterRepeatPassword = true;
                //                     });
                //                   },
                //                   textAlign: TextAlign.center,
                //                   style: TextStyle(fontFamily: "Metropolis,
                //                     color: verifiedOrNot
                //                         ? Colors.white
                //                         : const Color(0xFFFF0000),
                //                     fontSize: 20,
                //                     fontWeight: FontWeight.w800,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             Container(
                //               margin: const EdgeInsets.only(
                //                 top: 20,
                //                 left: 50,
                //               ),
                //               width: 40,
                //               height: 30,
                //               child: Center(
                //                 child: TextFormField(
                //                   controller: fourFieldController,
                //                   decoration: const InputDecoration(
                //                       // hintText: 'Repeat Password',
                //                       // hintStyle: TextStyle(fontFamily: "Metropolis,
                //                       //   color: Colors.white.withOpacity(0.5),
                //                       //   fontSize: 16,
                //                       //   fontWeight: FontWeight.w800,
                //                       // ),
                //                       border: InputBorder.none,
                //                       counterText: ''),
                //                   maxLength: 1,
                //
                //                   ///  focusNode: repeatPasswordFocus,
                //                   onChanged: (String? value) {
                //                     // This optional block of code can be used to run
                //                     // code when the user saves the form.
                //                     setState(() {
                //                       // if (value != null && value.isNotEmpty) {
                //                       //   repeatPasswordFieldEmpty = false;
                //                       // } else {
                //                       //   repeatPasswordFieldEmpty = true;
                //                       // }
                //                     });
                //                   },
                //
                //                   onTap: () {
                //                     setState(() {
                //                       //  enterRepeatPassword = true;
                //                     });
                //                   },
                //                   textAlign: TextAlign.center,
                //                   style: TextStyle(fontFamily: "Metropolis,
                //                     color: verifiedOrNot
                //                         ? Colors.white
                //                         : const Color(0xFFFF0000),
                //                     fontSize: 20,
                //                     fontWeight: FontWeight.w800,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Visibility(
                  visible: !verifiedOrNot,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 97,
                              height: 18,
                              margin: const EdgeInsets.only(bottom: 14),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF0000).withOpacity(0.2),
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
                                    'Wrong OTP',
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
                ),
                const SizedBox(height: 60),
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 62),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Resend OTP in',
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            timer < 10 ? '00:0$timer' : '00:$timer',
                            style: const TextStyle(
                              fontFamily: "Metropolis",
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      StepProgressIndicator(
                        totalSteps: 30,
                        currentStep: _progressValue,
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
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () async {
                      final verified = await verification();
                      verifiedOrNot = verified;
                      otpError = verified;
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Result'),
                          content: Text(
                            verified ? 'Successful' : 'Some error occur',
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                if (verified) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginWidget(),
                                    ),
                                  );
                                } else {
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                      setState(() {});
                    },
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/book_now.png',
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          child: const Center(
                            child: Text(
                              'VERIFY',
                              style: TextStyle(
                                fontFamily: "Metropolis",
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Didn’t recieve? ',
                      style: TextStyle(
                        fontFamily: "Metropolis",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    timer > 0
                        ? const Text(
                            'Resend Code',
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          )
                        : const GradientText(
                            'Resend Code',
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                  ],
                ),
                const SizedBox(height: 50),
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

  Future<bool> verification() async {
    try {
      String otp = "";
      for (var element in controllers) {
        otp = otp + element.text;
      }
      await http.post(
        Uri.parse("http://65.1.216.213:9091/api/user/signUp"),
        body: jsonEncode(
          {
            "pseudoUserId": widget.userID,
            "otp": otp,
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

  void onFieldChange(String value, int i) {
    setState(() {
      otpError = false;
      if (i == 0) {
        if (value.length == 1) {
          focusNods[1].requestFocus();
        }
        if (value.isEmpty) {}
      }
      if (i == 1) {
        if (value.length == 1) {
          focusNods[2].requestFocus();
        }
        if (value.isEmpty) {
          focusNods[0].requestFocus();
        }
      }
      if (i == 2) {
        if (value.length == 1) {
          focusNods[3].requestFocus();
        }
        if (value.isEmpty) {
          focusNods[1].requestFocus();
        }
      }
      if (i == 3) {
        if (value.length == 1) {}
        if (value.isEmpty) {
          focusNods[2].requestFocus();
        }
      }
    });
  }
}
