import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PreviousAppointmentDetailsScreen extends StatelessWidget {
  PreviousAppointmentDetailsScreen({super.key});

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[ Color(0xff8921aa), Color(0xffDA44bb),
      Color(0xff8921aa),Color(0xffDA44bb),
      Color(0xff8921aa),Color(0xffDA44bb),],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("F3EDF4"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:
          MediaQuery.of(context).size.width * 0.0
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    //Image.asset("lib/profile/pages/edit_profile/assets/Rectangle 273.png"),
                    Image.asset("lib/appointments/pages/previous_apointments_list/assets/Frame 123.png"),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.03,
                        //horizontal: MediaQuery.of(context).size.width * 0.4,
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Delhi ",
                            style: TextStyle(
                              // color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: MediaQuery.of(context).size.height * 0.018,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:
                            MediaQuery.of(context).size.height * 0.001
                            ),
                            child: SvgPicture.asset("lib/appointments/pages/previous_apointments_list/assets/Vector.svg",
                              height: MediaQuery.of(context).size.height * 0.007,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03,
                        // left: MediaQuery.of(context).size.width * 0.21,
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("lib/profile/pages/edit_profile/assets/Rectangle 836.png",
                            width: MediaQuery.of(context).size.width * 0.575,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.065,
                        // left: MediaQuery.of(context).size.width * 0.21,
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.068,
                                width: MediaQuery.of(context).size.height * 0.068,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("lib/profile/pages/edit_profile/assets/Ellipse 180.png")
                                    )
                                ),
                              ),
                              Container(
                                //height: MediaQuery.of(context).size.height * 0.025,
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.013,
                                  left: MediaQuery.of(context).size.width * 0.032,
                                ),
                                child: SvgPicture.asset("lib/profile/pages/edit_profile/assets/Hospital Location.svg",
                                  height: MediaQuery.of(context).size.height * 0.025,
                                  width: MediaQuery.of(context).size.height * 0.025,
                                  color: Colors.red,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.013,
                                  left: MediaQuery.of(context).size.width * 0.12,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('50',
                                      style: TextStyle(
                                        foreground: Paint()..shader = linearGradient,
                                        fontWeight: FontWeight.w900,
                                        fontSize: MediaQuery.of(context).size.height * 0.015,
                                      ),),
                                    Text('Cities',
                                      style: TextStyle(
                                        // foreground: Paint()..shader = linearGradient,
                                        fontWeight: FontWeight.w900,
                                        fontSize: MediaQuery.of(context).size.height * 0.015,
                                      ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   width: MediaQuery.of(context).size.width * 0.09,
                          // ),
                          Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.068,
                                width: MediaQuery.of(context).size.height * 0.068,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("lib/profile/pages/edit_profile/assets/Ellipse 180.png")
                                    )
                                ),
                              ),
                              Container(
                                //height: MediaQuery.of(context).size.height * 0.025,
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.013,
                                  left: MediaQuery.of(context).size.width * 0.032,
                                ),
                                child: SvgPicture.asset("lib/profile/pages/edit_profile/assets/doctor.svg",
                                  height: MediaQuery.of(context).size.height * 0.025,
                                  width: MediaQuery.of(context).size.height * 0.025,
                                  color: Colors.red,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.013,
                                  left: MediaQuery.of(context).size.width * 0.12,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('50',
                                      style: TextStyle(
                                        foreground: Paint()..shader = linearGradient,
                                        fontWeight: FontWeight.w900,
                                        fontSize: MediaQuery.of(context).size.height * 0.015,
                                      ),),
                                    Text('Clinics',
                                      style: TextStyle(
                                        //foreground: Paint()..shader = linearGradient,
                                        fontWeight: FontWeight.w900,
                                        fontSize: MediaQuery.of(context).size.height * 0.015,
                                      ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.04,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.0435,
                        left: MediaQuery.of(context).size.width * 0.055,
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.035,
                          width: MediaQuery.of(context).size.height * 0.035,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
                Stack(
                  children: [
                    Image.asset("lib/appointments/pages/previous_appointment_details/assets/Frame 134.png"),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:
                      MediaQuery.of(context).size.height * 0.035,
                        horizontal: MediaQuery.of(context).size.width * 0.065
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Image.asset("lib/appointments/pages/previous_appointment_details/assets/Frame 125.png",
                              height: MediaQuery.of(context).size.height * 0.12,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Dr. Johnathan Gray',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: MediaQuery.of(context).size.height * 0.022,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.008,),
                              Text(
                                'Dental Braces',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: MediaQuery.of(context).size.height * 0.018,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                //SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                Padding(
                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.06,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.height * 0.06,
                            height: MediaQuery.of(context).size.height * 0.06,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "lib/appointments/pages/previous_appointment_details/assets/Ellipse 178.png"
                                    )
                                )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.height * 0.0035,
                                top: MediaQuery.of(context).size.height * 0.0035
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.height * 0.06,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "lib/appointments/pages/previous_appointment_details/assets/Ellipse 176.png"
                                      )
                                  )
                              ),
                              child: Container(),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.017,
                            left: MediaQuery.of(context).size.height * 0.017,
                            child: SvgPicture.asset("lib/appointments/pages/previous_appointment_details/assets/Whatsapp.svg",
                              height: MediaQuery.of(context).size.height * 0.024,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.height * 0.06,
                            height: MediaQuery.of(context).size.height * 0.06,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "lib/appointments/pages/previous_appointment_details/assets/Ellipse 178.png"
                                    )
                                )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.height * 0.0035,
                                top: MediaQuery.of(context).size.height * 0.0035
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.height * 0.06,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "lib/appointments/pages/previous_appointment_details/assets/Ellipse 176.png"
                                      )
                                  )
                              ),
                              child: Container(),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.017,
                            left: MediaQuery.of(context).size.height * 0.017,
                            child: SvgPicture.asset("lib/appointments/pages/previous_appointment_details/assets/Call.svg",
                              height: MediaQuery.of(context).size.height * 0.024,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: Stack(
                    children: [
                      Image.asset("lib/appointments/pages/previous_appointment_details/assets/Frame 135.png"),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.025,
                          horizontal: MediaQuery.of(context).size.width * 0.05,
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
                                "Consultation", "Clinic Consultation", false, false),
                            displayRedCardTextWidget(context,
                                "Address", "Dental Clinic", true, false),
                            displayRedCardTextWidget(context,
                                "", "12/2, Mathura Road, Sector 37, Faridabad - Delhi", true, true)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                Container(
                  color: HexColor("ECC0D9"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:
                        MediaQuery.of(context).size.width * 0.07
                        ),
                        child: Text("Invoice",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.height * 0.018,
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width * 0.01,
                            ),
                            child: Image.asset("lib/appointments/pages/previous_appointment_details/assets/Rectangle 837.png"),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical:
                            MediaQuery.of(context).size.height * 0.065,
                              horizontal: MediaQuery.of(context).size.width * 0.12,
                            ),
                            child: Column(
                              children: [
                                displayInvoiceTextWidget(context, "Consultation Fee", "Rs. 1000", ""),
                                displayInvoiceTextWidget(context, "Service Fee", "Rs. 100", ""),
                                displayInvoiceTextWidget(context, "Technology Fee", "Rs. 100", ""),
                                displayInvoiceTextWidget(context, "Test", "-", ""),
                                displayInvoiceTextWidget(context, "Surgery", "-", ""),
                                displayInvoiceTextWidget(context, "Medicine", "-", ""),
                                displayInvoiceTextWidget(context, "Coupon", "Rs. - 100", "( CONSULT100 )"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.335,),
                            child: Stack(
                              children: [
                                Image.asset("lib/appointments/pages/previous_appointment_details/assets/Rectangle 838.png"),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.1,
                                    right: MediaQuery.of(context).size.width * 0.1,
                                    top: MediaQuery.of(context).size.height * 0.052,),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: MediaQuery.of(context).size.height * 0.027,
                                          )
                                      ),
                                      Text("Rs. 1100",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: MediaQuery.of(context).size.height * 0.036,
                                          )
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08,),
              ],
            ),
          ),
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
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                )
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.06,),
          Expanded(
            child: Text(text2,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: isSmallText ? FontWeight.w400 : FontWeight.w700,
                  fontSize: isSmallText ? MediaQuery.of(context).size.height * 0.015 :
                  MediaQuery.of(context).size.height * 0.018,
                )
            ),
          )
        ],
      ),
    );
  }

  Widget displayInvoiceTextWidget(context, text1, text2, String couponText){
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(text1,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).size.height * 0.017,
                  )
              ),
              if(couponText.isNotEmpty)
                Text(' $couponText',
                  style: TextStyle(
                    foreground: Paint()..shader = linearGradient,
                    fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.height * 0.017,
                  ),),
            ],
          ),
          Text(text2,
            style: TextStyle(
              foreground: Paint()..shader = linearGradient,
              fontWeight: FontWeight.w700,
              fontSize: MediaQuery.of(context).size.height * 0.017,
            ),),
        ],
      ),
    );
  }
}
