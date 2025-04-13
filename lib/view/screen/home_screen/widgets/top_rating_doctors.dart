import 'package:flutter/material.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/repo/const_data/home_overview_data.dart';

class TopRatingDoctors extends StatelessWidget {
  final void Function() addToFavouriteFunction;
  final void Function() reviewDoctorFunction;
  const TopRatingDoctors({
    super.key,
    required this.addToFavouriteFunction,
    required this.reviewDoctorFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: ScreenSize.screenWidth! * 0.02,
        right: ScreenSize.screenWidth! * 0.02,
      ),

      height: ScreenSize.screenHeight! * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topRatingDoctorsData.length,
        itemBuilder:
            (context, index) => topRatingDoctorsCard(
              index: index,
              addToFavouriteFunction: addToFavouriteFunction,
              reviewFunction: reviewDoctorFunction,
            ),
      ),
    );
  }
}

Widget topRatingDoctorsCard({
  required int index,
  required void Function() addToFavouriteFunction,
  required void Function() reviewFunction,
}) {
  final doctor = topRatingDoctorsData[index];
  return Card(
    color: AppColors.lightBlueColor.withAlpha(100),
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: ScreenSize.screenHeight! * 0.01,
        horizontal: ScreenSize.screenWidth! * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.mediumBlueColor,
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                width: ScreenSize.screenWidth! * 0.2,
                child: ClipRRect(
                  child: Image.asset(
                    doctor.imagePath,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            width: ScreenSize.screenWidth! * 0.69,
            child: Column(
              spacing: ScreenSize.screenHeight! * 0.01,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: ScreenSize.screenWidth! * 0.03,
                    vertical: ScreenSize.screenHeight! * 0.003,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: ScreenSize.screenHeight! * 0.012,
                      horizontal: ScreenSize.screenWidth! * 0.03,
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctor.name,
                              style: TextStyle(
                                color: AppColors.blueColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              doctor.specialization,
                              style: TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: reviewFunction,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: ScreenSize.screenWidth! * 0.03,
                          vertical: ScreenSize.screenHeight! * 0.01,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: ScreenSize.screenHeight! * 0.005,
                          horizontal: ScreenSize.screenWidth! * 0.03,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star_border_outlined,
                              color: AppColors.blueColor,
                            ),

                            Text(
                              doctor.rating,
                              style: TextStyle(
                                color: AppColors.blueColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: addToFavouriteFunction,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: ScreenSize.screenWidth! * 0.03,
                          vertical: ScreenSize.screenHeight! * 0.01,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: ScreenSize.screenHeight! * 0.005,
                          horizontal: ScreenSize.screenWidth! * 0.015,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              doctor.isFavourite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: AppColors.blueColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
