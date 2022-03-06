import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PropertySkeletonCard extends StatelessWidget {
  const PropertySkeletonCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey[400] ?? Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
          left: 15.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180.h,
              width: 320.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: Colors.grey),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 250.w,
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 50.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.r)),
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
                      Container(
                        width: 50.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
