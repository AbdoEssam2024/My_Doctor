import 'package:flutter/material.dart';
import 'package:my_doctor/const/app_theme/app_theme.dart';
import 'package:my_doctor/const/routes/routes.dart';
import 'package:my_doctor/const/class/app_initializer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            onGenerateRoute: onGenerateRoute,
          ),
    );
  }
}
