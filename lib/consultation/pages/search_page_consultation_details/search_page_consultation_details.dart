import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../settings/settings.dart';

class SearchPageConsultationDetails extends StatelessWidget {
  SearchPageConsultationDetails({super.key});
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
                      child: Text("  Patient Details",
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
              Padding(
                padding: EdgeInsets.symmetric(//bottom: MediaQuery.of(context).size.height * 0.017,
                    horizontal: MediaQuery.of(context).size.width * 0.06
                ),
                child: Stack(
                  children: [
                    Image.asset("lib/consultation/pages/consultation_page_consultation_details/assets/Rectangle 980.png",),
                    Padding(
                      padding: EdgeInsets.symmetric(//bottom: MediaQuery.of(context).size.height * 0.017,
                          horizontal: MediaQuery.of(context).size.width * 0.06
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                          Center(
                              child: Image.asset("lib/consultation/pages/consultation_page_consultation_details/assets/Frame 10.png",
                                  height: MediaQuery.of(context).size.height * 0.15
                              )),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                          Center(
                            child: Text("Pennelope Perez",
                              style: TextStyle(
                                // foreground: Paint()..shader = linearGradient,
                                fontWeight: FontWeight.w700,
                                fontSize: MediaQuery.of(context).size.height * 0.0185,
                              ),),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                          Center(
                            child: Text("User ID - AZ987TR354RT",
                              style: TextStyle(
                                // foreground: Paint()..shader = linearGradient,
                                color: HexColor("9E9E9E"),
                                fontWeight: FontWeight.w400,
                                fontSize: MediaQuery.of(context).size.height * 0.015,
                              ),),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(height: MediaQuery.of(context).size.height * 0.0875,
                                width: MediaQuery.of(context).size.width * 0.36,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("lib/consultation/pages/consultation_page_consultation_details/assets/Rectangle 996.png")
                                    )
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text("Date",
                                        style: TextStyle(
                                          // foreground: Paint()..shader = linearGradient,
                                          color: HexColor("9E9E9E"),
                                          fontWeight: FontWeight.w400,
                                          fontSize: MediaQuery.of(context).size.height * 0.015,
                                        ),),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                                    Center(
                                      child: Text("08/09/22",
                                        style: TextStyle(
                                          // foreground: Paint()..shader = linearGradient,
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context).size.height * 0.0165,
                                        ),),
                                    ),
                                  ],
                                ),
                              ),
                              Container(height: MediaQuery.of(context).size.height * 0.0875,
                                width: MediaQuery.of(context).size.width * 0.36,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("lib/consultation/pages/consultation_page_consultation_details/assets/Rectangle 996.png")
                                    )
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text("Time",
                                        style: TextStyle(
                                          // foreground: Paint()..shader = linearGradient,
                                          color: HexColor("9E9E9E"),
                                          fontWeight: FontWeight.w400,
                                          fontSize: MediaQuery.of(context).size.height * 0.015,
                                        ),),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                                    Center(
                                      child: Text("10:00 am",
                                        style: TextStyle(
                                          // foreground: Paint()..shader = linearGradient,
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context).size.height * 0.0165,
                                        ),),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.045,),
                          Column(
                            children: [
                              displayCardTextWidget(context, "Appointment ID", "WR346GE5234", false, false),
                              displayCardTextWidget(context, "Doctor ID", "KD63GO60DG1", false, false),
                              displayCardTextWidget(context, "Email", "Patient@gmail.com", false, false),
                              displayCardTextWidget(context, "Phone No.", "+91 9876543210", false, false),
                              displayCardTextWidget(context, "Age", "24", false, false)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
              Stack(
                children: [
                  Image.asset("lib/consultation/pages/consultation_page_consultation_details/assets/Rectangle 1254.png",),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.03,
                        horizontal: MediaQuery.of(context).size.width * 0.06
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textFieldsWidgets(context, "Problem Select", "Gum"),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.018,),
                        textFieldsWidgets(context, "Test Select", "Gum Disease Evaluation"),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.018,),
                        textFieldsWidgets(context, "Medicine", "Amoxicillin"),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.018,),
                        textFieldsWidgets(context, "Surgery", "Gum Disease"),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.018,),
                        textFieldsWidgets(context, "Consultation Type", "Clinic"),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
              Padding(
                padding: EdgeInsets.symmetric(//bottom: MediaQuery.of(context).size.height * 0.017,
                    horizontal: MediaQuery.of(context).size.width * 0.06
                ),
                child: Text("Assessment",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      // color: Colors.white,
                      fontWeight:FontWeight.w700,
                      fontSize: MediaQuery.of(context).size.height * 0.0185,
                    )
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              Padding(
                padding: EdgeInsets.symmetric(//bottom: MediaQuery.of(context).size.height * 0.017,
                    horizontal: MediaQuery.of(context).size.width * 0.06
                ),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                    " Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim,"
                    " metus nec fringilla accumsan, risus sem sollicitudin lacus, ut "
                    "interdum tellus elit sed risus. Maecenas eget condimentum velit, "
                    "sit amet feugiat lectus. Class aptent taciti sociosqu ad litora "
                    "torquent per conubia nostra, per inceptos himenaeos. Praesent auctor "
                    "purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut "
                    "rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur "
                    "vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. "
                    "Aliquam in elementum tellus.Lorem ipsum dolor sit amet, consectetur "
                    "adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis "
                    "tellus. Sed dignissim, metus nec fringilla accumsan, risus sem "
                    "sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget "
                    "condimentum velit, sit amet feugiat lectus. Class aptent taciti "
                    "sociosqu ad litora torquent per conubia nostra, per inceptos "
                    "himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque"
                    " ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, "
                    "eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis "
                    "convallis diam sit amet lacinia. Aliquam in elementum tellus. "
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu "
                    "turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus "
                    "nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum "
                    "tellus elit sed risus. Maecenas eget condimentum velit, sit amet "
                    "feugiat lectus. Class aptent taciti sociosqu ad litora torquent per "
                    "conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus"
                    " enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. "
                    "Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum "
                    "lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in "
                    "elementum tellus.Lorem ipsum dolor sit amet, consectetur adipiscing "
                    "elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed "
                    "dignissim, metus nec fringilla accumsan, risus sem sollicitudin "
                    "lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum"
                    " velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad "
                    "litora torquent per conubia nostra, per inceptos himenaeos. Praesent"
                    " auctor purus luctus enim egestas, ac scelerisque ante pulvinar. "
                    "Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. "
                    "Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet"
                    " lacinia. Aliquam in elementum tellus.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: HexColor("9E9E9E"),
                      fontWeight:FontWeight.w400,
                      fontSize: MediaQuery.of(context).size.height * 0.013,
                    )
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
            ],
          ),
        ),
      ),
    );
  }

  Widget displayCardTextWidget(context, text1, text2, hasBottomPadding, isSmallText){
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.04,
        bottom: hasBottomPadding ? MediaQuery.of(context).size.height * 0.005 :
        MediaQuery.of(context).size.height * 0.025,
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(//width: MediaQuery.of(context).size.width * 0.3,
            child: Text(text1,
                style: TextStyle(
                  color: HexColor("9E9E9E"),
                  fontWeight: FontWeight.w700,
                  fontSize: MediaQuery.of(context).size.height * 0.017,
                )
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
          Expanded(
            child: Text(text2,
                textAlign: TextAlign.left,
                style: TextStyle(
                  // color: Colors.white,
                  fontWeight: isSmallText ? FontWeight.w400 : FontWeight.w700,
                  fontSize: isSmallText ? MediaQuery.of(context).size.height * 0.015 :
                  MediaQuery.of(context).size.height * 0.017,
                )
            ),
          )
        ],
      ),
    );
  }

  Widget textFieldsWidgets(context, text1, text2){
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.06,
              bottom: MediaQuery.of(context).size.height * 0.01),
          child: Text(text1,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: MediaQuery.of(context).size.height * 0.016,
              )
          ),
        ),
        Stack(
          children: [
            Image.asset("lib/consultation/pages/consultation_page_consultation_details/assets/Rectangle 976.png",),
            Padding(
              padding: EdgeInsets.only(
                //top: MediaQuery.of(context).size.height * 0.02,
                  right: MediaQuery.of(context).size.width * 0.06,
                  left: MediaQuery.of(context).size.width * 0.06),
              child: TextField(
                controller: TextEditingController(text: text2),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                    fontWeight: FontWeight.w700
                ),
                obscureText: false,
              ),
            )
          ],
        ),
      ],
    );
  }

}
