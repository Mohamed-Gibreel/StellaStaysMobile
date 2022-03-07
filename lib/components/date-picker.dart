import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stella_stays_mobile/constants.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePicker extends StatefulWidget {
  final PickerDateRange? selectedDateRange;
  const DatePicker({Key? key, this.selectedDateRange}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late DateRangePickerController dateRangePickerController;
  int activeIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    dateRangePickerController = DateRangePickerController();
    _tabController.animation?.addListener(() {
      setState(() {
        activeIndex = (_tabController.animation?.value)?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 40.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(),
          Text(
            "When you will stay?",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
          ),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.close))
        ],
      ),
      SizedBox(
        height: 20.h,
      ),
      TabBar(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        labelColor: Colors.black,
        indicator: BoxDecoration(
            color: Constants.mainColor,
            borderRadius: BorderRadius.circular(50.r)),
        indicatorSize: TabBarIndicatorSize.tab,
        isScrollable: true,
        indicatorColor: Colors.transparent,
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        tabs: [
          SizedBox(
            width: 70.w,
            child: Tab(
              iconMargin: EdgeInsets.zero,
              child: Text(
                "Calendar",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: activeIndex == 0 ? Colors.white : Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            width: 70.w,
            child: Tab(
              iconMargin: EdgeInsets.zero,
              child: Text(
                "Flexible",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: activeIndex == 1 ? Colors.white : Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      Expanded(
        child: TabBarView(controller: _tabController, children: [
          Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        width: 1.0, color: Colors.black.withOpacity(.3)),
                    bottom: BorderSide(
                        width: 1.0, color: Colors.black.withOpacity(.3)),
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("Su"),
                      Text("Mo"),
                      Text("Tu"),
                      Text("We"),
                      Text("Th"),
                      Text("Fr"),
                      Text("Sa"),
                    ]),
              ),
              //Sync fusion calendar here
              Expanded(
                child: SfDateRangePicker(
                  controller: dateRangePickerController,
                  rangeSelectionColor: Colors.black.withOpacity(.1),
                  selectionColor: Constants.mainColor,
                  toggleDaySelection: false,
                  initialSelectedRange: widget.selectedDateRange,
                  allowViewNavigation: false,
                  todayHighlightColor: Constants.mainColor,
                  headerStyle: const DateRangePickerHeaderStyle(
                      textAlign: TextAlign.center),
                  monthViewSettings: const DateRangePickerMonthViewSettings(
                    viewHeaderHeight: 0,
                    enableSwipeSelection: false,
                    showTrailingAndLeadingDates: false,
                  ),
                  endRangeSelectionColor: Constants.mainColor,
                  startRangeSelectionColor: Constants.mainColor,
                  selectionMode: DateRangePickerSelectionMode.range,
                  view: DateRangePickerView.month,
                  enableMultiView: false,
                  navigationDirection:
                      DateRangePickerNavigationDirection.vertical,
                ),
              ),
              SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              dateRangePickerController.selectedRange = null;
                            });
                          },
                          child: Text(
                            "Clear",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          )),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pop(dateRangePickerController.selectedRange);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 15.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            color: Constants.mainColor,
                          ),
                          child: Text(
                            "Apply Date",
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          const Center(
            child: Text("Coming soon :)"),
          ),
        ]),
      ),
    ]);
  }
}
