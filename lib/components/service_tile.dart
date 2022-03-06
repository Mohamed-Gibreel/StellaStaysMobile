import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stella_stays_mobile/components/service_card.dart';

class ServiceTile extends StatelessWidget {
  final String serviceCity;
  final List<dynamic> serviceList;
  const ServiceTile(
      {Key? key, required this.serviceCity, required this.serviceList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  serviceCity,
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
                Visibility(
                  visible: serviceList.length > 2,
                  child: Text(
                    "View All ${serviceList.length}",
                    style: TextStyle(
                      fontSize: 14.sp,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            )),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 150.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: serviceList.length,
            itemBuilder: (ctx, i) => ServiceCard(
                serviceImage: "assets/cleaning-service.png",
                serviceText: "Cleaning",
                index: i,
                totalCards: serviceList.length),
          ),
        ),
      ],
    );
  }
}
