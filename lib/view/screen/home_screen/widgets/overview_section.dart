import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:my_doctor/const/app_theme/app_theme.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/controller/home_controller.dart';
import 'package:my_doctor/controller/theme_controller.dart';
import 'package:my_doctor/repo/const_data/home_overview_data.dart';
import 'package:my_doctor/view/core_widgets/dashed_divider.dart';

class OverViewSection extends StatelessWidget {
  final HomeController homeController;
  final ThemeController themeController;
  const OverViewSection({
    super.key,
    required this.homeController,
    required this.themeController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.screenWidth,
      margin: EdgeInsets.only(
        bottom: ScreenSize.screenHeight! * 0.01,
        top: ScreenSize.screenHeight! * 0.02,
      ),
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
                    index: index,
                    themeController: themeController,
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
                        themeController: themeController,
                        index: index,
                        homeController: homeController,
                      ),
                  itemCount: availaibleDoctorsData.length,
                ),
              ),

              _customIndicators(themeController: themeController),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _customIndicators({
  required ThemeController themeController,
}) => GetBuilder<HomeController>(
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
                          ? themeController.changeThemeColors(
                            dark: AppTheme.darkTheme.colorScheme.secondary,
                            light: AppTheme.lightTheme.colorScheme.primary,
                          )
                          : themeController.changeThemeColors(
                            dark: AppTheme.darkTheme.colorScheme.onPrimary,
                            light: AppTheme.lightTheme.colorScheme.onError,
                          ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
);

Widget _customTimesOverViewCard({
  required int index,
  required ThemeController themeController,
}) {
  return Container(
    width: ScreenSize.screenWidth! * 0.15,
    decoration: BoxDecoration(
      color: themeController.changeThemeColors(
        dark:
            timesOverViewData[index].available
                ? AppTheme.darkTheme.colorScheme.surface
                : AppTheme.darkTheme.colorScheme.primary,
        light:
            timesOverViewData[index].available
                ? AppTheme.lightTheme.colorScheme.primary
                : AppTheme.lightTheme.colorScheme.onSecondary,
      ),
      border: Border.all(
        color: themeController.changeThemeColors(
          dark: AppTheme.darkTheme.colorScheme.onPrimary,
          light: AppTheme.lightTheme.colorScheme.onSecondary,
        ),
        width: ScreenSize.screenWidth! * 0.005,
      ),
      borderRadius: BorderRadius.circular(40),
    ),
    margin: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth! * 0.02),
    padding: EdgeInsets.all(ScreenSize.screenWidth! * 0.01),
    height: ScreenSize.screenHeight! * 0.08,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          timesOverViewData[index].date,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: themeController.changeThemeColors(
              dark:
                  timesOverViewData[index].available
                      ? AppTheme.darkTheme.colorScheme.primary
                      : AppTheme.darkTheme.colorScheme.onPrimary,
              light:
                  timesOverViewData[index].available
                      ? AppTheme.lightTheme.colorScheme.onSurface
                      : AppTheme.darkTheme.scaffoldBackgroundColor,
            ),
          ),
        ),

        Text(
          timesOverViewData[index].day.substring(0, 3),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: themeController.changeThemeColors(
              dark:
                  timesOverViewData[index].available
                      ? AppTheme.darkTheme.colorScheme.primary
                      : AppTheme.darkTheme.colorScheme.onPrimary,
              light:
                  timesOverViewData[index].available
                      ? AppTheme.lightTheme.colorScheme.onSurface
                      : AppTheme.darkTheme.scaffoldBackgroundColor,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget customAvailableDoctors({
  required int index,
  required HomeController homeController,
  required ThemeController themeController,
}) {
  return Card(
    color: themeController.changeThemeColors(
      dark: AppTheme.darkTheme.scaffoldBackgroundColor,
      light: AppTheme.lightTheme.scaffoldBackgroundColor,
    ),
    margin: EdgeInsets.only(
      top: ScreenSize.screenHeight! * 0.02,
      right: ScreenSize.screenWidth! * 0.02,
      left: ScreenSize.screenWidth! * 0.02,
    ),
    child: Container(
      width: ScreenSize.screenWidth! * 0.95,
      decoration: BoxDecoration(
        color: themeController.changeThemeColors(
          dark: AppTheme.darkTheme.scaffoldBackgroundColor,
          light: AppTheme.lightTheme.colorScheme.onSecondary,
        ),

        border: Border.all(
          color: themeController.changeThemeColors(
            dark: AppTheme.darkTheme.colorScheme.onSecondary,
            light: AppTheme.lightTheme.colorScheme.onSecondary,
          ),
        ),
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
                    // color: AppColors.blueColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Obx(
                  () => Text(
                    DateFormat('hh:mm a').format(homeController.timeNow.value),
                    style: TextStyle(
                      // color: AppColors.blueColor,
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
              color: themeController.changeThemeColors(
                dark: AppTheme.darkTheme.colorScheme.onSecondary,
                light: AppTheme.darkTheme.colorScheme.primary,
              ),
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
                        // color: AppColors.blueColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(
                      child: DashedDivider(
                        color: themeController.changeThemeColors(
                          dark: AppTheme.darkTheme.colorScheme.onSecondary,
                          light: AppTheme.lightTheme.colorScheme.onPrimary,
                        ),
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
                            // color: AppColors.blueColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          homeController.handlingTimeView(
                            time: availaibleDoctorsData[index].endTime,
                          ),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    Card(
                      color: themeController.changeThemeColors(
                        dark: AppTheme.darkTheme.colorScheme.primary,
                        light: AppTheme.lightTheme.colorScheme.surface,
                      ),

                      margin: EdgeInsets.only(
                        left: ScreenSize.screenWidth! * 0.03,
                        top: ScreenSize.screenHeight! * 0.01,
                        bottom: ScreenSize.screenHeight! * 0.01,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color: themeController.changeThemeColors(
                              dark: AppTheme.darkTheme.colorScheme.onPrimary,
                              light: AppTheme.lightTheme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
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
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                Row(
                                  spacing: ScreenSize.screenWidth! * 0.02,
                                  children: [
                                    GestureDetector(
                                      child: Icon(Icons.check_circle_outline),
                                    ),
                                    GestureDetector(
                                      child: Icon(Icons.close_outlined),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Text(
                              availaibleDoctorsData[index].specialization,
                              style: TextStyle(
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
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(
                      child: DashedDivider(
                        color: themeController.changeThemeColors(
                          dark: AppTheme.darkTheme.colorScheme.onSecondary,
                          light: AppTheme.lightTheme.colorScheme.onPrimary,
                        ),
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
