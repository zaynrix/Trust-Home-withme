import 'package:booking_calendar/booking_calendar.dart';
import 'package:final_project/core/app_colors/app_colors.dart';
import 'package:final_project/core/app_sizes/app_sizes.dart';
import 'package:final_project/core/app_texts/app_texts.dart';
import 'package:final_project/features/booking_feature/presentation/controllers/booking_controller.dart';
import 'package:final_project/features/on_boarding_feature/widgets/on_boarding_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_neat_and_clean_calendar/neat_and_clean_calendar_event.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../../../core/app_images/app_images.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  BookingController controller=  Get.put<BookingController>(BookingController());

  int selected = -1;
  bool isBook=false;

  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime(2019, 2, 3));
  DateTime _targetDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: AppColors.primaryColor,
      onDayPressed: (date, events) {
        setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },
      daysHaveCircularBorder: false,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      // thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
//      firstDayOfWeek: 4,
      // markedDatesMap: _markedDateMap,
      height: 380.0.h,
      weekdayTextStyle: context.theme.textTheme.headline6,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
          const CircleBorder(side: BorderSide(color: AppColors.primaryColor)),
      markedDateCustomTextStyle: context.theme.textTheme.headline5,
      showHeader: true,
      headerTextStyle: context.theme.textTheme.headline5?.copyWith(
        fontSize: AppSizes.fontSize24,
        fontWeight: FontWeight.w500,
      ),
      iconColor: AppColors.primaryColor,
      todayTextStyle: const TextStyle(
        color: AppColors.primaryColor,
      ),

      todayButtonColor: AppColors.backgroundColor,
      selectedDayButtonColor: AppColors.primaryColor,
      selectedDayBorderColor: AppColors.primaryColor,
      selectedDayTextStyle: const TextStyle(
        color: AppColors.headLine2Color,
      ),
      minSelectedDate: _currentDate.subtract(const Duration(days: 360)),
      maxSelectedDate: _currentDate.add(const Duration(days: 360)),
      prevDaysTextStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.headLine3Color,
      ),
      inactiveDaysTextStyle: TextStyle(
        color: AppColors.headLine3Color,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );
    return Scaffold(
        appBar: AppBar(
          title: Text(AppTexts.bookAppointment.tr),
          backgroundColor: context.theme.scaffoldBackgroundColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.padding20.h.w),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      AppTexts.selectAppointment,
                      style: context.theme.textTheme.headline6,
                    ),
                    SizedBox(
                      height: AppSizes.padding20.h,
                    ),
                    Card(
                      color: Colors.white,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: AppSizes.fontSize18.w),
                        child: _calendarCarouselNoHeader,
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.padding20.h,
                    ),
                    Text(
                      AppTexts.availableAppointment.tr,
                      style: context.theme.textTheme.headline6,
                    ),
                    SizedBox(
                      height: AppSizes.padding20.h,
                    ),
                    Container(
                      // height: 170.h,
                      width: double.infinity,
                      child: Center(
                        child: Card(
                          color: AppColors.headLine2Color,
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 6,
                            children: List.generate(
                                12,
                                (index) => Center(
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            selected = index;
                                            controller.selectedTime=controller.times[selected];
                                          });
                                        },
                                        child: Container(
                                            color: selected == index
                                                ? AppColors.primaryColor
                                                : AppColors.headLine2Color,
                                            child: Text(
                                             controller.times[index],
                                              textAlign: TextAlign.center,
                                              style: selected == index
                                                  ? context
                                                      .theme.textTheme.headline2
                                                  : context
                                                      .theme.textTheme.headline6,
                                            )),
                                      ),
                                    )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.padding20.h,
                    ),
                    CustomBoardingBtn(
                        color: AppColors.primaryColor,
                        onPressed: (){

                          Get.dialog(Center(
                            child: Container(
                              margin: EdgeInsets.all(AppSizes.padding20.h.w),
                              padding: EdgeInsets.all(AppSizes.padding20.h.w),
                              height: AppSizes.height478.h,
                              width: AppSizes.screenWidth - 20.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(AppSizes.radius12.r)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AppImages.readyImage,
                                    height: AppSizes.height189,
                                    width: AppSizes.height189,
                                  ),
                                  Text(
                                    AppTexts.bookingConfirmed.tr,
                                    style: context.theme.textTheme.headline1,
                                  ),
                                  Text(
                                    AppTexts.bookingConfirmedSen.tr+' '+controller.selectedTime+' '+'في'+' '+DateFormat.yMd().format(_currentDate2),
                                    style: context.theme.textTheme.headline4,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ));

                        },textStyle: context.theme.textTheme.headline2!,
                        title: AppTexts.bookNow,
                        ),
                    SizedBox(
                      height: AppSizes.padding20.h,
                    ),
                  ],
                ),

              ],
            ),
          ),
        ));
  }
}
