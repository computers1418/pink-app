import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_application_1/constents/hex_color_extention.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';


class AppColor {
  static Color primaryColor = "#171632".toColor();
  static Color backgorundcolor = "#F2F7FB".toColor();
  static Color grey = "#EFEFEF".toColor();
  static Color orange = "#FF8412".toColor();
  static BoxDecoration decoration(
    BuildContext context, {
    BorderRadiusGeometry? borderRadius,
    BlurStyle blurStyle = BlurStyle.normal,
    bool inset = false,
    Offset? offset,
    double? blurRadius,
    Color backgroundColor = const Color(0xffF2F7FB),
    List<Color>? outershadowcolors,
    List<Color>? innershadowcolors,
  }) {
    ScreenUtil.init(context);
    Offset initoffset = offset ?? Offset(10.w, 10.h);
    BorderRadiusGeometry? initborderRadius =
        borderRadius ?? BorderRadius.circular(30.h);

    double? initblurRadius = blurRadius ?? 10.r;

    List<BoxShadow> shadows = [
      BoxShadow(
        color: outershadowcolors?.first ?? Colors.white,
        offset: -initoffset,
        blurRadius: initblurRadius,
        blurStyle: blurStyle,
        inset: inset,
      ),
      BoxShadow(
        color: outershadowcolors?.last ?? Colors.blue.withOpacity(0.125),
        offset: initoffset,
        blurRadius: initblurRadius,
        blurStyle: blurStyle,
        inset: inset,
      ),
    ];
    List<BoxShadow> innershadow = [
      BoxShadow(
        color: innershadowcolors?.last ?? Colors.white,
        offset: -initoffset,
        blurRadius: initblurRadius,
        blurStyle: blurStyle,
        inset: inset,
      ),
      BoxShadow(
        color: innershadowcolors?.last ?? Colors.blue.shade50,
        offset: initoffset,
        blurRadius: initblurRadius,
        blurStyle: blurStyle,
        inset: inset,
      ),
    ];
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: initborderRadius,
      boxShadow: inset ? innershadow : shadows,
    );
  }
}
