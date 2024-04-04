import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/back_popup/back_popup.dart';
import 'package:flutter_application_1/common/gradient_text_widget.dart';
import 'package:flutter_application_1/constents/commen_styles.dart';
import 'package:flutter_application_1/verification/verification.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  /// For first name field
  late TextEditingController firstNameFieldController;
  late bool enterFirstName;
  late FocusNode firstNameFocus;
  late bool firstNameFieldEmpty;

  /// For last name field
  late TextEditingController lastNameFieldController;
  late bool enterLastName;
  late FocusNode lastNameFocus;
  late bool lastNameFieldEmpty;

  /// For email field
  late TextEditingController emailFieldController;
  late bool enterEmail;
  late FocusNode emailFocus;
  late bool emailFieldEmpty;

  /// For number field
  late TextEditingController numberFieldController;
  late bool enterNumber;
  late FocusNode numberFocus;
  late bool numberFieldEmpty;

  /// For Password field
  late TextEditingController passwordFieldController;
  late bool enterPassword;
  late FocusNode passwordFocus;
  late bool passwordFieldEmpty;

  /// For Repeat Password field
  late TextEditingController repeatPasswordFieldController;
  late bool enterRepeatPassword;
  late FocusNode repeatPasswordFocus;
  late bool repeatPasswordFieldEmpty;

  late TextEditingController cityFieldController;
  late bool enterCity;
  late FocusNode cityFocus;
  late bool cityFieldEmpty;

  late TextEditingController countryFieldController;
  late bool enterCountry;
  late FocusNode countryFocus;
  late bool countryFieldEmpty;

  late String userID;

  List countries = [];
  bool showCountryPicker = false;
  List cities = [];

  bool showCityPicker = false;
  bool cityNotFound = true;

  @override
  void initState() {
    super.initState();
    getCountries();
    getCitiesByCountry("india");
    userID = '';

    /// For first name field
    firstNameFieldController = TextEditingController();
    enterFirstName = false;
    firstNameFocus = FocusNode();
    firstNameFieldEmpty = false;

    /// For last name field
    lastNameFieldController = TextEditingController();
    enterLastName = false;
    lastNameFocus = FocusNode();
    lastNameFieldEmpty = false;

    /// For email field
    emailFieldController = TextEditingController();
    enterEmail = false;
    emailFocus = FocusNode();
    emailFieldEmpty = false;

    /// For number field
    numberFieldController = TextEditingController();
    enterNumber = false;
    numberFocus = FocusNode();
    numberFieldEmpty = false;

    /// For password field
    passwordFieldController = TextEditingController();
    enterPassword = false;
    passwordFocus = FocusNode();
    passwordFieldEmpty = false;

    /// For repeat password field
    repeatPasswordFieldController = TextEditingController();
    enterRepeatPassword = false;
    repeatPasswordFocus = FocusNode();
    repeatPasswordFieldEmpty = false;

    ///For City Field
    cityFieldController = TextEditingController();
    enterCity = false;
    cityFocus = FocusNode();
    cityFieldEmpty = false;

    ///For Country Field
    countryFieldController = TextEditingController(text: "India");
    enterCountry = false;
    countryFocus = FocusNode();
    countryFieldEmpty = false;
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light // Set your desired color
        ));
  }

  getCountries() async {
    var request = http.Request(
        'GET', Uri.parse('https://restcountries.com/v3.1/all?fields=name'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      List resp = jsonDecode(await response.stream.bytesToString());
      setState(() {
        countries = resp;
        countries
            .sort((a, b) => a['name']['common'].compareTo(b['name']['common']));
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  getCitiesByCountry(country) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://api.geonames.org/searchJSON?q=$country&featureClass=P&type=json&username=pankajvaishnav'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      List resp = jsonDecode(await response.stream.bytesToString())['geonames'];
      setState(() {
        cities = resp;
        cities.sort((a, b) => a['name'].compareTo(b['name']));
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    String assets = "lib/signup/assets/";
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
                        splashColor: Colors.transparent,
                        onTap: () {
                          backAlertDialog(
                              context,
                              Text.rich(
                                  textAlign: TextAlign.center,
                                  TextSpan(children: [
                                    TextSpan(
                                        text:
                                            "This form is not finished.\nYou will loose your data if you\nleave now. This form is only\ncomplete when you hit\n",
                                        style: CommonStyle.metropolis16W700(
                                            color: Colors.white)),
                                    WidgetSpan(
                                        child: GradientText(
                                      "SIGN UP.",
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
                Stack(
                  children: [
                    Container(
                      color: const Color(0xFF252525),
                      height: 170,
                    ),
                    Positioned(
                      top: 30,
                      left: 25,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 280,
                                child: GradientText(
                                  'Create Account To Continue',
                                  style: TextStyle(
                                    fontFamily: "Metropolis",
                                    fontSize: 36,
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
                          Image.asset(
                            'assets/images/sign_up.png',
                            height: 133,
                            width: 133,
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      bottom: 0,
                      left: 26,
                      child: Text(
                        'Create account with',
                        style: TextStyle(
                          fontFamily: "Metropolis",
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    )
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
                // const Text(
                //   'Or',
                //   style: TextStyle(fontFamily: "Metropolis",
                //     fontSize: 20,
                //     fontWeight: FontWeight.w600,
                //     color: Colors.white,
                //   ),
                // ),
                const SizedBox(height: 42),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Image.asset(
                        firstNameFocus.hasFocus
                            ? 'assets/images/name_sign_up.png'
                            : 'assets/images/password_login.png',
                      ),
                    ),
                    Visibility(
                      visible: firstNameFocus.hasFocus,
                      child: Positioned(
                        left: 50,
                        top: -5,
                        child: Container(
                          color: const Color(0xFF252525),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            'First Name',
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 55,
                        right: 55,
                        top: 0,
                      ),
                      child: TextFormField(
                        controller: firstNameFieldController,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(
                            fontFamily: "Metropolis",
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          border: InputBorder.none,
                        ),
                        focusNode: firstNameFocus,
                        onChanged: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                          setState(() {
                            if (value != null && value.isNotEmpty) {
                              firstNameFieldEmpty = false;
                            } else {
                              firstNameFieldEmpty = true;
                            }
                          });
                        },
                        onTap: () {
                          setState(() {
                            enterFirstName = true;
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
                Visibility(
                  visible: firstNameFieldEmpty,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 102,
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
                                'Invalid First Name',
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
                SizedBox(height: !firstNameFieldEmpty ? 25 : 0),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Image.asset(
                        lastNameFocus.hasFocus
                            ? 'assets/images/name_sign_up.png'
                            : 'assets/images/password_login.png',
                      ),
                    ),
                    Visibility(
                      visible: lastNameFocus.hasFocus,
                      child: Positioned(
                        left: 60,
                        top: -5,
                        child: Container(
                          color: const Color(0xFF252525),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            'Last Name',
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 55,
                        right: 55,
                        top: 0,
                      ),
                      child: TextFormField(
                        controller: lastNameFieldController,
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                          hintStyle: TextStyle(
                            fontFamily: "Metropolis",
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          border: InputBorder.none,
                        ),
                        focusNode: lastNameFocus,
                        onChanged: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                          setState(() {
                            if (value != null && value.isNotEmpty) {
                              lastNameFieldEmpty = false;
                            } else {
                              lastNameFieldEmpty = true;
                            }
                          });
                        },
                        onTap: () {
                          setState(() {
                            enterLastName = true;
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
                Visibility(
                  visible: lastNameFieldEmpty,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 102,
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
                                'Invalid Last Name',
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
                SizedBox(height: !lastNameFieldEmpty ? 25 : 0),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Image.asset(
                        emailFocus.hasFocus
                            ? 'assets/images/name_sign_up.png'
                            : 'assets/images/password_login.png',
                      ),
                    ),
                    Visibility(
                      visible: emailFocus.hasFocus,
                      child: Positioned(
                        left: 60,
                        top: -5,
                        child: Container(
                          color: const Color(0xFF252525),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            'Email',
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 55,
                        right: 55,
                        top: 0,
                      ),
                      child: TextFormField(
                        controller: emailFieldController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            fontFamily: "Metropolis",
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          border: InputBorder.none,
                        ),
                        focusNode: emailFocus,
                        onChanged: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                          setState(() {
                            if (value != null && value.isNotEmpty) {
                              emailFieldEmpty = false;
                            } else {
                              emailFieldEmpty = true;
                            }
                          });
                        },
                        onTap: () {
                          setState(() {
                            enterEmail = true;
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
                const SizedBox(height: 8),
                Visibility(
                  visible: emailFieldEmpty,
                  child: Padding(
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
                                'Invalid Email ID',
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
                SizedBox(height: !emailFieldEmpty ? 25 : 0),

                Container(
                  height: 60,
                  margin: const EdgeInsets.only(left: 0, right: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            color: const Color(0xFF252525),
                            height: 105,
                            width: 80,
                          ),
                          Positioned(
                            top: -25,
                            left: 5,
                            child: Image.asset(
                              'assets/images/country_code.png',
                              width: 79 + 30,
                              height: 60 + 40,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Positioned(
                            top: 18,
                            left: 38,
                            child: Row(
                              children: [
                                Text(
                                  '+91',
                                  style: TextStyle(
                                    fontFamily: "Metropolis",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.expand_more,
                                  color: Colors.white,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      SizedBox(
                        //width: 250,
                        height: 60,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(
                              numberFocus.hasFocus
                                  ? 'assets/images/name_sign_up.png'
                                  : 'assets/images/password_login.png',
                              height: 50,
                              width: 262,
                              fit: BoxFit.fill,
                            ),
                            Visibility(
                              visible: numberFocus.hasFocus,
                              child: Positioned(
                                top: -5,
                                left: 20,
                                child: Container(
                                  color: const Color(0xFF252525),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: const Text(
                                    'Number',
                                    style: TextStyle(
                                      fontFamily: "Metropolis",
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 20,
                              right: 55,
                              child: TextFormField(
                                controller: numberFieldController,
                                decoration: InputDecoration(
                                  hintText: 'Number',
                                  hintStyle: TextStyle(
                                    fontFamily: "Metropolis",
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  border: InputBorder.none,
                                  counter:
                                      numberFocus.hasFocus && !numberFieldEmpty
                                          ? GradientText(
                                              "${numberFieldController.text.length}/10",
                                              style: const TextStyle(
                                                fontFamily: "Metropolis",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              gradient: const LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Color(0xFFAD37E0),
                                                  Color(0xFFEE2B3B),
                                                ],
                                              ),
                                            )
                                          : Text(
                                              "${numberFieldController.text.length}/10",
                                              style: const TextStyle(
                                                fontFamily: "Metropolis",
                                                color: Color(0xff2E2E2E),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                ),
                                focusNode: numberFocus,
                                maxLength: 10,
                                onChanged: (String? value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                  setState(() {
                                    if (value != null && value.isNotEmpty) {
                                      numberFieldEmpty = false;
                                    } else {
                                      numberFieldEmpty = true;
                                    }
                                  });
                                },
                                onTap: () {
                                  setState(() {
                                    enterNumber = true;
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
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: numberFieldEmpty,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 119,
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
                                '10 Digit required',
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
                SizedBox(height: !numberFieldEmpty ? 25 : 0),

                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Image.asset(
                        countryFocus.hasFocus
                            ? 'assets/images/name_sign_up.png'
                            : 'assets/images/password_login.png',
                      ),
                    ),
                    Visibility(
                      visible: countryFocus.hasFocus,
                      child: Positioned(
                        left: 60,
                        top: -5,
                        child: Container(
                          color: const Color(0xFF252525),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            'Country',
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 55,
                        right: 35,
                        top: 0,
                      ),
                      child: TextFormField(
                        controller: countryFieldController,
                        decoration: InputDecoration(
                            hintText: 'Country',
                            hintStyle: TextStyle(
                              fontFamily: "Metropolis",
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () => setState(() {
                                showCountryPicker = !showCountryPicker;
                                if (!showCountryPicker) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                } else {
                                  showCityPicker = false;
                                }
                              }),
                              icon: Icon(
                                showCountryPicker
                                    ? Icons.keyboard_arrow_up_rounded
                                    : Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                              ),
                            )),
                        focusNode: countryFocus,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                          setState(() {
                            if (value != null && value.isNotEmpty) {
                              countryFieldEmpty = false;
                            } else {
                              countryFieldEmpty = true;
                            }
                          });
                        },
                        onTap: () {
                          setState(() {
                            enterCountry = true;
                            showCountryPicker = true;
                            showCityPicker = false;
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
                if (showCountryPicker)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, bottom: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: HexColor("#202020")),
                      child: SizedBox(
                        height: 200,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shrinkWrap: true,
                          itemCount: countries.length,
                          itemBuilder: (context, index) {
                            return !countries[index]['name']['common']
                                    .toString()
                                    .toLowerCase()
                                    .contains(countryFieldController.text
                                        .toLowerCase())
                                ? const SizedBox.shrink()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      selectedCountry.toLowerCase() ==
                                              countries[index]['name']['common']
                                                  .toString()
                                                  .toLowerCase()
                                          ? GradientText(
                                              countries[index]['name']
                                                  ['common'],
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800),
                                            )
                                          : SizedBox(
                                              width: double.infinity,
                                              child: GestureDetector(
                                                onTap: () async {
                                                  setState(() {
                                                    countryFieldEmpty = false;
                                                    selectedCountry =
                                                        countries[index]['name']
                                                            ['common'];
                                                    countryFieldController
                                                        .text = selectedCountry;

                                                    cities = [];
                                                    selectedCity = '';
                                                    cityFieldController.text =
                                                        "";
                                                    getCitiesByCountry(
                                                        selectedCountry);
                                                  });

                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 1000));

                                                  setState(() {
                                                    showCountryPicker = false;
                                                  });
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Text(
                                                  countries[index]['name']
                                                      ['common'],
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white
                                                          .withOpacity(.5)),
                                                ),
                                              ),
                                            ),
                                      Divider(
                                        color: HexColor("#2A2A2A"),
                                      )
                                    ],
                                  );
                          },
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 8),
                Visibility(
                  visible: countryFieldEmpty,
                  child: Padding(
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
                                'Invalid Country',
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
                SizedBox(height: !countryFieldEmpty ? 25 : 0),

                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Image.asset(
                        cityFocus.hasFocus
                            ? 'assets/images/name_sign_up.png'
                            : 'assets/images/password_login.png',
                      ),
                    ),
                    Visibility(
                      visible: cityFocus.hasFocus,
                      child: Positioned(
                        left: 60,
                        top: -5,
                        child: Container(
                          color: const Color(0xFF252525),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            'City',
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 55,
                        right: 35,
                        top: 0,
                      ),
                      child: TextFormField(
                        controller: cityFieldController,
                        decoration: InputDecoration(
                            hintText: 'City',
                            hintStyle: TextStyle(
                              fontFamily: "Metropolis",
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () => setState(() {
                                showCityPicker = !showCityPicker;
                                if (!showCityPicker) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                } else {
                                  showCountryPicker = false;
                                }
                              }),
                              icon: Icon(
                                showCityPicker
                                    ? Icons.keyboard_arrow_up_rounded
                                    : Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                              ),
                            )),
                        focusNode: cityFocus,
                        onChanged: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                          setState(() {
                            if (value != null && value.isNotEmpty) {
                              cityFieldEmpty = false;
                            } else {
                              cityFieldEmpty = true;
                            }
                            bool flag = true;
                            for (final city in cities) {
                              if (city['name']
                                  .toString()
                                  .toLowerCase()
                                  .contains(value!.toLowerCase())) {
                                flag = false;
                              }
                            }
                            cityNotFound = flag;
                          });
                        },
                        onTap: () {
                          setState(() {
                            enterCity = true;
                            showCountryPicker = false;
                            showCityPicker = true;
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
                if (showCityPicker)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, bottom: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: HexColor("#202020")),
                      child: SizedBox(
                        height: 200,
                        child: cityNotFound &&
                                cityFieldController.text.isNotEmpty
                            ? Center(
                                child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: "City not found !\n",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Colors.white.withOpacity(.5)),
                                      ),
                                      TextSpan(
                                        text:
                                            "You can type manually to save your city name",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Colors.white.withOpacity(.5)),
                                      ),
                                      // TextSpan(text: '\'${cityFieldController.text}\'',
                                      // style:  TextStyle(
                                      //   fontSize: 18,
                                      //   fontWeight: FontWeight.w700,
                                      //   color: Colors.white.withOpacity(.5)
                                      // ),),
                                      // TextSpan(text: " for you",
                                      // style:  TextStyle(
                                      //   fontSize: 16,
                                      //   fontWeight: FontWeight.w500,
                                      //   color: Colors.white.withOpacity(.5)
                                      // ),),
                                    ])),
                              )
                            : ListView.builder(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shrinkWrap: true,
                                itemCount: cities.length,
                                itemBuilder: (context, index) {
                                  return !cities[index]['name']
                                          .toString()
                                          .toLowerCase()
                                          .contains(cityFieldController.text
                                              .toLowerCase())
                                      ? const SizedBox.shrink()
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            selectedCity.toLowerCase() ==
                                                    cities[index]['name']
                                                        .toString()
                                                        .toLowerCase()
                                                ? GradientText(
                                                    cities[index]['name'],
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  )
                                                : SizedBox(
                                                    width: double.infinity,
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        setState(() {
                                                          cityFieldEmpty =
                                                              false;
                                                          cityNotFound = false;
                                                          selectedCity =
                                                              cities[index]
                                                                  ['name'];
                                                          cityFieldController
                                                                  .text =
                                                              selectedCity;
                                                        });

                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    1000));

                                                        setState(() {
                                                          showCityPicker =
                                                              false;
                                                        });
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Text(
                                                        cities[index]['name'],
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    .5)),
                                                      ),
                                                    ),
                                                  ),
                                            Divider(
                                              color: HexColor("#2A2A2A"),
                                            )
                                          ],
                                        );
                                },
                              ),
                      ),
                    ),
                  ),

                const SizedBox(height: 8),
                Visibility(
                  visible: cityFieldEmpty,
                  child: Padding(
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
                                'Invalid City',
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
                SizedBox(height: !cityFieldEmpty ? 25 : 0),

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
                      visible: enterPassword,
                      child: Positioned(
                        left: 60,
                        top: -5,
                        child: Container(
                          color: const Color(0xFF252525),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            'Password',
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 55,
                        right: 55,
                        top: 0,
                      ),
                      child: TextFormField(
                        controller: passwordFieldController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontFamily: "Metropolis",
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
                const SizedBox(height: 8),
                Visibility(
                  visible: //passwordFieldController.text.isNotEmpty &&
                      !RegExp(r'(?=.*[a-z])(?=.*[A-Z])')
                          .hasMatch(passwordFieldController.text),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 275,
                          height: 24,
                          margin: const EdgeInsets.only(bottom: 14),
                          // decoration: BoxDecoration(
                          //   color: Colors.grey[600],
                          //   borderRadius: const BorderRadius.all(
                          //     Radius.circular(20),
                          //   ),
                          // ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF0000).withOpacity(0.2),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Icon(
                              //   Icons.check_circle,
                              //   color: Colors.white,
                              //   size: 10,
                              // ),
                              SvgPicture.asset(
                                "${assets}Warning.svg",
                                height: 10,
                                width: 10,
                              ),
                              const Text(
                                'Must contain upper and lower case characters',
                                style: TextStyle(
                                  fontFamily: "Metropolis",
                                  // color: Colors.white,
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
                Visibility(
                  visible: //passwordFieldController.text.isNotEmpty &&
                      !RegExp(r'^(?=.*?[A-Z] || .*?[a-z])(?=.*?[!@#\$&*~])')
                          .hasMatch(passwordFieldController.text),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 253,
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
                                'Must contain at least one symbol & character',
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
                Visibility(
                  visible: //passwordFieldEmpty &&
                      passwordFieldController.text.length < 8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 201,
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
                                'Must be at least 8 characters long',
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
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Image.asset(
                        repeatPasswordFocus.hasFocus
                            ? 'assets/images/name_sign_up.png'
                            : 'assets/images/password_login.png',
                      ),
                    ),
                    Visibility(
                      visible: enterRepeatPassword,
                      child: Positioned(
                        left: 60,
                        top: -5,
                        child: Container(
                          color: const Color(0xFF252525),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            'Repeat Password',
                            style: TextStyle(
                              fontFamily: "Metropolis",
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 55,
                        right: 55,
                        top: 0,
                      ),
                      child: TextFormField(
                        controller: repeatPasswordFieldController,
                        decoration: InputDecoration(
                          hintText: 'Repeat Password',
                          hintStyle: TextStyle(
                            fontFamily: "Metropolis",
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          border: InputBorder.none,
                        ),
                        focusNode: repeatPasswordFocus,
                        onChanged: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                          setState(() {
                            if (value != null && value.isNotEmpty) {
                              repeatPasswordFieldEmpty = false;
                            } else {
                              repeatPasswordFieldEmpty = true;
                            }
                          });
                        },
                        onTap: () {
                          setState(() {
                            enterRepeatPassword = true;
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
                const SizedBox(height: 8),
                Visibility(
                  visible: false,
                  // visible: repeatPasswordFocus.hasFocus &&
                  //     (passwordFieldController.text !=
                  //         repeatPasswordFieldController.text),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 275,
                          height: 24,
                          margin: const EdgeInsets.only(bottom: 14),
                          // decoration: BoxDecoration(
                          //   color: Colors.grey[600],
                          //   borderRadius: const BorderRadius.all(
                          //     Radius.circular(20),
                          //   ),
                          // ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF0000).withOpacity(0.2),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Icon(
                              //   Icons.check_circle,
                              //   color: Colors.white,
                              //   size: 10,
                              // ),
                              SvgPicture.asset(
                                "${assets}Warning.svg",
                                height: 10,
                                width: 10,
                              ),
                              const Text(
                                'Password does not match !',
                                style: TextStyle(
                                  fontFamily: "Metropolis",
                                  // color: Colors.white,
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
                      visible: repeatPasswordFocus.hasFocus &&
                          (passwordFieldController.text !=
                              repeatPasswordFieldController.text),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 45),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 116,
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
                                        'Does not match',
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
                const SizedBox(height: 31),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () async {
                      if (firstNameFieldController.text.isEmpty) {
                        setState(() {
                          firstNameFieldEmpty = true;
                        });
                      } else if (lastNameFieldController.text.isEmpty) {
                        setState(() {
                          lastNameFieldEmpty = true;
                        });
                      } else if (emailFieldController.text.isEmpty) {
                        setState(() {
                          emailFieldEmpty = true;
                        });
                      } else if (numberFieldController.text.isEmpty) {
                        setState(() {
                          numberFieldEmpty = true;
                        });
                      } else if (passwordFieldController.text.isEmpty) {
                        setState(() {
                          passwordFieldEmpty = true;
                        });
                      } else if (repeatPasswordFieldController.text.isEmpty ||
                          repeatPasswordFieldController.text !=
                              passwordFieldController.text) {
                        setState(() {
                          repeatPasswordFieldEmpty = true;
                        });
                      } else {
                        /// call api for register
                        final registered = await signUP(
                          firstName: firstNameFieldController.text,
                          lastName: lastNameFieldController.text,
                          email: emailFieldController.text,
                          contact: numberFieldController.text,
                          password: passwordFieldController.text,
                        );
                        if (registered && mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerificationWidget(
                                email: emailFieldController.text,
                                number: numberFieldController.text,
                                userID: userID,
                              ),
                            ),
                          );
                        } else {
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
                        }
                        setState(() {});
                      }
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
                              'Sign up',
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
                const SizedBox(height: 31),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a user?',
                      style: TextStyle(
                        fontFamily: "Metropolis",
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 5),
                    GradientText(
                      'Sign In',
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
                Stack(
                  children: [
                    Container(
                      color: const Color(0xFF252525),
                      height: 128,
                    ),
                    Positioned(
                      top: -100,
                      left: 0,
                      child: Image.asset(
                        'assets/images/sign_up_bottom_border.png',
                        height: 388,
                        width: 180,
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

  Future<bool> signUP({
    required String contact,
    required String email,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("http://65.1.216.213:9091/api/user/signUp"),
        body: jsonEncode(
          {
            "email": email,
            "contact": contact,
            "firstName": firstName,
            "lastname": lastName,
            "password": password,
            "country": "India",
            "city": "Bangalore",
          },
        ),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      final data = jsonDecode(response.body);
      userID = data['data'];
      return true;
    } catch (e) {
      return false;
    }
  }
}
