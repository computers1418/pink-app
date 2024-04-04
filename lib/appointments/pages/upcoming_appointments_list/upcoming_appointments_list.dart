import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../profile/pages/profile/profile_screen.dart';
import '../upcoming_appointment_details/upcoming_appointment_details.dart';

class UpcomingAppointmentsListScreen extends StatelessWidget {
  UpcomingAppointmentsListScreen({super.key});

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
          MediaQuery.of(context).size.width * 0.05
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
                        top: MediaQuery.of(context).size.height * 0.038,
                        left: MediaQuery.of(context).size.width * 0.05,
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.02
                  ),
                  child: Text("Upcoming",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02
                  ),
                  child: Text("Appointments",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: MediaQuery.of(context).size.height * 0.045,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Stack(
                  children: [
                    Image.asset("lib/appointments/pages/upcoming_appointments_list/assets/upcoming-card.png"),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:
                          MediaQuery.of(context).size.width * 0.06
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfileScreen())
                                ),
                                child: Image.asset("lib/appointments/pages/upcoming_appointments_list/assets/img.png",
                                  width: MediaQuery.of(context).size.width * 0.18,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: MediaQuery.of(context).size.width * 0.05
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Dr. Johnathan Gray',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: MediaQuery.of(context).size.height * 0.022,
                                        ),
                                      ),
                                      SizedBox(height: MediaQuery.of(context).size.height * 0.008,),
                                      Text(
                                        'Dental Braces',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: MediaQuery.of(context).size.height * 0.018,
                                        ),
                                      )
                                    ],
                                  )
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.025,
                                right: MediaQuery.of(context).size.width * 0.005,
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: MediaQuery.of(context).size.width * 0.08
                                ),
                                width: MediaQuery.of(context).size.width * 0.71,
                                height: MediaQuery.of(context).size.height * 0.07,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: AssetImage("lib/appointments/pages/upcoming_appointments_list/assets/date-time.png")
                                    )
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset("lib/appointments/pages/upcoming_appointments_list/assets/date.svg",),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                                    Text('09 Nov, 22',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: MediaQuery.of(context).size.height * 0.018,
                                      ),),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                                    SvgPicture.asset("lib/appointments/pages/upcoming_appointments_list/assets/time.svg",),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                    Text('11:00 am',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: MediaQuery.of(context).size.height * 0.018,
                                      ),),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.01
                              ),
                              child: GestureDetector(
                                onTap: () => Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) => UpcomingAppointmentDetailsScreen())
                                ),
                                child: Container(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context).size.height * 0.01,
                                      right: MediaQuery.of(context).size.width * 0.015
                                  ),
                                  width: MediaQuery.of(context).size.width * 0.14,
                                  height: MediaQuery.of(context).size.height * 0.07,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fitWidth,
                                          image: AssetImage("lib/appointments/pages/upcoming_appointments_list/assets/arrow.png")
                                      )
                                  ),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset("lib/appointments/pages/upcoming_appointments_list/assets/arrow-icon.svg",
                                        height: MediaQuery.of(context).size.height * 0.02,
                                        //width: MediaQuery.of(context).size.width * 0.1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          padding: EdgeInsets.symmetric(horizontal:
                          MediaQuery.of(context).size.width * 0.06
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Dental Clinic',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: MediaQuery.of(context).size.height * 0.021,
                                ),),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                              Text('12/2, Mathura Road, Sector 37, Faridabad - Delhi',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: MediaQuery.of(context).size.height * 0.012,
                                ),),
                            ],
                          ),
                        ),
                        //SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:
                          MediaQuery.of(context).size.width * 0.015
                          ),
                          child: Row(mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.32,
                                height: MediaQuery.of(context).size.height * 0.08,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: AssetImage("lib/appointments/pages/upcoming_appointments_list/assets/cancel.png")
                                    )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: MediaQuery.of(context).size.width * 0.03,
                                          bottom: MediaQuery.of(context).size.height * 0.01
                                      ),
                                      child: Text('Cancel',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: MediaQuery.of(context).size.height * 0.014,
                                        ),),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.34,
                                height: MediaQuery.of(context).size.height * 0.08,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: AssetImage("lib/appointments/pages/upcoming_appointments_list/assets/reschedule.png")
                                    )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: MediaQuery.of(context).size.width * 0.03,
                                          bottom: MediaQuery.of(context).size.height * 0.01
                                      ),
                                      child: Text('Reschedule',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: MediaQuery.of(context).size.height * 0.014,
                                        ),),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:
                  MediaQuery.of(context).size.width * 0.02
                  ),
                  child: Text("Next",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                for(int i = 0; i < 2; i++)
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02,
                      right: MediaQuery.of(context).size.width * 0.02,
                      bottom: MediaQuery.of(context).size.height * 0.0225,),
                    child: Stack(
                      children: [
                        Image.asset("lib/appointments/pages/upcoming_appointments_list/assets/container.png",
                          height: MediaQuery.of(context).size.height * 0.25,
                        ),
                        Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height * 0.0225,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal:
                              MediaQuery.of(context).size.width * 0.045
                              ),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => Navigator.push(context,
                                        MaterialPageRoute(
                                            builder: (context) => ProfileScreen())
                                    ),
                                    child: Image.asset("lib/appointments/pages/upcoming_appointments_list/assets/img.png",
                                      width: MediaQuery.of(context).size.width * 0.18,
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context).size.width * 0.05
                                      ),
                                      child: Column(
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
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal:
                              MediaQuery.of(context).size.width * 0.0375
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset("lib/appointments/pages/upcoming_appointments_list/assets/date.svg",
                                    height: MediaQuery.of(context).size.height * 0.024,
                                    color: Colors.red,),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                  Text('09 Nov, 10:00 am',
                                    style: TextStyle(
                                      foreground: Paint()..shader = linearGradient,
                                      fontWeight: FontWeight.w900,
                                      fontSize: MediaQuery.of(context).size.height * 0.015,
                                    ),),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.025,),
                                  SvgPicture.asset("lib/appointments/pages/upcoming_appointments_list/assets/location.svg",
                                    height: MediaQuery.of(context).size.height * 0.024,
                                    color: Colors.red,),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                  Text('Faridabad',
                                    style: TextStyle(
                                      foreground: Paint()..shader = linearGradient,
                                      fontWeight: FontWeight.w900,
                                      fontSize: MediaQuery.of(context).size.height * 0.015,
                                    ),),
                                ],
                              ),
                            ),
                            Stack(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                                    Container(
                                      padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context).size.height * 0.01,),
                                      width: MediaQuery.of(context).size.width * 0.44,
                                      height:  MediaQuery.of(context).size.height * 0.1,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "lib/appointments/pages/upcoming_appointments_list/assets/reschedule-lt.png"
                                              )
                                          )
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Cancel  ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w800,
                                              fontSize: MediaQuery.of(context).size.height * 0.015,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(right: - MediaQuery.of(context).size.width * 0.01,
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context).size.height * 0.01,
                                        ),
                                        width: MediaQuery.of(context).size.width * 0.44,
                                        height:  MediaQuery.of(context).size.height * 0.1,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.fitWidth,
                                                image: AssetImage(
                                                    "lib/appointments/pages/upcoming_appointments_list/assets/reschedule-lt.png"
                                                )
                                            )
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('Reschedule ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800,
                                                fontSize: MediaQuery.of(context).size.height * 0.015,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.008,),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Positioned(right: - MediaQuery.of(context).size.width * 0.055,
                          top: MediaQuery.of(context).size.height * 0.0875,
                          // child: Image.asset("lib/appointments/pages/upcoming_appointments/assets/view.png",
                          //   width: MediaQuery.of(context).size.width * 0.38,
                          //   // height: MediaQuery.of(context).size.height * 0.05,
                          // ),
                          child: GestureDetector(
                            onTap: () => Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => UpcomingAppointmentDetailsScreen())
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.39,
                              height:  MediaQuery.of(context).size.height * 0.095,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "lib/appointments/pages/upcoming_appointments_list/assets/view.png"
                                      )
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: MediaQuery.of(context).size.height * 0.002),
                                    child: Text('VIEW',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: MediaQuery.of(context).size.height * 0.012,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.015,),
                                  SvgPicture.asset("lib/appointments/pages/upcoming_appointments_list/assets/arrow-icon.svg",
                                    height: MediaQuery.of(context).size.height * 0.011,
                                    //width: MediaQuery.of(context).size.width * 0.1,
                                  ),
                                ],
                              ),
                            ),
                          ),
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
}
