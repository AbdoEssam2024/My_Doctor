import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/controller/home_controller.dart';
import 'package:my_doctor/view/core_widgets/handling_view.dart';
import 'package:my_doctor/view/screen/home_screen/widgets/custom_bottom_bar.dart';
import 'package:my_doctor/view/screen/home_screen/widgets/main_header.dart';
import 'package:my_doctor/view/screen/home_screen/widgets/overview_section.dart';
import 'package:my_doctor/view/screen/home_screen/widgets/custom_app_bar.dart';
import 'package:my_doctor/view/screen/home_screen/widgets/top_rating_doctors.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /// A stateless widget that represents the home page of the application.
  ///
  /// This widget initializes the screen size and the home controller,
  /// and builds the main structure of the home page, including a header
  /// and a search bar. It uses the `HandlingView` widget to manage the
  /// request state and display the appropriate content.
  ///
  /// The home page is wrapped in a `SafeArea` and a `SingleChildScrollView`
  /// to ensure proper layout and scrolling behavior. The background color
  /// is set to a light blue color defined in `AppColors`.
  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    final homeController = Get.put(HomeController());
    return Scaffold(
      bottomNavigationBar: customBottomNavigationBar(
        navigationFunction: (index) {
          // handle Navigation
        },
      ),
      backgroundColor: AppColors.lightBlueColor,
      body: SuperScaffold(
        transitionBetweenRoutes: true,
        appBar: buildSearchBar(
          searchController: homeController.searchController,
          searchFunction: (value) {
            // Handle search value change
          },
          goToDoctorsPage: () {
            // Handle Got To doctors
          },
          goToFavouritePage: () {
            // Handle Go To favourite
          },
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Obx(
              () => HandlingView(
                requestState: homeController.requestState.value,
                widget: Column(
                  children: [
                    MainHeader(
                      userName:
                          homeController.userData[0]!.userName
                              .toString()
                              .capitalizeFirst!,
                      profileTapFunction: () {
                        // Handle profile tap
                      },
                      notificationsFunction: () {
                        // Handle notifications
                      },
                      settingsFunction: () {
                        // Handle settings
                      },
                    ),

                    OverViewSection(homeController: homeController),

                    TopRatingDoctors(
                      homeController: homeController,
                      addToFavouriteFunction: () {
                        // Handle add to favourite
                      },

                      reviewDoctorFunction: () {
                        // Handle review doctor
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
