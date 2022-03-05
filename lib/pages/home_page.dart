import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stella_stays_mobile/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

Widget searchSection() {
  return Stack(children: [
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
      // bottom: false,
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
          searchBar()
        ],
      ),
    ),
  ]);
}

Widget searchBar() {
  return Container(
    height: 280.h,
    width: 335.w,
    decoration: BoxDecoration(
      boxShadow: const <BoxShadow>[
        BoxShadow(color: Colors.white24, blurRadius: 10, offset: Offset(0.0, 0))
      ],
      borderRadius: BorderRadius.circular(26.r),
      color: Colors.white,
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 21.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "City".toUpperCase(),
                style: TextStyle(
                    fontSize: 12.sp,
                    letterSpacing: 1.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF67767C)),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 16.sp),
                decoration: InputDecoration(
                    // isDense: true,
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.only(bottom: 7),
                    labelText: "Select a city",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: TextStyle(
                      // height: 14.h,
                      fontSize: 14.sp,
                      color: const Color(0xFF4B5154),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.w, color: Constants.mainColor)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.w, color: Constants.mainColor))),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Dates".toUpperCase(),
                style: TextStyle(
                    letterSpacing: 1.sp,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF67767C)),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 16.sp),
                decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.only(bottom: 7),
                    labelText: "Select dates",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: TextStyle(
                      // height: 14.h,
                      fontSize: 14.sp,
                      color: const Color(0xFF4B5154),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.w, color: Constants.mainColor)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.w, color: Constants.mainColor))),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Guests".toUpperCase(),
                        style: TextStyle(
                            fontSize: 12.sp,
                            letterSpacing: 1.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF67767C)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Add Guests",
                        style: TextStyle(
                            fontSize: 14.sp, color: const Color(0xFF4B5154)),
                      )
                    ],
                  ),
                  Container(
                    width: 95.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 0.w, color: Constants.mainColor),
                        borderRadius: BorderRadius.circular(36.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            //TODO: Decrement counter
                          },
                          child: Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: Icon(
                                Icons.minimize,
                                size: 15.w,
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            //TODO: Increment counter
                          },
                          child: Icon(
                            Icons.add,
                            size: 15.w,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Container(
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
                color: Constants.mainColor,
                borderRadius: BorderRadius.circular(16.r)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(Icons.search, color: Colors.white),
              SizedBox(width: 11.w),
              Text(
                "Search",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              )
            ]))
      ]),
    ),
  );
}

Widget exploreSection(
    {image = "assets/slider-1.png",
    price = "1,250",
    propertyName = "Cozy Beachfront Villa | Private Pool | 4BDR",
    propertyLocation = "Dubai",
    propertyCapacity = "8 guests"}) {
  Widget propertyType() {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
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
                      image: AssetImage(image), fit: BoxFit.cover)),
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
                          "from AED $price/ night",
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
                  propertyName,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Text(
                      propertyLocation,
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
                      propertyCapacity,
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

  return Column(
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
      Padding(
        padding: EdgeInsets.only(left: 15.w),
        child: SizedBox(
          height: 250.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (ctx, i) => propertyType(),
          ),
        ),
      )

      // Different way of achieving the same thing, but with more options.

      // CarouselSlider(
      //     items: [propertyType(), propertyType(), propertyType()],
      //     options: CarouselOptions(
      //       height: 250.h,
      //       enableInfiniteScroll: false,
      //       viewportFraction: 1,
      //     )),
    ],
  );
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            searchSection(),
            SizedBox(
              height: 45.h,
            ),
            exploreSection()
          ],
        ),
      ),
    );
  }
}
