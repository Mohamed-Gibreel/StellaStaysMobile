import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stella_stays_mobile/constants.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      width: 335.w,
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 5,
          )
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
                          borderSide: BorderSide(
                              width: 0.w, color: Constants.mainColor)),
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
                          borderSide: BorderSide(
                              width: 0.w, color: Constants.mainColor)),
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
                          border: Border.all(
                              width: 0.w, color: Constants.mainColor),
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
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
}
