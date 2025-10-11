import 'package:flutter/material.dart';
import 'package:starinvest/src/common/image_paths.dart';
import 'package:starinvest/src/presentation/bottom_navigation/bottom_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
      Future.delayed(const Duration(seconds: 5)).then((value) async {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const BottomNavigationComponent(),), );
      });
    return Scaffold(
      body: Image.asset(ImagePaths.general.splash, height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width, fit: BoxFit.cover,),
    );
  }
}
