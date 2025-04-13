import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_doctor/main.dart';
import 'package:my_doctor/model/user_data_model.dart';
import '../const/class/internet_service.dart';
import '../const/class/request_state.dart';

class HomeController extends GetxController {
  List userData = [];
  late TextEditingController searchController;
  Rx<RequestState> requestState = RequestState.none.obs;
  Rx<DateTime> timeNow = DateTime.now().obs;

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
    listenToNetworkChanges();
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
