import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/controller/home_controller.dart';
import 'package:my_doctor/repo/const_data/home_overview_data.dart';

class TopRatingDoctors extends StatelessWidget {
  final void Function() addToFavouriteFunction;
  final void Function() reviewDoctorFunction;
  final HomeController homeController;

  const TopRatingDoctors({
    super.key,
    required this.addToFavouriteFunction,
    required this.reviewDoctorFunction,
    required this.homeController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSize.screenWidth! * 0.98,
      height: ScreenSize.screenHeight! * 0.2,
      child: CarouselSlider.builder(
        itemBuilder:
            (context, index, realIndex) => topRatingDoctorsCard(
              index: index,
              addToFavouriteFunction: addToFavouriteFunction,
              reviewFunction: reviewDoctorFunction,
            ),
        itemCount: topRatingDoctorsData.length,

        options: CarouselOptions(
          reverse: false,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlay: true,
          autoPlayAnimationDuration: Duration(milliseconds: 500),
          autoPlayCurve: Curves.easeInOut,
          pauseAutoPlayOnManualNavigate: true,
          viewportFraction: 1,
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
  return Card(
    color: AppColors.lightBlueColor.withAlpha(100),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenSize.screenWidth! * 0.01,
        vertical: ScreenSize.screenHeight! * 0.02,
      ),
      child: ListTile(
        // contentPadding: EdgeInsets.symmetric(
        //   horizontal: ScreenSize.screenWidth! * 0.01,
        // ),
        leading: _buildDoctorImage(index: index),
        minLeadingWidth: ScreenSize.screenWidth! * 0.1,
        title: Column(
          spacing: ScreenSize.screenHeight! * 0.005,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDoctorInfo(index: index),
            _buildActionButtons(
              addToFavouriteFunction: addToFavouriteFunction,
              reviewFunction: reviewFunction,
              index: index,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildDoctorImage({required int index}) {
  final doctor = topRatingDoctorsData[index];
  return Container(
    decoration: BoxDecoration(
      color: AppColors.redColor,
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
    child: ClipRRect(
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        doctor.imagePath,
        filterQuality: FilterQuality.high,
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget _buildDoctorInfo({required int index}) {
  final doctor = topRatingDoctorsData[index];
  return Card(
    margin: EdgeInsets.symmetric(
      // horizontal: ScreenSize.screenWidth! * 0.03,
      vertical: ScreenSize.screenHeight! * 0.003,
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: ScreenSize.screenHeight! * 0.012,
        horizontal: ScreenSize.screenWidth! * 0.02,
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
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.clip,
                ),
              ),
              Text(
                doctor.specialization,
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildActionButtons({
  required void Function() addToFavouriteFunction,
  required void Function() reviewFunction,
  required int index,
}) {
  final doctor = topRatingDoctorsData[index];
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        onTap: reviewFunction,
        child: _buildActionButton(
          icon: Icons.star_border_outlined,
          label: doctor.rating,
          onTap: reviewFunction,
        ),
      ),
      GestureDetector(
        onTap: addToFavouriteFunction,
        child: _buildActionButton(
          icon: doctor.isFavourite ? Icons.favorite : Icons.favorite_border,
          onTap: addToFavouriteFunction,
        ),
      ),
    ],
  );
}

Widget _buildActionButton({
  required IconData icon,
  String? label,
  required void Function() onTap,
}) {
  return Container(
    margin: EdgeInsets.symmetric(
      // horizontal: ScreenSize.screenWidth! * 0.03,
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
        Icon(icon, color: AppColors.blueColor),
        if (label != null)
          Text(
            label,
            style: TextStyle(
              color: AppColors.blueColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    ),
  );
}
