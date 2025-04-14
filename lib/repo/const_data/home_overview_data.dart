import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/const/images/app_images.dart';
import 'package:my_doctor/model/home_models/overview_model.dart';
import 'package:my_doctor/view/screen/home_screen/widgets/custom_bottom_bar.dart';

List<TimesOverViewModel> timesOverViewData = [
  TimesOverViewModel(date: "9", day: "Monday", available: false),
  TimesOverViewModel(date: "10", day: "Tuesday", available: false),
  TimesOverViewModel(date: "11", day: "Wednesday", available: true),
  TimesOverViewModel(date: "12", day: "Thursday", available: false),
  TimesOverViewModel(date: "13", day: "Friday", available: true),
];

List<AvailableDoctorsModel> availaibleDoctorsData = [
  AvailableDoctorsModel(
    name: "Dr. John Doe",
    specialization: "Cardiologist",
    startTime: "10",
    endTime: "11",
  ),
  AvailableDoctorsModel(
    name: "Dr. Jane Smith",
    specialization: "Dermatologist",
    startTime: "11",
    endTime: "12",
  ),
  AvailableDoctorsModel(
    name: "Dr. Emily Johnson",
    specialization: "Pediatrician",
    startTime: "12",
    endTime: "13",
  ),
  AvailableDoctorsModel(
    name: "Dr. David Brown",
    specialization: "Neurologist",
    startTime: "13",
    endTime: "14",
  ),
  AvailableDoctorsModel(
    name: "Dr. Rachel Davis",
    specialization: "Orthopedic Specialist",
    startTime: "14",
    endTime: "15",
  ),
];

List<TopRatingDoctorsModel> topRatingDoctorsData = [
  TopRatingDoctorsModel(
    name: "Dr. Olivia Turner",
    specialization: "Dermato-Endocrinology",
    imagePath: AppImages.doctorOne,
    rating: "4.5",
    isFavourite: false,
  ),
  TopRatingDoctorsModel(
    name: "Dr. Alexander Bennett",
    specialization: "Dermato-Genetics",
    imagePath: AppImages.doctorTwo,
    rating: "4.7",
    isFavourite: true,
  ),
  TopRatingDoctorsModel(
    name: "Dr. Sophia Martinez",
    specialization: "Cosmetic Bioengineering",
    imagePath: AppImages.doctorThree,
    rating: "4.8",
    isFavourite: false,
  ),

  TopRatingDoctorsModel(
    name: "Dr. Michael Davidson",
    specialization: "Nano-Dermatology",
    imagePath: AppImages.doctorFour,
    rating: "4.6",
    isFavourite: true,
  ),
];

List<TabItem> bottomBarItems = [
  TabItem(icon: BottomBarItems(icon: Icons.home), isIconBlend: true),
  TabItem(
    icon: BottomBarItems(icon: Icons.messenger_outline_outlined),
    isIconBlend: true,
  ),
  TabItem(icon: BottomBarItems(icon: Icons.person_pin), isIconBlend: true),
  TabItem(
    icon: BottomBarItems(icon: Icons.calendar_month_outlined),
    isIconBlend: true,
  ),
];
