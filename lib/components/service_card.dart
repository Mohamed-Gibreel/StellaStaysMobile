import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stella_stays_mobile/models/service.dart';
import 'package:stella_stays_mobile/pages/service_page.dart';

class ServiceCard extends StatelessWidget {
  final Service service;
  final String serviceCity;
  final int index;
  final int totalCards;
  const ServiceCard(
      {Key? key,
      required this.service,
      required this.serviceCity,
      required this.index,
      required this.totalCards})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ServicePage(service: service, heroTag: "$serviceCity-$index")));
      }),
      child: Padding(
        padding: EdgeInsets.only(right: 8.w, left: index == 0 ? 15.w : 0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Hero(
                tag: "$serviceCity-$index",
                child: Container(
                  height: 120.h,
                  width: totalCards == 1
                      ? MediaQuery.of(context).size.width / 1.075
                      : totalCards == 2
                          ? MediaQuery.of(context).size.width / 2.175
                          : 120.w,
                  // width: 120.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      image: DecorationImage(
                          image: AssetImage(service.imageUrl ?? ""),
                          fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Padding(
                      padding: EdgeInsets.only(left: 15.w, bottom: 10.h),
                      child: SizedBox(
                        width: totalCards == 1
                            ? MediaQuery.of(context).size.width / 1.175
                            : totalCards == 2
                                ? MediaQuery.of(context).size.width / 2.625
                                : 95.w,
                        child: Text(
                          service.title ?? "N/A",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 14.sp),
                        ),
                      )))
            ]),
          ],
        ),
      ),
    );
  }
}
