import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/gradient_text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InvoiceWidget extends StatelessWidget {
  const InvoiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String assets = "lib/doctor/assets/";

    return Container(
      color: const Color(0xFFECC0D9),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'This Is Your',
              style: TextStyle(
                fontFamily: "Metropolis",
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Use Your',
              style: TextStyle(
                fontFamily: "Metropolis",
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Stack(
            children: [
              Image.asset(
                '${assets}Frame 111.png',
                width: MediaQuery.of(context).size.width,
                height: 487,
                fit: BoxFit.fill,
              ),
              Positioned(
                  top: 58,
                  left: 50,
                  child: SvgPicture.asset("${assets}Receipt.svg")),
              const Positioned(
                top: 58,
                left: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date : 19/11/2022',
                      style: TextStyle(
                        fontFamily: "Metropolis",
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Appointment ID  : DGB5H19Z37',
                      style: TextStyle(
                        fontFamily: "Metropolis",
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                child: const Column(
                  children: [
                    SizedBox(height: 130),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Consultation Fee',
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GradientText(
                          'Rs. 1000',
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 14,
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
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Service Fee',
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GradientText(
                          'Rs. 100',
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 14,
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
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Technology Fee',
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GradientText(
                          'Rs. 100',
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 14,
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
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Test',
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GradientText(
                          '-',
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 14,
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
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Surgery',
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GradientText(
                          '-',
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 14,
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
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Medicine',
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GradientText(
                          '-',
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 14,
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
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Coupon',
                              style: TextStyle(
                                fontFamily: "Metropolis",
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            GradientText(
                              '( CONSULT100 )',
                              style: TextStyle(
                                fontFamily: "Metropolis",
                                fontSize: 14,
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
                          ],
                        ),
                        GradientText(
                          'Rs. -100',
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            fontSize: 14,
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
                      ],
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          'TOTAL',
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Rs. 1100',
                          style: TextStyle(
                            fontFamily: "Metropolis",
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
