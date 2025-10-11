import 'package:flutter/material.dart';
import 'package:starinvest/src/common/colors.dart';
import 'package:starinvest/src/presentation/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: ConstColors.grayBasic,
          useMaterial3: false,
        ),
      debugShowCheckedModeBanner: false,
       debugShowMaterialGrid: false,
       showSemanticsDebugger: false,
      
      home: const SplashScreen(),
    );
  }
}
