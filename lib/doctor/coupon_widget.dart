import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/gradient_text_widget.dart';
import 'package:flutter_application_1/constents/commen_widgets.dart';

class CouponWidget extends StatefulWidget {
  const CouponWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return CouponWidgetState();
  }
}

class CouponWidgetState extends State<CouponWidget> {
  List selectedCoupons = [];
  @override
  Widget build(BuildContext context) {
    String assets = "lib/doctor/assets/";

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Use Your',
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Coupons',
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              Image.asset(
                'assets/images/refresh.png',
                width: 65,
                height: 65,
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Image.asset(
              '${assets}Group 1 (14).png',
              width: MediaQuery.of(context).size.width,
              height: 420,
              fit: BoxFit.fitWidth,
            ),
            const Positioned(
              top: 65,
              left: 58,
              child: RotatedBox(
                quarterTurns: 3,
                child: GradientText(
                  'CONSULT150',
                  style: TextStyle(
                    fontFamily: "Metropolis",
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
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
              ),
            ),
            const Positioned(
              top: 260,
              left: 58,
              child: RotatedBox(
                quarterTurns: 3,
                child: GradientText(
                  'CONSULT100',
                  style: TextStyle(
                    fontFamily: "Metropolis",
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
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
              ),
            ),
            const Positioned(
              top: 65,
              left: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rs. 150 OFF',
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Text(
                      'Get Rs. 150 OFF Discount On Technology Fee',
                      maxLines: 2,
                      style: TextStyle(
                        fontFamily: "Metropolis",
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 260,
              left: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rs. 100 OFF',
                    style: TextStyle(
                      fontFamily: "Metropolis",
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Text(
                      'Get Rs. 100 OFF Discount On Technology Fee',
                      maxLines: 2,
                      style: TextStyle(
                        fontFamily: "Metropolis",
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 136,
              right: 70,
              child: GestureDetector(
                onTap: () => setState(() {
                  print("object");
                  if (selectedCoupons.contains("CONSULT150")) {
                    selectedCoupons.remove("CONSULT150");
                  } else {
                    selectedCoupons.add("CONSULT150");
                  }
                }),
                child: Container(
                  width: 98,
                  height: 34,
                  decoration: CommonWidgets.imageDecoration(
                      "${assets}Rectangle 280.png"),
                  alignment: Alignment.center,
                  child: Text(
                    selectedCoupons.contains("CONSULT150")
                        ? 'APPLIED'
                        : 'APPLY',
                    style: const TextStyle(
                      fontFamily: "Metropolis",
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 330,
              right: 70,
              child: GestureDetector(
                onTap: () => setState(() {
                  if (selectedCoupons.contains("CONSULT100")) {
                    selectedCoupons.remove("CONSULT100");
                  } else {
                    selectedCoupons.add("CONSULT100");
                  }
                }),
                child: Container(
                  width: 98,
                  height: 34,
                  decoration: CommonWidgets.imageDecoration(
                      "${assets}Rectangle 280.png"),
                  alignment: Alignment.center,
                  child: Text(
                    selectedCoupons.contains("CONSULT100")
                        ? 'APPLIED'
                        : 'APPLY',
                    style: const TextStyle(
                      fontFamily: "Metropolis",
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
