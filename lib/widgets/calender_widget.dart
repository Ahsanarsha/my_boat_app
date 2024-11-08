import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/utils/scalling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.cE7E7E7, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(14.w)),
      ),
      child: CalendarCarousel<Event>(
        onDayPressed: (DateTime date, List<Event> events) {},
        weekendTextStyle:
            regularTextStyle(fontSize: 10, color: AppColors.c1D2739),
        daysTextStyle: regularTextStyle(fontSize: 10, color: AppColors.c1D2739),
        weekdayTextStyle:
            regularTextStyle(fontSize: 12, color: AppColors.c1D2739),
        nextDaysTextStyle:
            regularTextStyle(fontSize: 10, color: AppColors.c98A2B3),
        prevDaysTextStyle:
            regularTextStyle(fontSize: 10, color: AppColors.c98A2B3),
        headerTextStyle:
            semiBoldTextStyle(color: AppColors.c344054, fontSize: 16),
        selectedDayTextStyle:
            boldTextStyle(fontSize: 12, color: AppColors.white),
        todayTextStyle:
            regularTextStyle(fontSize: 10, color: AppColors.c1D2739),
        todayButtonColor: Colors.transparent,
        thisMonthDayBorderColor: Colors.transparent,
        todayBorderColor: Colors.transparent,
        selectedDayBorderColor: Colors.transparent,
        iconColor: AppColors.c667185,
        customDayBuilder: (
          bool isSelectable,
          int index,
          bool isSelectedDay,
          bool isToday,
          bool isPrevMonthDay,
          TextStyle textStyle,
          bool isNextMonthDay,
          bool isThisMonthDay,
          DateTime day,
        ) {
          if (day.day == 15 || day.day == 10 || day.day == 23) {
            return Center(
              child: CircleAvatar(
                backgroundColor: AppColors.c81909D,
                child: Text(
                  'X',
                  style: boldTextStyle(color: AppColors.white, fontSize: 10),
                ),
              ),
            );
          } else {
            return null;
          }
        },
        height: 450.h,
        selectedDateTime: DateTime.now(),
        daysHaveCircularBorder: true,
      ),
    );
  }
}
