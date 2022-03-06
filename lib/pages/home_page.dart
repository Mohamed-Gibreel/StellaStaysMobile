import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stella_stays_mobile/components/property_card.dart';
import 'package:stella_stays_mobile/components/property_skeleton_card.dart';
import 'package:stella_stays_mobile/components/search_bar.dart';
import 'package:stella_stays_mobile/components/service_skeleton_tile.dart';
import 'package:stella_stays_mobile/components/service_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
            : SizedBox(
                height: 250.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (ctx, i) => const PropertyCard(
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

List<Widget> convertServicesToWidgets(BuildContext ctx) {
  Map<String, Iterable<Service>> services =
      Provider.of<AppState>(ctx, listen: false).filteredServices;
  List<Widget> widgets = [];
  //TODO: Sort map before adding to widget.
  services.forEach((key, value) {
    widgets.add(ServiceTile(serviceCity: key, serviceList: value.toList()));
  });

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

  @override
  void initState() {
    super.initState();
    // getData();
    getServicesFromFirebase();
  }

  getData() async {
    await Provider.of<AppState>(context, listen: false).loadData();
  }

  void getServicesFromFirebase() async {
    CollectionReference services = firestore.collection('services');
    debugPrint('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-');
    print(await services.get());
    debugPrint('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-');
  }

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
