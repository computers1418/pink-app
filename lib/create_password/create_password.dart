import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/common/gradient_text_widget.dart';
import 'package:flutter_svg/svg.dart';

import '../back_popup/back_popup.dart';
import '../constents/commen_styles.dart';

class CreatePasswordWidget extends StatefulWidget {
  const CreatePasswordWidget({super.key});

  @override
  State<CreatePasswordWidget> createState() => _CreatePasswordWidgetState();
}

class _CreatePasswordWidgetState extends State<CreatePasswordWidget> {
  FocusNode newPasswordFocusNode = FocusNode();
  FocusNode repeatPasswordFocusNode = FocusNode();

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
    String assets = "lib/create_password/assets/";

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      color: const Color(0xFF252525),
                      height: 210,
                    ),
                    Positioned(
                      child: Image.asset(
                        'assets/images/forget_password.png',
                        height: 175,
                        fit: BoxFit.fill,
                        width: 230,
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
                                    ])),
                              );
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
                const SizedBox(height: 10),
                Container(
                  width: 288,
                  margin: const EdgeInsets.only(left: 25),
                  child: const GradientText(
                    'Create New Password',
                    style: TextStyle(
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
                    'New password must be different from previous password.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 64),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Image.asset(
                        newPasswordFocusNode.hasFocus
                            ? 'assets/images/name_sign_up.png'
                            : 'assets/images/password_login.png',
                      ),
                    ),
                    Visibility(
                      visible: newPasswordFocusNode.hasFocus,
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
                        left: 45,
                        right: 45,
                        top: 4,
                      ),
                      child: TextFormField(
                        focusNode: newPasswordFocusNode,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'New Password',
                          hintStyle: TextStyle(
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
                        width: 275,
                        height: 24,
                        margin: const EdgeInsets.only(bottom: 9),
                        decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.white,
                              size: 10,
                            ),
                            Text(
                              'Must contain upper and lower case characters',
                              style: TextStyle(
                                color: Colors.white,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 253,
                        height: 18,
                        margin: const EdgeInsets.only(bottom: 9),
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
                              'Must contail at least one symbol & character',
                              style: TextStyle(
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
                Padding(
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
                const SizedBox(height: 0),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Image.asset(
                        repeatPasswordFocusNode.hasFocus
                            ? 'assets/images/name_sign_up.png'
                            : 'assets/images/password_login.png',
                      ),
                    ),
                    Visibility(
                      visible: repeatPasswordFocusNode.hasFocus,
                      child: Positioned(
                        left: 50,
                        top: -5,
                        child: Container(
                          color: const Color(0xFF252525),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            'Re-enter',
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
                        left: 45,
                        right: 45,
                        top: 4,
                      ),
                      child: TextFormField(
                        obscureText: true,
                        focusNode: repeatPasswordFocusNode,
                        decoration: InputDecoration(
                          hintText: 'Repeat New Password',
                          hintStyle: TextStyle(
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
                        width: 116,
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
                              'Does not match',
                              style: TextStyle(
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
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/book_now.png',
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        child: const Center(
                          child: Text(
                            'CONFIRM',
                            style: TextStyle(
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
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/images/forget_password_bottom.png',
                    height: 90,
                    fit: BoxFit.fill,
                    width: 300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
