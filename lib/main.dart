import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:polandesa/main_screen.dart';
import 'package:polandesa/utils/constants/colors.dart';
import '../utils/constants/theme/theme.dart';

void main() async {

   WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
    theme: UAppTheme.lightTheme,
      darkTheme: UAppTheme.lightTheme,
      // getPages: UAppRoutes.screens,
      // home: OnBoardingScreen(),
      home: Scaffold(
        backgroundColor: UColors.primary,
        body: MainScreen()
      ),
    );
  }
}
