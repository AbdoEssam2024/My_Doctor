import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/controller/home_controller.dart';
import 'package:my_doctor/repo/const_data/home_overview_data.dart';
import 'package:my_doctor/view/core_widgets/dashed_divider.dart';

class OverViewSection extends StatelessWidget {
  final HomeController homeController;
  const OverViewSection({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.screenWidth,
      margin: EdgeInsets.only(
        bottom: ScreenSize.screenHeight! * 0.01,
        top: ScreenSize.screenHeight! * 0.02,
      ),
      decoration: BoxDecoration(color: AppColors.blueColor.withAlpha(50)),
      padding: EdgeInsets.symmetric(vertical: ScreenSize.screenHeight! * 0.02),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: ScreenSize.screenHeight! * 0.11,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder:
                  (context, index) => _customTimesOverViewCard(
                    date: timesOverViewData[index].date,
                    day: timesOverViewData[index].day.substring(0, 3),
                    backGtoundColor:
                        timesOverViewData[index].available
                            ? AppColors.blueColor.withAlpha(50)
                            : AppColors.whiteColor,
                  ),
              itemCount: timesOverViewData.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),

          Column(
            children: [
              SizedBox(
                height: ScreenSize.screenHeight! * 0.27,
                child: PageView.builder(
                  controller: homeController.overViewpageController,
                  onPageChanged: (value) {
                    homeController.onPageChangedFunction(
                      value: value,
                      currentPage: homeController.overViewCurrentIndex,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) => customAvailableDoctors(
                        index: index,
                        homeController: homeController,
                      ),
                  itemCount: availaibleDoctorsData.length,
                ),
              ),

              _customIndicators(),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _customIndicators() => GetBuilder<HomeController>(
  builder:
      (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: ScreenSize.screenWidth! * 0.03,
        children: [
          ...List.generate(
            availaibleDoctorsData.length,
            (index) => GestureDetector(
              onTap: () => controller.overViewNextPage(index: index),
              child: AnimatedContainer(
                margin: EdgeInsets.only(top: ScreenSize.screenHeight! * 0.02),
                duration: Duration(milliseconds: 900),
                width:
                    controller.overViewCurrentIndex == index
                        ? ScreenSize.screenWidth! * 0.09
                        : ScreenSize.screenWidth! * 0.02,
                height: ScreenSize.screenHeight! * 0.01,
                decoration: BoxDecoration(
                  color:
                      controller.overViewCurrentIndex == index
                          ? AppColors.blueColor
                          : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
);

Widget _customTimesOverViewCard({
  required String date,
  required String day,

  Color backGtoundColor = Colors.white,
}) {
  return Container(
    width: ScreenSize.screenWidth! * 0.15,
    decoration: BoxDecoration(
      color: backGtoundColor,
      borderRadius: BorderRadius.circular(40),
    ),
    margin: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth! * 0.02),
    padding: EdgeInsets.all(ScreenSize.screenWidth! * 0.01),
    height: ScreenSize.screenHeight! * 0.08,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(date, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),

        Text(day, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
      ],
    ),
  );
}

Widget customAvailableDoctors({
  required int index,
  required HomeController homeController,
}) {
  return Card(
    margin: EdgeInsets.only(
      top: ScreenSize.screenHeight! * 0.02,
      right: ScreenSize.screenWidth! * 0.02,
      left: ScreenSize.screenWidth! * 0.02,
    ),
    child: Container(
      width: ScreenSize.screenWidth! * 0.95,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        // spacing: ScreenSize.screenHeight! * 0.02,
        children: [
          Container(
            padding: EdgeInsets.only(
              right: ScreenSize.screenWidth! * 0.03,
              left: ScreenSize.screenWidth! * 0.03,
              top: ScreenSize.screenHeight! * 0.01,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('dd : MMM : yyyy').format(DateTime.now()),
                  style: TextStyle(
                    color: AppColors.blueColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Obx(
                  () => Text(
                    DateFormat('hh:mm a').format(homeController.timeNow.value),
                    style: TextStyle(
                      color: AppColors.blueColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Divider(
              thickness: 2,
              color: AppColors.blueColor,
              indent: ScreenSize.screenWidth! * 0.03,
              endIndent: ScreenSize.screenWidth! * 0.03,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              right: ScreenSize.screenWidth! * 0.03,
              left: ScreenSize.screenWidth! * 0.03,
              bottom: ScreenSize.screenHeight! * 0.01,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      homeController.handlingTimeView(
                        time: availaibleDoctorsData[index].startTime,
                        isBeforeStart: true,
                      ),
                      style: TextStyle(
                        color: AppColors.blueColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(
                      child: DashedDivider(
                        color: AppColors.blueColor,
                        dashWidth: 5,
                        height: 2,
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Column(
                      spacing: ScreenSize.screenHeight! * 0.015,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          homeController.handlingTimeView(
                            time: availaibleDoctorsData[index].startTime,
                          ),
                          style: TextStyle(
                            color: AppColors.blueColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          homeController.handlingTimeView(
                            time: availaibleDoctorsData[index].endTime,
                          ),
                          style: TextStyle(
                            color: AppColors.blueColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    Card(
                      color: AppColors.lightBlueColor,
                      margin: EdgeInsets.only(
                        left: ScreenSize.screenWidth! * 0.02,
                        top: ScreenSize.screenHeight! * 0.01,
                        bottom: ScreenSize.screenHeight! * 0.01,
                      ),
                      child: Container(
                        width: ScreenSize.screenWidth! * 0.73,
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenSize.screenWidth! * 0.02,
                          vertical: ScreenSize.screenHeight! * 0.01,
                        ),
                        child: Column(
                          spacing: ScreenSize.screenHeight! * 0.01,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  availaibleDoctorsData[index].name,
                                  style: TextStyle(
                                    color: AppColors.blueColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                Row(
                                  spacing: ScreenSize.screenWidth! * 0.02,
                                  children: [
                                    GestureDetector(
                                      child: Icon(
                                        Icons.check_circle_outline,
                                        color: AppColors.blueColor,
                                      ),
                                    ),
                                    GestureDetector(
                                      child: Icon(
                                        Icons.close_outlined,
                                        color: AppColors.blueColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Text(
                              availaibleDoctorsData[index].specialization,
                              style: TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Text(
                      homeController.handlingTimeView(
                        time: availaibleDoctorsData[index].endTime,
                        isAfterEnd: true,
                      ),
                      style: TextStyle(
                        color: AppColors.blueColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(
                      child: DashedDivider(
                        color: AppColors.blueColor,
                        dashWidth: 5,
                        height: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Add your appointment list here
        ],
      ),
    ),
  );
}
