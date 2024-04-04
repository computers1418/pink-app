import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/gradient_text_widget.dart';
import '../../../constents/commen_styles.dart';
import '../../../constents/commen_widgets.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool approve=true;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark
          .copyWith(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: const Color(0xffF3EDF4),


        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 75 + 40,
                    width: 75 + 40,
                    padding: const EdgeInsets.all(35),
                    decoration: CommonWidgets.imageDecoration(
                        "lib/module_name/pages/privacy_policy_terms_conditions/assets/Rectangle 1167.png"),
                    child: SvgPicture.asset(
                      "lib/module_name/pages/privacy_policy_terms_conditions/assets/Paper Clip.svg",
                      height: 57,
                      width: 57,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      "Terms &\nConditions",
                      style: CommonStyle.metropolis32W900(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientText(
                      "1 - Lorem Ipsum",
                      style: CommonStyle.metropolis20W900(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.",style: CommonStyle.metropolis13W400(color: const Color(0xff252525))),
                    const SizedBox(
                      height: 20,
                    ),
                    GradientText(
                      "2 - Lorem Ipsum",
                      style: CommonStyle.metropolis20W900(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.",style: CommonStyle.metropolis13W400(color: const Color(0xff252525)),),
                    const SizedBox(
                      height: 20,
                    ),
                    GradientText(
                      "3 - Lorem Ipsum",
                      style: CommonStyle.metropolis20W900(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.",style: CommonStyle.metropolis13W400(color: const Color(0xff252525)))
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 25),
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: (){
                    setState(() {
                      approve=!approve;
                    });
                  },
                  child: Row(
                    children: [
                      SizedBox(

                        height: 25,width: 25,

                        child: Image.asset(approve?"lib/module_name/pages/privacy_policy_terms_conditions/assets/Group 1 (3).png":"lib/module_name/pages/privacy_policy_terms_conditions/assets/Ellipse 181 (2).png"),),
                      Flexible(child: Text.rich(TextSpan(children: [
                        TextSpan(text: "I agree with ",style: CommonStyle.metropolis12W600(color: const Color(0xff252525))),
                        TextSpan(text: "Terms & Conditions",style: CommonStyle.metropolis12W800(color: const Color(0xff252525))),
                      ])))

                    ],
                  ),
                ),
              ),

              Stack(
                children: [
                  Container(
                    height: 45+40+5,
                    width: 179+20,
                    alignment: Alignment.center,
                    decoration: CommonWidgets.imageDecoration("lib/module_name/pages/privacy_policy_terms_conditions/assets/Rectangle 1174.png"),
                    child: Text("Decline",style: CommonStyle.metropolis20W900(),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25,left: 179+20,right: 20),
                    child: Container(
                      height: 45+10+5,
                      width: 179-20,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(bottom: 20),

                      decoration: CommonWidgets.imageDecoration("lib/module_name/pages/privacy_policy_terms_conditions/assets/Group 1 (7).png"),
                      child: Text("Accept",style: CommonStyle.metropolis20W900(color: Colors.white),),

                    ),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
