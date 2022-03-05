import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            //TODO: Try to replicate the gradient in the design.
            //Tried to use RadialGradient to get the gradient effect but I wasn't
            //able to replicate it.
            Image.asset(
              "assets/background.png",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/logo.png",
                            fit: BoxFit.cover, width: 86.w, height: 38.h),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  Text(
                    "Change the way you travel & live",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 265.w,
                    child: Text(
                      "Stay with us in your favorite neighborhoods around the world.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 180.h,
                  ),
                  Container(
                      height: 280.h,
                      width: 335.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26.r),
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
