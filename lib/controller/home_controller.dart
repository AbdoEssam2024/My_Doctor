import 'dart:async';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_doctor/main.dart';
import 'package:my_doctor/model/user_data_model.dart';
import 'package:my_doctor/repo/const_data/home_overview_data.dart';
import '../const/class/internet_service.dart';
import '../const/class/request_state.dart';

class HomeController extends GetxController {
  List userData = [];
  late TextEditingController searchController;
  late PageController overViewpageController;
  late PageController topRatingpageController;
  int overViewCurrentIndex = 0;
  int topRatingDoctorsCurrentIndex = 0;
  Rx<RequestState> requestState = RequestState.none.obs;
  Rx<DateTime> timeNow = DateTime.now().obs;
  late NotchBottomBarController notchBottomBarController;

  /// A controller for managing user data and network state in the application.
  ///
  /// The `HomeController` class extends `GetxController` and is responsible for:
  /// - Fetching and parsing user data from a local storage.
  /// - Listening to network state changes and updating the request state accordingly.
  /// - Initializing and disposing of text editing controllers.
  /// - Initializing and disposing of the `userDataBox` for storing user data.

  /// - `getUserdata()`: Retrieves and parses user data from local storage.
  getUserdata() {
    try {
      List data = [];
      var rawData = userDataBox.get("userData");
      if (rawData != null) {
        data.add(rawData);
        userData =
            data
                .map((user) {
                  try {
                    return UserDataModel.fromJson(
                      Map<String, dynamic>.from(user),
                    );
                  } catch (e) {
                    return null;
                  }
                })
                .where((user) => user != null)
                .toList();
      } else {
        return;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// - `listenToNetworkChanges()`: Listens to network state changes and updates the request state.
  listenToNetworkChanges() {
    ever(InternetService.requestState, (state) {
      requestState.value = state;
    });
    requestState.value = InternetService.requestState.value;
  }

  /// - `initActions()`: Initializes necessary actions and controllers.
  initActions() {
    searchController = TextEditingController();
    overViewpageController = PageController();
    topRatingpageController = PageController();
    notchBottomBarController = NotchBottomBarController();
    listenToNetworkChanges();
  }

  /// Updates the current index with the given value and triggers a UI update.
  ///
  /// This function is typically used as a callback for page change events
  /// to keep track of the current page index and refresh the UI accordingly.
  ///
  /// [value] The new index value to be set as the current index.
  onPageChangedFunction({required int value, required currentPage}) {
    overViewCurrentIndex = value;
    update();
  }

  /// Navigates to the next view in the page controller based on the given index.
  ///
  /// Updates the `currentIndex` to the provided [index] and animates the
  /// `pageController` to the new page if the index is within the bounds of
  /// `availaibleDoctorsData`. The animation duration is set to 500 milliseconds
  /// with an ease-in-out curve.
  ///
  /// [index]: The index of the next view to navigate to.
  overViewNextPage({required int index}) {
    overViewCurrentIndex = index;
    if (overViewCurrentIndex < availaibleDoctorsData.length) {
      if (overViewpageController.hasClients) {
        overViewpageController.animateToPage(
          overViewCurrentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
    update();
  }

  /// - `handlingTimeView()`: Adjusts and formats time for display.
  String handlingTimeView({
    required String time,
    bool isBeforeStart = false,
    bool isAfterEnd = false,
  }) {
    int hour = int.parse(time);
    if (isBeforeStart) {
      hour -= 1;
    } else if (isAfterEnd) {
      hour += 1;
    }

    String period = hour >= 12 ? "PM" : "AM";
    int adjustedHour = hour % 12 == 0 ? 12 : hour % 12;

    return "${adjustedHour.toString().padLeft(2, '0')} $period";
  }

  /// - Managing time display adjustments.
  void _getCurrentTime() {
    Timer.periodic(Duration(minutes: 1), (timer) {
      timeNow.value = DateTime.now();
    });
  }

  /// - `disposeControllers()`: Disposes of the text editing controller.
  disposeControllers() {
    searchController.dispose();
    overViewpageController.dispose();
    topRatingpageController.dispose();
  }

  /// - `onInit()`: Called during the initialization of the controller.
  @override
  void onInit() {
    getUserdata();
    initActions();
    _getCurrentTime();
    super.onInit();
  }

  /// - `onClose()`: Called when the controller is being disposed.
  @override
  void onClose() {
    disposeControllers();
    super.onClose();
  }
}
