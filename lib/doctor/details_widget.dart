import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 141,
                width: 141,
                decoration: const BoxDecoration(
                  color: Color(0xFFF3EDF4),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Image.asset(
                  'assets/images/doctor_pic.png',
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Dr. Johnathan\nGray  ',
                                    style: TextStyle(
                                      fontFamily: "Metropolis",
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '( BDS, MDS )',
                                    style: TextStyle(
                                      fontFamily: "Metropolis",
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 9),
                    const Text(
                      'Dental Specialist',
                      style: TextStyle(
                        fontFamily: "Metropolis",
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.topRight,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Image.asset(
                            'assets/images/rate_rectangle.png',
                            fit: BoxFit.fill,
                            width: 79 + 20,
                            height: 32 + 20,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/star.png',
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                '4.5',
                                style: TextStyle(
                                  fontFamily: "Metropolis",
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(width: 25),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Stack(
            children: [
              Image.asset(
                'assets/images/doctor_rectangle.png',
                height: 104,
                fit: BoxFit.fill,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/calendar.png',
                                  height: 34,
                                  width: 34,
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  '6+',
                                  style: TextStyle(
                                    fontFamily: "Metropolis",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 0),
                                const Text(
                                  'Years',
                                  style: TextStyle(
                                    fontFamily: "Metropolis",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/star.png',
                                  height: 34,
                                  width: 34,
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  '4.5',
                                  style: TextStyle(
                                    fontFamily: "Metropolis",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 0),
                                const Text(
                                  'Stars',
                                  style: TextStyle(
                                    fontFamily: "Metropolis",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/best.png',
                                  height: 34,
                                  width: 34,
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  '20+',
                                  style: TextStyle(
                                    fontFamily: "Metropolis",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  'Medals',
                                  style: TextStyle(
                                    fontFamily: "Metropolis",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
