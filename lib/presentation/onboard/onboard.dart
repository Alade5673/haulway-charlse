import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haul_way/app_widgets/custom_elevated_button.dart';
import 'package:haul_way/app_widgets/custom_image_view.dart';
import 'package:haul_way/core/app_assets.dart';
import 'package:haul_way/core/app_routes.dart';
import 'package:haul_way/core/helpers/rhombus_clipper.dart';
import 'package:haul_way/presentation/onboard/model/onboard_model.dart';
import 'package:haul_way/presentation/onboard/widgets/onboard_pages.dart';
import 'package:haul_way/theme/app_colors.dart';
import 'package:haul_way/theme/app_style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final pgCtr = PageController(viewportFraction: 0.9999);

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: PageView.builder(
              controller: pgCtr,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              itemCount: onBoardPages.length,
              itemBuilder: (context, index) {
                OnBoardModel onBoardModel = onBoardPages[index];
                return OnboardPage(onBoardModel: onBoardModel);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => Get.offAllNamed(AppRoutes.bottomBar),
                  child: Text(
                    'Skip',
                    style: AppStyle.txtMontserrat.copyWith(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                AnimatedSmoothIndicator(
                  activeIndex: index,
                  count: onBoardPages.length,
                  effect: const ExpandingDotsEffect(
                    spacing: 12,
                    dotWidth: 13,
                    dotHeight: 9,
                    activeDotColor: Colors.white,
                    radius: 10,
                  ),
                ),
                CustomElevatedButton(
                  padding: const EdgeInsets.all(15),
                  shape: CurvedRhombusBorder(),
                  backgroundColor: AppColors.nextClr,
                  onPressed: () {
                    if (index == 1) {
                      Get.offAllNamed(AppRoutes.bottomBar);
                    } else {
                      pgCtr.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: const CustomImageView(
                    svgPath: AppAssets.ASSETS_ICONS_NEXT_SVG,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
