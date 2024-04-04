import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../profile/pages/profile/profile_screen.dart';

class PreviousAppointmentsListScreen extends StatelessWidget {
  PreviousAppointmentsListScreen({super.key});

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
                SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.06
                  ),
                  child: Text("Previous",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.06
                  ),
                  child: Text("Appointments",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: MediaQuery.of(context).size.height * 0.045,
                    ),
                  ),
                ),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                for(int i=0; i<3;i++)
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.03),
                        child: Image.asset("lib/appointments/pages/previous_apointments_list/assets/Frame 134.png"),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.005,
                                    left: MediaQuery.of(context).size.width * 0.05
                                ),
                                child: GestureDetector(
                                  onTap: () => Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (context) => ProfileScreen())
                                  ),
                                  child: Image.asset("lib/appointments/pages/previous_apointments_list/assets/Frame 125.png",
                                    height: MediaQuery.of(context).size.height * 0.16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.04,
                                    left: MediaQuery.of(context).size.width * 0.365
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Dr. Johnathan Gray",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: MediaQuery.of(context).size.height * 0.022,
                                      ),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                                    Text("Dental Braces",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: MediaQuery.of(context).size.height * 0.0165,
                                      ),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                                    Text("07 July, 09:00 am",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: MediaQuery.of(context).size.height * 0.0165,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.15,
                                    left: MediaQuery.of(context).size.width * 0.1,
                                  right: MediaQuery.of(context).size.width * 0.06,
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.36,
                                          top: MediaQuery.of(context).size.height * 0.0175),
                                      child: Image.asset("lib/appointments/pages/previous_apointments_list/assets/Ellipse 208.png",
                                        height: MediaQuery.of(context).size.height * 0.055,
                                        width: MediaQuery.of(context).size.width * 0.55,
                                      ),
                                    ),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Completed',
                                          style: TextStyle(
                                            foreground: Paint()..shader = linearGradient,
                                            fontWeight: FontWeight.w700,
                                            fontSize: MediaQuery.of(context).size.height * 0.022,
                                          ),),
                                        Container(
                                          height: MediaQuery.of(context).size.height * 0.05,
                                          width: MediaQuery.of(context).size.width * 0.5,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "lib/appointments/pages/previous_apointments_list/assets/Rectangle 823.png",
                                              )
                                            )
                                          ),
                                          child: Center(
                                            child: Text('Paid - Rs. 1000',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: MediaQuery.of(context).size.height * 0.018,
                                              ),),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0375,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget displayRedCardTextWidget(context, text1, text2, obscureText){
    return Padding(
      padding: const EdgeInsets.only(
        //bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Stack(
        children: [
          Stack(
            children: [
              Image.asset("lib/profile/pages/edit_profile/assets/Rectangle 840.png"),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.0275,
                    right: MediaQuery.of(context).size.width * 0.1,
                    left: MediaQuery.of(context).size.width * 0.1),
                child: TextField(
                  controller: TextEditingController(text: text2),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                      fontWeight: FontWeight.w700
                  ),
                  obscureText: obscureText,
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.065,),
            child: Text(text1,
                style: TextStyle(
                  // color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                )
            ),
          ),
        ],
      ),
    );
  }
}
