import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_doctor/const/class/init_binding.dart';
import 'package:my_doctor/const/routes/routes.dart';
import 'package:my_doctor/controller/theme_controller.dart';

late Box userDataBox;
late Box themeBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  userDataBox = await Hive.openBox("userData");
  themeBox = await Hive.openBox("theme");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: routes,
      theme: ThemeController.initialTheme,
      initialBinding: InitialBindings(),
    );
  }
}
