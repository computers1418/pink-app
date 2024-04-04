import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/home/home.dart';
import 'package:page_transition/page_transition.dart';

import '../../home_screen/home_screen.dart';

class SideBarWidget extends StatefulWidget {
  final Function callback;
  const SideBarWidget({super.key, required this.callback});

  @override
  State<SideBarWidget> createState() => _SideBarWidgetState();
}

class _SideBarWidgetState extends State<SideBarWidget> {
  late List<Map<String, dynamic>> menuData = [
    {
      'icon': 'assets/images/account_circle.png',
      'title': 'Profile',
      'isSelected': true,
    },
    {
      'icon': 'assets/images/frame.png',
      'title': 'Appointment',
      'isSelected': false,
    },
    {
      'icon': 'assets/images/notification.png',
      'title': 'Notifications',
      'isSelected': false,
    },
    {
      'icon': 'assets/images/invoice.png',
      'title': 'Payments',
      'isSelected': false,
    },
    {
      'icon': 'assets/images/settings.png',
      'title': 'Settings',
      'isSelected': false,
    },
    {
      'icon': 'assets/images/paper.png',
      'title': 'Privacy Policy',
      'isSelected': false,
    },
    {
      'icon': 'assets/images/paper_clip.png',
      'title': 'Terms & Conditions',
      'isSelected': false,
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFAD37E0),
            Color(0xFFEE2B3B),
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              widget.callback();
              // Navigator.push(
              //   context,
              //   PageTransition(
              //     type: PageTransitionType.rightToLeft,
              //     child: HomeWidget(),
              //   ),
              // );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Icon(
                Icons.close_rounded,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 76,
                  width: 76,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/profile_pic.png',
                  ),
                ),
                const SizedBox(width: 25),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Evelyn Tylor',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Evelyntyrr88@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          ListView.builder(
            itemCount: menuData.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            itemBuilder: (context, index) {
              final data = menuData[index];
              return InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    for (int i = 0; i < menuData.length; i++) {
                      if (menuData[i]['title'] == data['title']) {
                        menuData[i]['isSelected'] = true;
                      } else {
                        menuData[i]['isSelected'] = false;
                      }
                    }
                  });
                },
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 125, bottom: 10),
                  padding: const EdgeInsets.only(
                      left: 10, right: 5, top: 8, bottom: 8),
                  decoration: data['isSelected']
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color:
                                    const Color(0xff000000).withOpacity(0.15),
                                blurRadius: 10,
                                offset: const Offset(5, 5)),
                            BoxShadow(
                                color: const Color(0xffFFFFFF).withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(-5, -5)),
                          ],
                          gradient: const LinearGradient(colors: [
                            Color(0xffB834B9),
                            Color(0xffC433A4),
                          ]))
                      : null,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        data['icon'],
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        data['title'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/logout.png',
                      height: 44,
                      width: 44,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
