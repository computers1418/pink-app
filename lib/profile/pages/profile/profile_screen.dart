import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../edit_profile/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

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
                // SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                Stack(
                  children: [
                    Image.asset("lib/profile/pages/edit_profile/assets/Rectangle 273.png"),
                    Image.asset("lib/profile/pages/edit_profile/assets/Frame 123.png"),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.03,
                        //horizontal: MediaQuery.of(context).size.width * 0.4,
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Delhi ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: MediaQuery.of(context).size.height * 0.018,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:
                            MediaQuery.of(context).size.height * 0.001
                            ),
                            child: Image.asset("lib/profile/pages/edit_profile/assets/Vector.png",
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
                        top: MediaQuery.of(context).size.height * 0.165,
                        //left: MediaQuery.of(context).size.width * 0.275,
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.165,
                            width: MediaQuery.of(context).size.height * 0.165,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("lib/profile/pages/edit_profile/assets/Frame 125.png")
                                )
                            ),
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hello",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.height * 0.022,
                                  )
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                              Text("Wayne Barnes",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.height * 0.026,
                                  )
                              ),
                            ],
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
                          GestureDetector(
                            onTap: () => Navigator.push(context, 
                              MaterialPageRoute(builder: (context) => EditProfileScreen())
                            ),
                            child: Stack(
                              children: [
                                Image.asset("lib/profile/pages/edit_profile/assets/Ellipse 185.png",
                                  height: MediaQuery.of(context).size.height * 0.045,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.height * 0.0028,
                                      top: MediaQuery.of(context).size.height * 0.0032),
                                  child: Image.asset("lib/profile/pages/edit_profile/assets/Ellipse 183.png",
                                    height: MediaQuery.of(context).size.height * 0.045,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.height * 0.014,
                                      top: MediaQuery.of(context).size.height * 0.0125),
                                  child: SvgPicture.asset("lib/profile/pages/edit_profile/assets/Edit.svg",
                                    height: MediaQuery.of(context).size.height * 0.02,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.04,),
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                displayRedCardTextWidget(context, "Email", "Waynebarnes32@gmail.com", false),
                displayRedCardTextWidget(context, "Phone number", "+91 9087654321", false),
                displayRedCardTextWidget(context, "City", "Delhi", false),
                displayRedCardTextWidget(context, "Country", "India", false),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.065),                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              Image.asset("lib/profile/pages/edit_profile/assets/Ellipse 185.png",
                                height: MediaQuery.of(context).size.height * 0.045,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height * 0.0028,
                                    top: MediaQuery.of(context).size.height * 0.0032),
                                child: Image.asset("lib/profile/pages/edit_profile/assets/Ellipse 183.png",
                                  height: MediaQuery.of(context).size.height * 0.045,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height * 0.014,
                                    top: MediaQuery.of(context).size.height * 0.0125),
                                child: SvgPicture.asset("lib/profile/pages/edit_profile/assets/Power.svg",
                                  height: MediaQuery.of(context).size.height * 0.02,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          Text("Logout",
                              style: TextStyle(
                                // color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: MediaQuery.of(context).size.height * 0.018,
                              )
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.04,),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget displayRedCardTextWidget(context, text1, text2, obscureText){
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.02,
      ),
      child: Stack(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.008,
                    bottom: MediaQuery.of(context).size.height * 0.005
                ),
                child: Image.asset("lib/profile/pages/edit_profile/assets/Rectangle 840.png"),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
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
              left: MediaQuery.of(context).size.width * 0.1,
            ),
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
