import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';


class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.childrenCount,
    required this.currentPage,
    this.decoration,
  });
  final int childrenCount;
  final int currentPage;
  final Decoration? decoration;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return RepaintBoundary(
      child: DecoratedBox(
        decoration: decoration ??
            AppColor.decoration(
              context,
              inset: true,
              blurRadius: 1.r,
              offset: Offset(2.r, 2.r),
            ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 2.5.r,
            vertical: 1.5.r,
          ),
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  childrenCount,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.r,
                    ),
                    child: DecoratedBox(
                      decoration: AppColor.decoration(
                        context,
                        offset: Offset(1.r, 1.r),
                        blurRadius: 1.r,
                      ).copyWith(
                        color:
                            currentPage != index ? Colors.white : Colors.black,
                      ),
                      child: SizedBox(
                        width: 5.w,
                        height: 5.h,
                      ),
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

class DotIndicatorDark extends StatelessWidget {
  const DotIndicatorDark({
    super.key,
    required this.childrenCount,
    required this.currentPage,
    this.decoration,
  });
  final int childrenCount;
  final int currentPage;
  final Decoration? decoration;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 2.5.r,
        vertical: 1.5.r,
      ),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              childrenCount,
              (index) => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.r,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPage != index ? Colors.white : Colors.black,
                  ),
                  child: SizedBox(
                    width: 5.w,
                    height: 5.h,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
