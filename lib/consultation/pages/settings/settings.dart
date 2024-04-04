import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  String selectedOption = "View Profile";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(0), bottomLeft: Radius.circular(0)),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                        right: MediaQuery.of(context).size.width * 0.025,
                      ),
                      child: Image.asset("lib/consultation/pages/settings/assets/Rectangle 1259.png",
                        width: MediaQuery.of(context).size.width * 0.025,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.85,
                    child: Drawer(
                      backgroundColor: HexColor("20AFA9"),
                      // Add a ListView to the drawer. This ensures the user can scroll
                      // through the options in the drawer if there isn't enough vertical
                      // space to fit everything.
                      child: ListView(
                        // Important: Remove any padding from the ListView.
                        padding: EdgeInsets.zero,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.05,
                              left: MediaQuery.of(context).size.width * 0.04,
                              bottom: MediaQuery.of(context).size.height * 0.02,
                            ),
                            child: Row(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset("lib/consultation/pages/settings/assets/Frame 9.png",
                                  height: MediaQuery.of(context).size.height * 0.1,
                                ),
                                Column(mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                                    Text("Dr. Angelina Clayton",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context).size.height * 0.0185,
                                        )
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                                    Text("ID - KD63GO60DG1",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: MediaQuery.of(context).size.height * 0.015,
                                        )
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          drawerOptions(context, "Profile", "View Profile"),
                          drawerOptions(context, "reminder", "New Consultation"),
                          drawerOptions(context, "search", "Easy Search"),
                          drawerOptions(context, "reminder-2", "Super Schedule"),
                          drawerOptions(context, "Surgical Instruments", "Super Specialization"),
                          drawerOptions(context, "Inquiry Question", "Previous Bookinge"),
                          drawerOptions(context, "Book", "Smart manual"),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                          Align(alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.02),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: MediaQuery.of(context).size.width * 0.25,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("lib/consultation/pages/settings/assets/Rectangle 1273.png")
                                    )
                                ),
                                child: Center(
                                  child: Text("Logout",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        // color: showBgImg ? Colors.white : Colors.black,
                                        fontWeight:FontWeight.w700,
                                        fontSize: MediaQuery.of(context).size.height * 0.0185,
                                      )
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerOptions(context, icon, text){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedOption = text;
        });
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.09,
        child: ListTile(
          title: Stack(
            children: [
              if(text == selectedOption)Positioned(
                bottom: MediaQuery.of(context).size.height * 0.015,
                left: MediaQuery.of(context).size.width * 0.02,
                child: Card(
                  elevation: 7,
                  color: HexColor("20AFA9"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35)
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.75,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.01,
                  left: MediaQuery.of(context).size.width * 0.01,
                ),
                child: Stack(
                  children: [
                    Image.asset("lib/consultation/pages/settings/assets/Rectangle 980.png",
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.025,
                          left: MediaQuery.of(context).size.width * 0.055,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset("lib/consultation/pages/settings/assets/$icon.svg",),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.06,),
                            Text(text,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: selectedOption == text ? Colors.white : Colors.black,
                                  fontWeight:FontWeight.w700,
                                  fontSize: MediaQuery.of(context).size.height * 0.0185,
                                )
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}