

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constants/assets_app.dart';
import '../../../core/services/local_storage_key.dart';
import '../../../core/services/local_storage_service.dart';
import '../../../core/theme/colors_app.dart';
import '../../../providers/app_theme_provider.dart';
import '../../login/login_screen.dart';
import '../models/onboarding_model.dart';
import '../widget/onboarding_item.dart';

class OnboardingScrollScreen extends StatefulWidget {
  const OnboardingScrollScreen({super.key});

  @override
  State<OnboardingScrollScreen> createState() => _OnboardingScrollScreenState();
}

class _OnboardingScrollScreenState extends State<OnboardingScrollScreen> {
  var activeIndex = 0;
  var controller = PageController();
    int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    LocalStorageService.setBool(LocalStorageKeys.isFristTimeRun, false);
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final bool isDarkMode = themeProvider.isDark();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              AssetsApp.logoEventOnboarding,
              height: size.height * 0.20,
              width: size.width * 0.5,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: PageView.builder(
                  controller: controller,
                  onPageChanged: (index) {
                    activeIndex = index;
                    setState(() {});
                  },
                  itemCount: OnboardingModel.onboardingList.length,
                  itemBuilder: (context, index) {
                    var onboardingModel = OnboardingModel.onboardingList[index];
                    return OnboardingItem(onboardingModel: onboardingModel);
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: activeIndex != 0,
                    child: GestureDetector(
                      onTap: () {
                        if (activeIndex > 0) {
                          controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorsApp.secondColorLight),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: ColorsApp.secondColorLight,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: OnboardingModel.onboardingList.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: ColorsApp.secondColorLight,
                      dotColor: Colors.black,
                      dotWidth: 12,
                      dotHeight: 12,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (activeIndex ==
                          OnboardingModel.onboardingList.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      } else {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorsApp.secondColorLight),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: ColorsApp.secondColorLight,
                        size: 20,
                      ),
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
