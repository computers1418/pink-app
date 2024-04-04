import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/gradient_text_widget.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EDF4),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/map.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fitWidth,
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/map_search.png',
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 40,
                        right: 40,
                        top: 35,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_back_rounded,
                                size: 20,
                              ),
                              SizedBox(width: 15),
                              Text(
                                "Search here",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF636363),
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.search_rounded,
                            size: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/map_frame.png',
                    ),
                    const Positioned(
                      right: 45,
                      top: 40,
                      child: Text(
                        "4.5",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF252525),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 155,
                      top: 55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GradientText(
                            'Dental Clinic',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFAD37E0),
                                Color(0xFFEE2B3B),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 140,
                            child: Text(
                              "12/2, Mathura Road, Sector 37, Faridabad - Delhi",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF252525),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
