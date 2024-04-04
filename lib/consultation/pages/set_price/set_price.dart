import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../settings/settings.dart';

class SetPrice extends StatelessWidget {
  SetPrice({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const Settings(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset("lib/consultation/pages/consultation_page_consultation_details/assets/Rectangle 949.png"),
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03,
                        left: MediaQuery.of(context).size.width * 0.01,
                        right: MediaQuery.of(context).size.width * 0.01
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.23,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("lib/consultation/pages/consultation_page_consultation_details/assets/Rectangle 950.png",
                                  )
                              )
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.0285,),
                            child: SvgPicture.asset("lib/consultation/pages/consultation_page_consultation_details/assets/Layer 2.svg",),
                          ),
                        ),
                        Container(height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.23,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("lib/consultation/pages/consultation_page_consultation_details/assets/Rectangle 950.png",
                                  )
                              )
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.0285,),
                            child: SvgPicture.asset("lib/consultation/pages/consultation_page_consultation_details/assets/Layer 3.svg",),
                          ),
                        ),
                        Container(height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.23,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("lib/consultation/pages/consultation_page_consultation_details/assets/Rectangle 950.png",
                                  )
                              )
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.0285,),
                            child: SvgPicture.asset("lib/consultation/pages/consultation_page_consultation_details/assets/26. Notification.svg",),
                          ),
                        ),
                        Container(height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.23,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("lib/consultation/pages/consultation_page_consultation_details/assets/Rectangle 950.png",
                                  )
                              )
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.0285,),
                            child: SvgPicture.asset("lib/consultation/pages/consultation_page_consultation_details/assets/Group.svg",),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(bottom: 0,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.017,
                          left: MediaQuery.of(context).size.width * 0.06
                      ),
                      child: Text("  Set Consultation Price",
                        style: TextStyle(
                          // foreground: Paint()..shader = linearGradient,
                          fontWeight: FontWeight.w700,
                          fontSize: MediaQuery.of(context).size.height * 0.017,
                        ),),
                    ),
                  ),
                  Positioned(bottom: 0,
                    child: Padding(
                      padding: EdgeInsets.only(//bottom: MediaQuery.of(context).size.height * 0.017,
                          left: MediaQuery.of(context).size.width * 0.06
                      ),
                      child: Image.asset("lib/consultation/pages/consultation_page_consultation_details/assets/Line 64.png",
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.0475,
                      left: MediaQuery.of(context).size.width * 0.055,
                      right: MediaQuery.of(context).size.width * 0.055,
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.0475,
                            width: MediaQuery.of(context).size.height * 0.065,
                            color: Colors.transparent,
                          ),
                        ),
                        GestureDetector(
                          // onTap: () => Navigator.push(context,
                          //   MaterialPageRoute(builder: (context) => SearchPageConsultationDetails())
                          // ),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.0475,
                            width: MediaQuery.of(context).size.height * 0.065,
                            color: Colors.transparent,
                          ),
                        ),
                        GestureDetector(
                          //onTap: () => Navigator.pop(context),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.0475,
                            width: MediaQuery.of(context).size.height * 0.065,
                            color: Colors.transparent,
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>  _scaffoldKey.currentState!.openEndDrawer(),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.0475,
                            width: MediaQuery.of(context).size.height * 0.065,
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(//bottom: MediaQuery.of(context).size.height * 0.017,
                        left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                      bottom: MediaQuery.of(context).size.height * 0.085,
                    ),
                    child: Image.asset("lib/consultation/pages/set_price/assets/Rectangle 975.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(//bottom: MediaQuery.of(context).size.height * 0.017,
                      vertical: MediaQuery.of(context).size.height * 0.055,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text("Enter Consultation\nPrice",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              // foreground: Paint()..shader = linearGradient,
                              fontWeight: FontWeight.w700,
                              fontSize: MediaQuery.of(context).size.height * 0.0235,
                            ),),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.13,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("lib/consultation/pages/set_price/assets/Rectangle 976.png")
                            )
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.35,
                              ),
                              child: TextField(
                                controller: TextEditingController(
                                    //text: "Rs. 00"
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Rs. 00",
                                  hintStyle: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height * 0.045,
                                      fontWeight: FontWeight.w700,
                                      color: HexColor("FAE5CB")
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height * 0.045,
                                    fontWeight: FontWeight.w700,
                                  color: HexColor("FAE5CB")
                                ),
                                obscureText: false,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01,
                            left: MediaQuery.of(context).size.width * 0.12,
                            right: MediaQuery.of(context).size.width * 0.12,
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(//bottom: MediaQuery.of(context).size.height * 0.017,
                                horizontal: MediaQuery.of(context).size.width * 0.02
                            ),
                            height: MediaQuery.of(context).size.height * 0.08,
                            // width: MediaQuery.of(context).size.width * 0.8,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("lib/consultation/pages/set_price/assets/Rectangle 1014.png")
                                )
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(//bottom: MediaQuery.of(context).size.height * 0.017,
                                    horizontal: MediaQuery.of(context).size.width * 0.02
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Example :',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context).size.height * 0.014,
                                        ),
                                      ),
                                      TextSpan(
                                          text: ' Rs. 1000',
                                        style: TextStyle(
                                          color: HexColor("FF8A00"),
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context).size.height * 0.012,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' or Give a range like',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: MediaQuery.of(context).size.height * 0.012,
                                          ),
                                      ),
                                      TextSpan(
                                        text: ' Rs. 1K - 5K',
                                        style: TextStyle(
                                          color: HexColor("FF8A00"),
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context).size.height * 0.012,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' or Type in words like',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context).size.height * 0.012,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' Price after consultation.',
                                        style: TextStyle(
                                          color: HexColor("FF8A00"),
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context).size.height * 0.012,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                // Text("",
                                //   maxLines: 2,
                                //   textAlign: TextAlign.center,
                                //   style: TextStyle(
                                //     // foreground: Paint()..shader = linearGradient,
                                //     fontWeight: FontWeight.w700,
                                //     fontSize: MediaQuery.of(context).size.height * 0.016,
                                //   ),),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,right: 0,
                    child: Stack(
                      children: [
                        Align(alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.symmetric(//bottom: MediaQuery.of(context).size.height * 0.017,
                              horizontal: MediaQuery.of(context).size.width * 0.04,
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.08,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("lib/consultation/pages/set_price/assets/Rectangle 959.png")
                                )
                              ),
                              child: Center(
                                child: Text("Done",
                                  style: TextStyle(
                                    color: Colors.white,
                                    // foreground: Paint()..shader = linearGradient,
                                    fontWeight: FontWeight.w700,
                                    fontSize: MediaQuery.of(context).size.height * 0.02,
                                  ),),
                              ),
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
