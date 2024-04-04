import 'package:flutter/material.dart';
import 'package:flutter_application_1/constents/commen_styles.dart';
import 'package:flutter_application_1/constents/commen_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OptionWidget extends StatefulWidget {
  const OptionWidget({super.key});

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  final _pageController = PageController();
  late int progress = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String assets = "lib/doctor/assets/";

    return Container(
      color: const Color(0xFFECC0D9),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Other',
                      style: TextStyle(fontFamily: "Metropolis",
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Options',
                      style: TextStyle(fontFamily: "Metropolis",
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   width: 55,
                //   child: StepProgressIndicator(
                //     totalSteps: 4,
                //     currentStep: progress,
                //     size: 5,
                //     padding: 0.01,
                //     roundedEdges: const Radius.circular(10),
                //     selectedGradientColor: const LinearGradient(
                //       begin: Alignment.topLeft,
                //       end: Alignment.bottomRight,
                //       colors: [
                //         Color(0xFFAD37E0),
                //         Color(0xFFEE2B3B),
                //       ],
                //     ),
                //     unselectedColor: Colors.white,
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 224,
            child: ListView.builder(
              itemCount: 4,
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 224,
                          width: 238,
                          padding: const EdgeInsets.only(
                              left: 13, right: 13, top: 12, bottom: 50),
                          decoration: CommonWidgets.imageDecoration(
                              "${assets}Frame 118 (1).png"),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)),
                            child: Image.asset(
                              assets +
                                  (index == 0
                                      ? "african-american-doctor-talking-about-medicines-with-mature-woman-during-home-visit.png"
                                      : "close-up-patient-talking-doctor-online.png"),
                              fit: BoxFit.fill,
                              height: 200,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          child: Container(
                            height: 64 + 10,
                            width: 208,
                            decoration: CommonWidgets.imageDecoration(
                                "${assets}Rectangle 817.png"),
                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                SvgPicture.asset(assets+(index == 0
                                    ?"bx_home-smile.svg":"tabler_video.svg")),
                                const SizedBox(width: 10,),
                                Text(index == 0
                                    ?
                                  "Call Home":"Video Call",
                                  style: CommonStyle.metropolis24W900(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20),

        ],
      ),
    );
  }
}
