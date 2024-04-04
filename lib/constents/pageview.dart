import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  MyPageView(
      {super.key,
      required this.pageViewHeight,
      required this.callback,
      required this.itemBuilder,
      required this.pagesCount,
      this.headerWidget,
      this.footerWidget,
      this.pageController});
  final Widget Function(BuildContext, int) itemBuilder;
  final double pageViewHeight;
  final Function callback;
  final int pagesCount;
  final Widget Function(BuildContext, int)? headerWidget;
  final Widget Function(BuildContext, int)? footerWidget;
  PageController? pageController;
  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  late PageController _pageController;
  late ValueNotifier<int> currentPageNotifier;
  @override
  void initState() {
    super.initState();
    currentPageNotifier = ValueNotifier<int>(0);
    if (widget.pageController != null) {
      _pageController = widget.pageController!;
    } else {
      _pageController = PageController(
        initialPage: 0,
      );
    }
  }

  setPageController() {
    _pageController.animateToPage(2,
        duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: currentPageNotifier,
        builder: (context, currentPage, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.headerWidget?.call(context, currentPage) ??
                  const SizedBox.shrink(),
              SizedBox(
                height: widget.pageViewHeight,
                child: PageView.builder(
                  itemCount: widget.pagesCount,
                  controller: _pageController,
                  onPageChanged: (index) {
                    currentPageNotifier.value = index;
                    widget.callback(index);
                  },
                  itemBuilder: widget.itemBuilder,
                ),
              ),
              widget.footerWidget?.call(context, currentPage) ??
                  const SizedBox.shrink(),
              // DotIndicator(
              //   childrenCount: widget.pagesCount,
              //   currentPage: currentPage,
              // ),
            ],
          );
        });
  }
}
