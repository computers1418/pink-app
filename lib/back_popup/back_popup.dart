import 'package:flutter/material.dart';

import '../constents/commen_styles.dart';
import '../constents/commen_widgets.dart';

backAlertDialog(BuildContext context,Widget text){
  String assets="lib/back_popup/assets/";

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.transparent,
      content: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            '${assets}Group 1 (16).png',
            height: 493,
            width: 312,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 170,
            child: Column(mainAxisSize: MainAxisSize.min,
              children: [
                text,
                const SizedBox(height: 25,),

                Text("Are you sure you want\nto leave?",style: CommonStyle.metropolis16W700(color: Colors.white),textAlign: TextAlign.center,),
                const SizedBox(height: 30,),
                Stack(
                  fit: StackFit.loose,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.pop(context);

                      },
                      child: Container(
                        height: 80,
                        width: 130,
                        decoration: CommonWidgets.imageDecoration("${assets}Group 2 (4).png"),
                        alignment: Alignment.center,

                        child: Padding(
                          padding: const EdgeInsets.only(bottom:25),
                          child: Text("NO",style: CommonStyle.metropolis13W900(color: Colors.white),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 110),
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,

                        onTap: (){
                          Navigator.pop(context);
                          Navigator.pop(context);

                        },
                        child: Container(
                          height: 80,
                          width: 130,
                          alignment: Alignment.center,
                          decoration: CommonWidgets.imageDecoration("${assets}Group 2 (4).png"),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom:25),
                            child: Text("YES",style: CommonStyle.metropolis13W900(color: Colors.white),),
                          ),

                        ),
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),


        ],
      ),
    ),
  );
}
