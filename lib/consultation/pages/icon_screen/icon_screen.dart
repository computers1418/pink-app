import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../settings/settings.dart';

class IconScreen extends StatelessWidget {
  IconScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final double runSpacing = 8;
  final double spacing = 18;
  final columns = 5;

  @override
  Widget build(BuildContext context) {
    final w = (MediaQuery.of(context).size.width - runSpacing * (columns - 1)) / columns;
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
                      child: Text("  Icons",
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
                        width: MediaQuery.of(context).size.width * 0.25,
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
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06
                ),
                child: Center(
                  child: GridView.builder(
                    controller: ScrollController(),
                    shrinkWrap: true,
                    itemCount: 33,

                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 20.0,
                     ),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          //right: MediaQuery.of(context).size.width * 0.028,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.11,
                              width: MediaQuery.of(context).size.height * 0.11,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("lib/consultation/pages/icon_screen/assets/Frame 10.png")
                                  )
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.0285,),
                                child: SvgPicture.asset("lib/consultation/pages/icon_screen/assets/Vector"
                                    "${index == 0 ? "" : "-${index+1}"}.svg"),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
