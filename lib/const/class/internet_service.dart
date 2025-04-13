import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:my_doctor/const/class/request_state.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/view/core_widgets/custom_snack_bar.dart';
/// A service class that manages internet connectivity status using the
/// `connectivity_plus` package. It extends `GetxService` to leverage
/// GetX's service management capabilities.
///
/// The class listens for changes in connectivity status and updates
/// the `requestState` accordingly. It also displays a custom snack bar
/// notification to inform the user about the connectivity status.
///
/// - `requestState`: A reactive variable that holds the current
///   connectivity state, either `online` or `offline`.
///
/// Methods:
/// - `onInit`: Initializes the connectivity listener.
/// - `_initConnectivity`: Sets up a listener for connectivity changes.
/// - `_updateConnectionStatus`: Updates the `requestState` and displays
///   a snack bar based on the connectivity result.
class InternetService extends GetxService {
  final Connectivity _connectivity = Connectivity();
  static Rx<RequestState> requestState = RequestState.online.obs;

  @override
  void onInit() {
    super.onInit();
    _initConnectivity();
  }

  void _initConnectivity() {
    _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      for (var result in results) {
        _updateConnectionStatus(result);
      }
    });
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      requestState.value = RequestState.offline;

      snackBarWidget(
        title: "Disconnected",
        message: "No Internet Connection",
        backgroundColor: AppColors.redColor,
      );
    } else {
      requestState.value = RequestState.online;
      snackBarWidget(
        title: "Connected",
        message: "Connected Successfully",
        backgroundColor: AppColors.mediumBlueColor,
      );
    }
  }
}
