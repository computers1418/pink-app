import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/gradient_text_widget.dart';
import '../../../constents/commen_styles.dart';
import '../../../constents/commen_widgets.dart';
import '../app_bar/app_bar.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark
          .copyWith(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: const Color(0xffF3EDF4),
        body: CustomAppBar(
          backgroundColor: const Color(0xffF3EDF4),
          sliderColor: const Color(0xffF3EDF4),
          shadow: 0.15,
          lightMode: true,
          child: Container(
            color: const Color(0xffF3EDF4),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: GradientText(
                        "Bharati Foundation",
                        style: CommonStyle.metropolis28W900(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: Image.asset(
                                "lib/module_name/pages/donation_screen/assets/portrait-humanitarian-volunteer 1.png",
                                height: 180,
                                width: 170,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, bottom: 40),
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Etiam eu turpis molestie,\ndictum est a, mattis tellus. Sed dignissim,\nmetus nec fringilla accumsan. Lorem ipsum\ndolor sit amet, consectetur adipiscing elit.\nEtiam eu turpis molestie\nmetus nec fringilla accumsan, risus\nsem sollicitudin lacus, ut interdum\ntellus elit sed risus. Maecenas eget\ncondimentum velit, sit amet feugiat\nlectus.",
                              style: CommonStyle.metropolis13W400(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    alignment: Alignment.center,
                    color: const Color(0xffECC0D9),
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: CommonWidgets.imageDecoration(
                              "lib/module_name/pages/donation_screen/assets/Rectangle 822.png"),
                          height: 74 + 40,
                          width: 179 + 35,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "800+",
                                style: CommonStyle.metropolis16W900(
                                    color: Colors.white),
                              ),
                              Text(
                                "People have been helped",
                                style: CommonStyle.metropolis10W500(
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 179),
                          child: Container(
                            decoration: CommonWidgets.imageDecoration(
                                "lib/module_name/pages/donation_screen/assets/Rectangle 824.png"),
                            height: 74 + 40,
                            width: 179 + 35,
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "24,548,029",
                                  style: CommonStyle.metropolis16W900(),
                                ),
                                Text(
                                  "Funds distributed to people in\nneed",
                                  style: CommonStyle.metropolis10W500(),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Donate To",
                            style: CommonStyle.metropolis16W700(),
                          ),
                          Text(
                            "NGO",
                            style: CommonStyle.metropolis40W900(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 45 + 25,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    alignment: Alignment.center,
                    decoration: CommonWidgets.imageDecoration(
                        "lib/module_name/pages/donation_screen/assets/Rectangle 823 (1).png"),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter name",
                          helperStyle: CommonStyle.metropolis16W600(
                              color: const Color(0xff636363))),
                    ),
                  ),
                  Container(
                    height: 45 + 25,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    alignment: Alignment.center,
                    decoration: CommonWidgets.imageDecoration(
                        "lib/module_name/pages/donation_screen/assets/Rectangle 823 (1).png"),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Email",
                          helperStyle: CommonStyle.metropolis16W600(
                              color: const Color(0xff636363))),
                    ),
                  ),
                  Container(
                    height: 45 + 25,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    alignment: Alignment.center,
                    decoration: CommonWidgets.imageDecoration(
                        "lib/module_name/pages/donation_screen/assets/Rectangle 823 (1).png"),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Phone Number",
                          helperStyle: CommonStyle.metropolis16W600(
                              color: const Color(0xff636363))),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 50 + 45,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    alignment: Alignment.center,
                    decoration: CommonWidgets.imageDecoration(
                        "lib/module_name/pages/donation_screen/assets/Group 1.png"),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 45),
                      child: Text(
                        "DONATE",
                        style: CommonStyle.metropolis20W900(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
