import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:stella_stays_mobile/components/custom-dropdown/drop_down_button.dart';
import 'package:stella_stays_mobile/components/date-picker.dart';
import 'package:stella_stays_mobile/constants.dart';
import 'package:stella_stays_mobile/state/state.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  int numberOfGuests = 0;
  String dropdownValue = "";
  String? selectedCity;
  DateTime? startDate;
  DateTime? endDate;
  PickerDateRange? oldSelectedRange;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Column(
                    //   children: Provider.of<AppState>(context, listen: true)
                    //       .cities
                    //       .map((e) => Text(e.toString()))
                    //       .toList(),
                    // ),
                    DropdownButton2<String>(
                      isDense: true,
                      hint: Text(
                        "Select a city",
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.black.withOpacity(.9)),
                      ),
                      iconSize: 0,
                      value: selectedCity,
                      isExpanded: true,
                      style: TextStyle(fontSize: 13.sp, color: Colors.black),
                      itemPadding: EdgeInsets.symmetric(horizontal: 5.w),
                      itemHeight: 45.h,
                      dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r)),
                      dropdownPadding: EdgeInsets.symmetric(vertical: 5.h),
                      buttonHeight: 25.h,
                      selectedItemBuilder: (BuildContext context) =>
                          Provider.of<AppState>(context, listen: true)
                              .cities
                              .map((e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(e)),
                                  ))
                              .toList(),
                      underline: Container(),
                      // borderRadius: BorderRadius.circular(10.r),
                      items: <String>[
                        ...Provider.of<AppState>(context, listen: true).cities
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          key: UniqueKey(),
                          value: value.toString(),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: selectedCity == value
                                      ? Constants.mainColor
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10.r)),
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: selectedCity == value
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              )),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value ?? "";
                        });
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
                Divider(
                  height: 0.h,
                  color: Colors.black.withOpacity(.3),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: (() async {
                    PickerDateRange? selectedRange =
                        await showBarModalBottomSheet(
                            topControl: const SizedBox(),
                            context: context,
                            clipBehavior: Clip.none,
                            builder: (BuildContext ctx) => DatePicker(
                                  selectedDateRange: oldSelectedRange,
                                ));

                    if (selectedRange != null &&
                        selectedRange.startDate != null &&
                        selectedRange.endDate != null) {
                      setState(() {
                        oldSelectedRange = selectedRange;
                        startDate = selectedRange.startDate!;
                        endDate = selectedRange.endDate!;
                      });
                    } else {
                      setState(() {
                        startDate = null;
                        endDate = null;
                        oldSelectedRange = null;
                      });
                    }
                  }),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        Text(
                          startDate != null && endDate != null
                              ? "${DateFormat.yMMMd().format(startDate!)} - ${DateFormat.yMMMd().format(endDate!)}"
                              : "Select dates",
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 0.h,
                  color: Colors.black.withOpacity(.3),
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
                          numberOfGuests > 0
                              ? numberOfGuests == 1
                                  ? "${numberOfGuests.toString()} guest"
                                  : "${numberOfGuests.toString()} guests"
                              : "Add Guests",
                          style: TextStyle(
                              fontSize: 14.sp, color: const Color(0xFF4B5154)),
                        )
                      ],
                    ),
                    Container(
                      // width: 95.w,
                      // height: 45.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.w, color: Constants.mainColor),
                          borderRadius: BorderRadius.circular(36.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              //TODO: Decrement counter
                              if (numberOfGuests > 1) {
                                setState(() {
                                  numberOfGuests--;
                                });
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 10.h),
                              // color: Colors.red,
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 10.h),
                                  child: Icon(
                                    Icons.minimize,
                                    size: 15.w,
                                  )),
                            ),
                          ),
                          // SizedBox(
                          //   width: 10.w,
                          // ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                numberOfGuests++;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 10.h),
                              child: Icon(
                                Icons.add,
                                size: 15.w,
                              ),
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
