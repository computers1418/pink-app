import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  final type;
  const SuccessScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.125,),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06,
                  ),
                  child: Image.asset("lib/appointments/pages/success_page/assets/Frame 141.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.035,
                    left: MediaQuery.of(context).size.width * 0.12
                  ),
                  child: Text(type == "cancelled" ? 'Appointment\nCancelled' : type == "rescheduled"
                      ? 'Reschedule\nSuccessful' : 'Booking\nConfirmed',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: MediaQuery.of(context).size.height * 0.032,
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.15,
                      left: MediaQuery.of(context).size.width * 0.12
                  ),
                  child: Text("Go to home page\nfor new booking.",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      )
                  ),
                ),
                Positioned(bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.01,
                        left: MediaQuery.of(context).size.width * 0.085
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("lib/appointments/pages/success_page/assets/Rectangle 819.png",
                          )
                        )
                      ),
                      child: Center(
                        child: Text("HOME",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: MediaQuery.of(context).size.height * 0.02,
                            )
                        ),
                      ),
                    )
                  ),
                ),
                Positioned(bottom: 0, right: MediaQuery.of(context).size.width * 0.12,
                  child: Image.asset("lib/appointments/pages/success_page/assets/"
                      "${type == "cancelled" ? 'Group 30' :
                  type == "rescheduled"
                      ? 'Group 31' : 'Group 32'}.png",
                    height: MediaQuery.of(context).size.height * 0.3,
                  )),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
            Stack(
              children: [
                Image.asset("lib/appointments/pages/success_page/assets/Rectangle 266.png",),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.06,
                    left: MediaQuery.of(context).size.width * 0.125,
                    right: MediaQuery.of(context).size.width * 0.125,
                  ),
                  child: Column(
                    children: [
                      displayRedCardTextWidget(context,
                          "Patients name", "Wayne Barnes", false, false),
                      displayRedCardTextWidget(context,
                          "Date & Time", "09 Nov, 11:00 am", false, false),
                      displayRedCardTextWidget(context,
                          "Service", "Dental Clinic", false, false),
                      displayRedCardTextWidget(context,
                          "Address", "Dental Clinic", true, false),
                      displayRedCardTextWidget(context,
                          "", "12/2, Mathura Road, Sector 37, Faridabad - Delhi", true, true)
                    ],
                  ),
                ),
              ],
            ),
            //SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                // width: MediaQuery.of(context).size.width * 0.35,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/appointments/pages/success_page/assets/Rectangle 280.png",
                        )
                    )
                ),
                child: Center(
                  child: Text("DONE",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget displayRedCardTextWidget(context, text1, text2, hasBottomPadding, isSmallText){
    return Padding(
      padding: EdgeInsets.only(
        bottom: hasBottomPadding ? MediaQuery.of(context).size.height * 0.005 :
        MediaQuery.of(context).size.height * 0.015,
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(//width: MediaQuery.of(context).size.width * 0.3,
            child: Text(text1,
                style: TextStyle(
                  // color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.height * 0.016,
                )
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.075,),
          Expanded(
            child: Text(text2,
                textAlign: TextAlign.left,
                style: TextStyle(
                  // color: Colors.white,
                  fontWeight: isSmallText ? FontWeight.w400 : FontWeight.w700,
                  fontSize: isSmallText ? MediaQuery.of(context).size.height * 0.0125 :
                  MediaQuery.of(context).size.height * 0.016,
                )
            ),
          ),
        ],
      ),
    );
  }
}
