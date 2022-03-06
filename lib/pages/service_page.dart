import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stella_stays_mobile/constants.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ServicePage extends StatefulWidget {
  final String serviceDetails;
  const ServicePage({Key? key, required this.serviceDetails}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(children: [
            Hero(
              tag: widget.serviceDetails,
              child: Container(
                height: 260.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/cleaning-service.png"),
                        fit: BoxFit.cover)),
              ),
            ),
            SafeArea(
                child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                  padding: EdgeInsets.only(left: 18.w, top: 30.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        "Services",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),
            )),
            Positioned(
                bottom: 0,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 27.w),
                  child: Text(
                    "Cleaning Service",
                    style: TextStyle(
                        fontSize: 28.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ))
          ]),
          SizedBox(
            height: 23.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 27.w),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Deep cleaning",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    SizedBox(
                      width: 310.w,
                      child: Text(
                        "Eget aliquet nibh praesent tristique. Elit ullamcorper dignissim cras tincidunt lobortis. Leo vel orci porta non. Dictumst vestibulum rhoncus est pellentesque elit ullamcorper.",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 36.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quick cleaning",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    SizedBox(
                      width: 310.w,
                      child: Text(
                        "Fames ac turpis egestas maecenas pharetra convallis posuere morbi. Amet massa vitae tortor condimentum lacinia quis.",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    SizedBox(
                      width: 310.w,
                      child: Text(
                        "Vitae ultricies leo integer malesuada nunc vel. Convallis convallis tellus id interdum velit laoreet id donec. Pellentesque habitant.",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
        GestureDetector(
          onTap: () {
            showBarModalBottomSheet(
                shape: Border.all(color: Colors.transparent),
                backgroundColor: Colors.red,
                clipBehavior: Clip.none,
                barrierColor: Colors.black.withOpacity(.3),
                context: context,
                builder: (context) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.r))),
                      height: 200.h,
                      width: 375.w,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 60.h,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFFDFDFDF),
                                      width: 1.w),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.r),
                                      topRight: Radius.circular(16.r)),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Whatsapp"),
                                      Icon(Icons.whatsapp)
                                    ],
                                  ),
                                )
                                // child:
                                ),
                            Container(
                                height: 60.h,
                                // constraints: BoxConstraints(maxHeight: 60.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFFDFDFDF),
                                        width: 1.w),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16.r),
                                        bottomRight: Radius.circular(16.r))),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Email"),
                                      Icon(Icons.email_outlined)
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ));
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Constants.mainColor,
            ),
            width: double.infinity,
            child: Center(
                child: Text("Inquire",
                    style: TextStyle(color: Colors.white, fontSize: 17.sp))),
          ),
        )
      ],
    ));
  }
}
