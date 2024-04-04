import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/gradient_text_widget.dart';
import '../../../constents/commen_styles.dart';
import '../../../constents/commen_widgets.dart';
import '../app_bar/app_bar.dart';

class ProblemDescription extends StatelessWidget {
  const ProblemDescription({super.key});

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
                  children: [
                    const SizedBox(height: 15,),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 292+50,
                          decoration: CommonWidgets.imageDecoration("lib/module_name/pages/problem_description/assets/Frame 133.png"),
                          child: Column(
                            children: [
                              const SizedBox(height: 30,),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 25),
                                height: 201+40,
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 20),
                                decoration: CommonWidgets.imageDecoration("lib/module_name/pages/problem_description/assets/Frame 125 (1).png"),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage("lib/module_name/pages/problem_description/assets/female-patient-with-braces-has-dental-examination-dentist-office-woman-wearing-white-clothes (1) 1.png")
                                    )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            bottom: 45,

                            child: GradientText("Dental Braces",style: CommonStyle.metropolis24W900(),))

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.",style: CommonStyle.metropolis13W400(color: const Color(0xff252525)),),
                    ),
                    const SizedBox(height: 40,),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Happy Clients",style: CommonStyle.metropolis16W700(color: const Color(0xff252525)),),
                            Text("Gallery",style: CommonStyle.metropolis40W900(color: const Color(0xff252525)),),
                          ],
                        ),
                      ),
                    ),

                    Stack(
                      children: [
                        Container(
                          width: 179+30,
                          height: 98+40,
                          padding: const EdgeInsets.all(26),

                          decoration: CommonWidgets.imageDecoration("lib/module_name/pages/problem_description/assets/Frame 125 (2).png"),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("lib/module_name/pages/problem_description/assets/unsplash_fmB7IdFjhTM.png")
                                )
                            ),
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 179),
                          child: Container(
                            width: 179+40,

                            height: 98+40,
                            decoration: CommonWidgets.imageDecoration("lib/module_name/pages/problem_description/assets/Frame 125 (2).png"),
                            padding: const EdgeInsets.all(26),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage("lib/module_name/pages/problem_description/assets/Pexels Photo by Alexander Grey.png")
                                  )
                              ),
                            ),

                          ),

                        ),
                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
