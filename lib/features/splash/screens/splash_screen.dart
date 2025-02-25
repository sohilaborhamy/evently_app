import 'package:animate_do/animate_do.dart';



import 'package:flutter/material.dart';


import '../../../core/constants/assets_app.dart';
import '../../../core/routes/screens_route_name.dart';
import '../../../core/services/local_storage_key.dart';
import '../../../core/services/local_storage_service.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
       Duration(seconds: 3),
      () {
        var isFristTime = LocalStorageService.getBool(LocalStorageKeys.isFristTimeRun)?? true;
        Navigator.pushReplacementNamed(context, isFristTime?  ScreenRouteName.fristOnboardingScreen :
       ScreenRouteName.layout);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Scaffold(
      //backgroundColor: ColorsApp.primaryColorLight,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            ZoomIn(
              duration: const Duration(seconds: 1),
              child: Image.asset(
                AssetsApp.logoSplash,
                width: 150,
                height: size.size.height * 0.4,
              ),
            ),
            const Spacer(),
            SlideInUp(
              duration: const Duration(seconds: 1),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Image.asset(
                  AssetsApp.brandingSplash,
                  width: 214,
                  height: 86,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
