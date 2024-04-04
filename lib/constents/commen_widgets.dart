import 'package:flutter/cupertino.dart';

class CommonWidgets{

 static  Decoration imageDecoration(String assetPath){
    return BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
        
        image: AssetImage(
          assetPath
        )
        )
    );
  }
}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}