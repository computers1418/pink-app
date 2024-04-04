import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/gradient_text_widget.dart';
import '../../../constents/commen_styles.dart';
import '../../../constents/commen_widgets.dart';
import '../app_bar/app_bar.dart';
class InsuranceScreen extends StatefulWidget {
  const InsuranceScreen({super.key});

  @override
  State<InsuranceScreen> createState() => _InsuranceScreenState();
}

class _InsuranceScreenState extends State<InsuranceScreen> {
  bool approve=true;
  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
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
                        child: GradientText("HDFC Life Insurance Company Ltd.",
                          style: CommonStyle.metropolis28W900(),

                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(23),
                          margin: const EdgeInsets.only(bottom: 92),
                          decoration: CommonWidgets.imageDecoration("lib/module_name/pages/insurance_screen/assets/Frame 127.png"),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(40.0),

                              child: Image.asset("lib/module_name/pages/insurance_screen/assets/Pexels Photo by Migs Reyes.png",height: 236,width: double.infinity,fit: BoxFit.fill,)),
                        ),
                        Positioned(
                          bottom: 0,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              children: [

                                Container(
                                  height: 77+40,
                                  width: 100+40,
                                  padding: const EdgeInsets.all(42),
                                  decoration: CommonWidgets.imageDecoration("lib/module_name/pages/insurance_screen/assets/Rectangle 275.png"),
                                  child: Image.asset("lib/module_name/pages/insurance_screen/assets/HDFC_Life_Logo 1.png",height: 43,width: 66,),

                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 130,right: 25,top: 35),
                                  child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan.",style: CommonStyle.metropolis13W400(),),
                                )
                              ],
                            ),
                          ),
                        )

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sedrisus. Maecenas eget condimentum velit, sit amet feugiat lectus.",style: CommonStyle.metropolis13W400(),),
                    ),
                    const SizedBox(height: 35,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(alignment: Alignment.centerLeft,
                          child: Container(height: 53+30,
                            width: 189+20,
                            decoration: CommonWidgets.imageDecoration("lib/module_name/pages/insurance_screen/assets/Group 1 (1).png"),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:const EdgeInsets.only(left: 16),
                                  decoration: CommonWidgets.imageDecoration("lib/module_name/pages/insurance_screen/assets/Ellipse 205.png"),
                                  height: 43,
                                  width: 43+10,
                                  padding: const EdgeInsets.only(right:10),

                                  child: SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: SvgPicture.asset("lib/module_name/pages/insurance_screen/assets/Vector (14).svg",fit: BoxFit.scaleDown,)),

                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Text("BUY NOW",style: CommonStyle.metropolis20W900(color: Colors.white),))
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              children: [
                                GradientText("40K",style: CommonStyle.metropolis32W900(),),
                                const SizedBox(width: 10,),

                                Stack(
                                  children: [
                                    Image.asset("lib/module_name/pages/insurance_screen/assets/Ellipse (3).png",height: 25,width: 25,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 13),
                                      child: Image.asset("lib/module_name/pages/insurance_screen/assets/Ellipse (1).png",height: 25,width: 25,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 26),
                                      child: Image.asset("lib/module_name/pages/insurance_screen/assets/Ellipse (2).png",height: 25,width: 25,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 39),
                                      child: Image.asset("lib/module_name/pages/insurance_screen/assets/Ellipse.png",height: 25,width: 25,),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Text("Insured Peoples",style: CommonStyle.metropolis13W700(),)
                          ],
                        )
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      color: const Color(0xffECC0D9),
                      child: Column(
                        children: [
                          const SizedBox(height: 20,),
                          Align(

                              alignment: Alignment.centerLeft,

                              child: Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Know The",style: CommonStyle.metropolis16W700(),),
                                    Text("Advantages",style: CommonStyle.metropolis40W900(),),
                                  ],
                                ),
                              ),),
                          Stack(
                            children: [
                              Container(
                                height: 74+40,
                                decoration: CommonWidgets.imageDecoration("lib/module_name/pages/insurance_screen/assets/Rectangle 821.png"),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 35,),
                                    Container(
                                      height: 45,
                                      width: 45,
                                      padding: const EdgeInsets.all(12),

                                      decoration: BoxDecoration(
                                          color: Colors.white,

                                          borderRadius: BorderRadius.circular(30)
                                      ),
                                        child: SvgPicture.asset("lib/module_name/pages/insurance_screen/assets/Union.svg")),
                                    const SizedBox(width: 15,),

                                    Text("Risk Management",style: CommonStyle.metropolis20W900(color: Colors.white),)
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 90),

                                height: 74+40,
                                decoration: CommonWidgets.imageDecoration("lib/module_name/pages/insurance_screen/assets/Rectangle 822 (1).png"),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 35,),
                                    Container(
                                        height: 45,
                                        width: 45,
                                        padding: const EdgeInsets.all(12),

                                        decoration: BoxDecoration(

                                            borderRadius: BorderRadius.circular(30)
                                        ),
                                        child: SvgPicture.asset("lib/module_name/pages/insurance_screen/assets/Vector (15).svg")),
                                    const SizedBox(width: 15,),

                                    Text("Freedom Of Choice",style: CommonStyle.metropolis20W900(),)
                                  ],
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(height: 50,),

                    Align(

                      alignment: Alignment.centerLeft,

                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Buy",style: CommonStyle.metropolis16W700(),),
                            Text("Insurance",style: CommonStyle.metropolis40W900(),),
                          ],
                        ),
                      ),),
                    const SizedBox(height: 10,),

                    Container(
                      height: 45+25,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      alignment: Alignment.center,
                      decoration: CommonWidgets.imageDecoration("lib/module_name/pages/insurance_screen/assets/Rectangle 823 (1).png"),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter name",
                            helperStyle: CommonStyle.metropolis16W600(color: const Color(0xff636363))
                        ),
                      ),
                    ),
                    Container(
                      height: 45+25,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      alignment: Alignment.center,
                      decoration: CommonWidgets.imageDecoration("lib/module_name/pages/insurance_screen/assets/Rectangle 823 (1).png"),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Email",
                            helperStyle: CommonStyle.metropolis16W600(color: const Color(0xff636363))
                        ),
                      ),
                    ),
                    Container(
                      height: 45+25,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      alignment: Alignment.center,
                      decoration: CommonWidgets.imageDecoration("lib/module_name/pages/insurance_screen/assets/Rectangle 823 (1).png"),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Phone Number",
                            helperStyle: CommonStyle.metropolis16W600(color: const Color(0xff636363))
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),

                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 25),
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

                                child: Image.asset(approve?"lib/module_name/pages/insurance_screen/assets/Group 1 (3).png":"lib/module_name/pages/insurance_screen/assets/Ellipse 181 (2).png"),),
                            Flexible(child: Text("I approve to cantact me via email and phone number to discuss insurance",style: CommonStyle.metropolis12W600(),))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),

                    Container(
                      height: 50+45,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      alignment: Alignment.center,
                      decoration: CommonWidgets.imageDecoration("lib/module_name/pages/insurance_screen/assets/Group 1.png"),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 45),
                        child: Text("BUY INSURANCE",style: CommonStyle.metropolis20W900(color: Colors.white),),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
