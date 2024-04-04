import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/common/gradient_text_widget.dart';

class SetPasswordWidget extends StatelessWidget {
  const SetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light // Set your desired color
        ));
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
                Container(
                  margin: const EdgeInsets.only(
                    left: 25,
                    top: 90,
                    right: 55,
                  ),
                  child: const GradientText(
                    'New Password Set',
                    style: TextStyle(
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
                Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'assets/images/set_password.png',
                          height: 318,
                          width: 278,
                        ),
                      ),
                    ),
                    Positioned(
                      top: -10,
                      right: -70,
                      child: Image.asset(
                        'assets/images/set_password_side.png',
                        height: 143,
                        width: 141,
                      ),
                    ),
                  ],
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
                        margin: const EdgeInsets.only(top: 12),
                        child: const Center(
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
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
                Stack(
                  children: [
                    Container(
                      color: const Color(0xFF252525),
                      height: 128,
                    ),
                    Positioned(
                      bottom: -145,
                      left: -100,
                      child: Image.asset(
                        'assets/images/set_password_bottom.png',
                        height: 388,
                        width: 388,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
