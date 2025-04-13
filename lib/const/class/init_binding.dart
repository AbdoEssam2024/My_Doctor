import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:my_doctor/const/class/internet_service.dart';
import 'package:my_doctor/web_services/api_calls.dart';

class InitialBindings extends Bindings {
  final Logger _logger = Logger('InitialBindings');

  /// A class that initializes and registers dependencies for the application.
  ///
  /// This class extends `Bindings` and overrides the `dependencies` method

  /// to register essential services such as `ApiCalls` and `InternetService`.
  /// The `dependencies` method is called during the initialization of the application,
  /// allowing for efficient resource management and dependency injection.
  @override
  void dependencies() async {
    try {
      _registerDependency<ApiCalls>(() => ApiCalls());
      _registerDependency<InternetService>(() => InternetService());
    } catch (e) {
      ///If an error occurs during the registration process, it logs the error using a `Logger`.
      _logger.severe('Error initializing dependencies', e);
    }
  }

  /// It uses lazy loading with the `Get.lazyPut` method to ensure that
  /// dependencies are only created when needed.
  /// This method takes a factory function as an argument and registers
  /// the dependency with the `Get` singleton.
  /// The `fenix: true` parameter is used to enable the use of the `fenix` package,
  /// which provides a more efficient way to manage dependencies in Flutter applications.
  void _registerDependency<T>(T Function() factory) {
    Get.lazyPut(factory, fenix: true);
  }
}
