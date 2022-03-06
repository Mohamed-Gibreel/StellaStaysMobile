import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stella_stays_mobile/models/property.dart';

class PropertyCard extends StatelessWidget {
  final Property property;
  const PropertyCard({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Container(
              height: 180.h,
              width: 320.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  image: DecorationImage(
                      image: AssetImage(property.propertyImage),
                      fit: BoxFit.cover)),
            ),
            Positioned(
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 7.w),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(47.r)),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 17.w, vertical: 7.h),
                        child: Text(
                          "from AED ${property.propertyPrice}/ night",
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        )),
                  ),
                ))
          ]),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  property.propertyName,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Text(
                      property.propertyLocation,
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    const Icon(
                      Icons.circle,
                      size: 8,
                      color: Color(0xFFC4C4C4),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      property.propertyCapacity > 1
                          ? "${property.propertyCapacity.toString()} guests"
                          : "${property.propertyCapacity.toString()} guest",
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
