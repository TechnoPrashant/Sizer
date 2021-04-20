import 'package:example/screens/second_page_screen.dart';
import 'package:example/screens/third_page_screen.dart';
import 'package:example/util/color_util.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'first_page_screen.dart';
import 'fourth_page_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
            bottom: SizerUtil.deviceType == DeviceType.tablet ? 1.h : 0.0,
            right: SizerUtil.deviceType == DeviceType.tablet ? 2.w : 0.0),
        child: SizedBox(
          height: 7.h,
          width: 7.h,
          child:

          FloatingActionButton(
            onPressed: () {
              _pageController.animateToPage(_pageIndex < 3 ? _pageIndex + 1 : 0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            },
            child: Icon(
              _pageIndex < 3 ? Icons.arrow_forward : Icons.done,
              size: 3.h,
            ),
            backgroundColor: getColor(),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        // padding: EdgeInsets.only(top: 0),
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (value) {
                print('val:: $value');
                setState(() {
                  _pageIndex = value;
                });
              },
              children: [
                FirstPageScreen(),
                SecondPageScreen(),
                ThirdPageScreen(),
                FourthPageScreen(),
              ],
            ),
            widDots(),
          ],
        ),
      ),
    );
  }

  widDots() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 4.h),
        child: SmoothPageIndicator(
          controller: _pageController,
          count: 4,
          axisDirection: Axis.horizontal,
          effect: ExpandingDotsEffect(
              expansionFactor: 2.5,
              spacing: 1.5.w,
              radius: 100.w,
              dotWidth: 1.5.h,
              dotHeight: 1.5.h,
              paintStyle: PaintingStyle.fill,
              dotColor: Colors.grey[300],
              activeDotColor: getColor()),
        ),
      ),
    );


    // Without this plugin
   /* return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.0),
        child: SmoothPageIndicator(
          controller: _pageController,
          count: 4,
          axisDirection: Axis.horizontal,
          effect: ExpandingDotsEffect(
              expansionFactor: 2.5,
              spacing: 5.0,
              radius: 100.0,
              dotWidth: 10.0,
              dotHeight: 10.0,
              paintStyle: PaintingStyle.fill,
              dotColor: Colors.grey[300],
              activeDotColor: getColor()),
        ),
      ),
    );*/

  }

  getColor() {
    switch (_pageIndex) {
      case 0:
        return ColorUtil.color1();
      case 1:
        return ColorUtil.color2();
      case 2:
        return ColorUtil.color3();
      case 3:
        return ColorUtil.color4();
    }
  }
}
