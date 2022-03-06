import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stella_stays_mobile/components/property_card.dart';
import 'package:stella_stays_mobile/components/search_bar.dart';
import 'package:stella_stays_mobile/components/service_card.dart';
import 'package:stella_stays_mobile/components/service_tile.dart';
import 'package:stella_stays_mobile/constants.dart';
import 'package:stella_stays_mobile/pages/service_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

Widget searchSection() {
  return Container(
    color: Colors.white,
    child: Stack(children: [
      //TODO: Try to replicate the gradient in the design.
      //Tried to use RadialGradient to get the gradient effect but I wasn't
      //able to replicate it.
      Image.asset(
        "assets/background.png",
        fit: BoxFit.cover,
        width: double.infinity,
        height: 560.h,
      ),
      SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/logo.png", fit: BoxFit.cover, width: 86.w),
              ],
            ),
            SizedBox(
              height: 48.h,
            ),
            SizedBox(
              width: 308.w,
              child: Text(
                "Change the way you travel & live",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 38.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
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
            const SearchBar()
          ],
        ),
      ),
    ]),
  );
}

Widget exploreSection() {
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 335.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Explore",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 28.sp),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  Text(
                    "Beachfront villas to high rise apartments and penthouses, experience your next stay with Stella.",
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                ],
              ),
            ),
          ],
        ),
        // Different way of achieving the same thing, but with more options.
        // CarouselSlider(
        //     items: [propertyType(), propertyType(), propertyType()],
        //     options: CarouselOptions(
        //       height: 250.h,
        //       enableInfiniteScroll: false,
        //       viewportFraction: .85,
        //     )),
        SizedBox(
          height: 250.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (ctx, i) => const PropertyType(
              propertyPrice: "1,250",
              propertyCapacity: 8,
              propertyImage: "assets/slider-1.png",
              propertyName: "Cozy Beachfront Villa | Private Pool | 4BDR",
              propertyLocation: "Dubai",
            ),
          ),
        ),
      ],
    ),
  );
}

Widget servicesSection(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: 24.h, bottom: 65.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Text(
            "Services",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28.sp),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        const ServiceTile(
            serviceCity: "Dubai", serviceList: [1, 2, 3, 4, 5, 6]),
      ],
    ),
  );
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchSection(),
              Container(
                color: Colors.white,
                height: 45.h,
              ),
              exploreSection(),
              servicesSection(context)
            ],
          ),
        ),
      ),
    );
  }
}
