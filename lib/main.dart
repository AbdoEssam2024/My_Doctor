import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_doctor/const/class/init_binding.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/routes/routes.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: routes,
      initialBinding: InitialBindings(),
      theme: ThemeData(fontFamily: "league"),
    );
  }
}
