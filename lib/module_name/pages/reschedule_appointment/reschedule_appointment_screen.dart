
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constents/commen_styles.dart';
import '../../../constents/commen_widgets.dart';


class RescheduleAppointment extends StatelessWidget {
  const RescheduleAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark
          .copyWith(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: const Color(0xffF3EDF4),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),

              Stack(
                children: [

                  Container(
                    height: 115 + 40,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              "lib/module_name/pages/reschedule_appointment/assets/Frame 134.png",
                            ))),
                    child: Row(
                      children: [
                        Container(
                          height: 75 + 20,
                          width: 75 + 20,
                          margin:  const EdgeInsets.only(left: 30),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                  AssetImage("lib/module_name/pages/reschedule_appointment/assets/Frame 125.png"))),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),

                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),

                                  child: Image.asset("lib/module_name/pages/reschedule_appointment/assets/portrait-smiling-handsome-man-eyeglasses (1) 1.png",)),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dr. Johnathan Gray",
                              style: CommonStyle.metropolis20W900(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Dental Specialist",
                              style: CommonStyle.metropolis16W700(),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      "Appointment Rescheduling",
                      style: CommonStyle.metropolis16W700(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Container(
                height: 166,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          "lib/module_name/pages/reschedule_appointment/assets/Frame 135.png",
                        ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Patients name",
                          style:
                          CommonStyle.metropolis16W500(color: Colors.white),
                        ),
                        Text(
                          "Date & Time",
                          style:
                          CommonStyle.metropolis16W500(color: Colors.white),
                        ),
                        Text(
                          "Service",
                          style:
                          CommonStyle.metropolis16W500(color: Colors.white),
                        ),
                        Text(
                          "Consultation",
                          style:
                          CommonStyle.metropolis16W500(color: Colors.white),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Wayne Barnes",
                          style:
                          CommonStyle.metropolis16W900(color: Colors.white),
                        ),
                        Text(
                          "09 Nov, 11:00 am",
                          style:
                          CommonStyle.metropolis16W900(color: Colors.white),
                        ),
                        Text(
                          "Dental Braces",
                          style:
                          CommonStyle.metropolis16W900(color: Colors.white),
                        ),
                        Text(
                          "Clinic Consultation",
                          style:
                          CommonStyle.metropolis16W900(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "Reason For Rescheduling?",
                  style: CommonStyle.metropolis16W900(),
                ),
              ),

              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Stack(
                  children: [
                    Image.asset(
                      "lib/module_name/pages/reschedule_appointment/assets/button_group_bac.png",height: 144,width: 600,fit: BoxFit.cover,),

                    Positioned(
                        top: 34,
                        left: 53,
                        child: Text("Not sure why",style: CommonStyle.metropolis15W700(),)),
                    Positioned(
                        top: 36,
                        left: 202,
                        child: Text("Booked by mistake",style: CommonStyle.metropolis15W700(),)),
                    Positioned(
                        top: 36,
                        left: 388,
                        child: Text("Visiting Different doctor",style: CommonStyle.metropolis15W700(),)),
                    Positioned(
                        top: 90,
                        left: 48,
                        child: Text("Too Coastly",style: CommonStyle.metropolis15W700(),)),
                    Positioned(
                        top: 90,
                        left: 190,
                        child: Text("Problem solved",style: CommonStyle.metropolis15W700(),)),
                    Positioned(
                        top: 93,
                        left: 358,
                        child: Text("Busy on date",style: CommonStyle.metropolis15W700(),)),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "Reschedule",
                  style: CommonStyle.metropolis16W900(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 123+40,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: CommonWidgets.imageDecoration("lib/module_name/pages/reschedule_appointment/assets/Group 1 (5).png"),
              ),

              Container(
                height: 50+45,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 40),
                alignment: Alignment.center,
                decoration: CommonWidgets.imageDecoration("lib/module_name/pages/reschedule_appointment/assets/Group 1.png"),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 45),
                  child: Text("RESCHEDULE",style: CommonStyle.metropolis20W900(color: Colors.white),),
                ),
              ),

              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
