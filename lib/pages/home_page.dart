import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stella_stays_mobile/components/property_card.dart';
import 'package:stella_stays_mobile/components/property_skeleton_card.dart';
import 'package:stella_stays_mobile/components/search_bar.dart';
import 'package:stella_stays_mobile/components/service_skeleton_tile.dart';
import 'package:stella_stays_mobile/components/service_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stella_stays_mobile/constants.dart';
import 'package:stella_stays_mobile/models/service.dart';
import 'package:stella_stays_mobile/state/state.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

Widget searchSection(BuildContext ctx) {
  return Container(
    color: Colors.white,
    child: Stack(children: [
      //TODO: Try to replicate the gradient in the design.
      //Tried to use RadialGradient to get the gradient effect but I wasn't
      //able to replicate it.

      // Temp fix:
      Image.asset(
        "assets/background.png",
        fit: BoxFit.cover,
        width: double.infinity,
        height: 560.h,
      ),
      Container(
        height: 560.h,
        decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.25),
                Colors.black.withOpacity(0.25),
              ],
            )),
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

Widget exploreSection(BuildContext ctx) {
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
        Provider.of<AppState>(ctx, listen: true).loadingData
            ? SizedBox(
                height: 250.h,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, i) => const PropertySkeletonCard()),
              )
            : Provider.of<AppState>(ctx, listen: false).properties.isNotEmpty
                ? SizedBox(
                    height: 250.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Provider.of<AppState>(ctx, listen: false)
                          .properties
                          .length,
                      itemBuilder: (ctx, i) => PropertyCard(
                          property: Provider.of<AppState>(ctx, listen: false)
                              .properties[i]),
                    ),
                  )
                : SizedBox(
                    height: 125.h,
                    child: Center(
                        child: Text(
                      "No properties found",
                      style: TextStyle(fontSize: 14.sp),
                    )),
                  ),
      ],
    ),
  );
}

List<Widget> convertServicesToWidgets(BuildContext ctx) {
  Map<String, Iterable<Service>> services =
      Provider.of<AppState>(ctx, listen: false).filteredServices;
  List<Widget> widgets = [];
  //TODO: Sort map before adding to widget.
  if (services.isNotEmpty) {
    services.forEach((key, value) {
      widgets.add(ServiceTile(serviceCity: key, serviceList: value.toList()));
    });
  } else {
    widgets.add(
      Text(services.length.toString()),
    );
    widgets.add(SizedBox(
      height: 50.h,
      child: Center(
          child: Text(
        "No services found",
        style: TextStyle(fontSize: 14.sp),
      )),
    ));
  }

  return widgets;
}

Widget servicesSection(BuildContext ctx) {
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
        Provider.of<AppState>(ctx, listen: false).loadingData
            ? const ServiceSkeletonTile()
            : Column(
                children: convertServicesToWidgets(ctx),
              )
      ],
    ),
  );
}

class _HomePageState extends State<HomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  loadData() async {
    await Provider.of<AppState>(context, listen: false).loadData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        bottomNavigationBar: CupertinoTabBar(
          currentIndex: _currentIndex,
          backgroundColor: Colors.white,
          border: const Border(top: BorderSide(color: Color(0xFFDEE4E7))),
          activeColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 7.0.h),
                  child: Image.asset(
                    "assets/book.png",
                    color:
                        _currentIndex == 0 ? Constants.mainColor : Colors.grey,
                    height: 18.h,
                  ),
                ),
                label: "Book",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 7.0.h),
                  child: Image.asset(
                    "assets/my-stays.png",
                    color:
                        _currentIndex == 1 ? Constants.mainColor : Colors.grey,
                    height: 18.h,
                  ),
                ),
                label: "My stays",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 7.0.h),
                  child: Image.asset(
                    "assets/explore.png",
                    color:
                        _currentIndex == 2 ? Constants.mainColor : Colors.grey,
                    height: 18.h,
                  ),
                ),
                label: "Explore",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 7.0.h),
                  child: Image.asset(
                    "assets/inbox.png",
                    color:
                        _currentIndex == 3 ? Constants.mainColor : Colors.grey,
                    height: 18.h,
                  ),
                ),
                label: "Inbox",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 7.0.h),
                  child: Icon(
                    Icons.supervised_user_circle_outlined,
                    color:
                        _currentIndex == 4 ? Constants.mainColor : Colors.grey,
                    size: 25,
                  ),
                ),
                label: "Profile",
                backgroundColor: Colors.white),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchSection(context),
              Container(
                color: Colors.white,
                height: 45.h,
              ),
              exploreSection(context),
              servicesSection(context)
            ],
          ),
        ),
      ),
    );
  }
}
