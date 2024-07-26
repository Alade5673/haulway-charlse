import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:haul_way/app_widgets/custom_image_view.dart';
import 'package:haul_way/core/app_assets.dart';
import 'package:haul_way/core/app_functions.dart';
import 'package:haul_way/presentation/onboard/onboard.dart';
import 'package:haul_way/theme/app_style.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppAssets.ASSETS_IMAGES_SPLASH_IMG_PNG),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 300.0.dynH),
                child: Center(
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 115.0.dynFont,
                      fontFamily: 'Stoic',
                    ),
                    child: AnimatedTextKit(
                      totalRepeatCount: 1,
                      onFinished: () {
                        Get.offAll(
                          () => const Onboarding(),
                          transition: Transition.fadeIn,
                          duration: 700.milliseconds,
                        );
                      },
                      pause: 700.milliseconds,
                      animatedTexts: [
                        TyperAnimatedText(
                          'Haulway',
                          speed: 200.milliseconds,
                          curve: Curves.easeIn,
                        ),
                      ],
                    ),
                  ),
                  //  Text(
                  //   'Haulway',
                  //   style: TextStyle(
                  //     fontFamily: 'Stoic',
                  //     color: Colors.white,
                  //     fontSize: 120.0.dynFont,
                  //   ),
                  // ),
                ),
              ),
              // CustomImageView(
              //   margin: EdgeInsets.only(
              //     top: MediaQuery.of(context).size.height * 0.3,
              //   ),
              //   svgPath: AppAssets.ASSETS_IMAGES_LOGO_SVG,
              // ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    'from',
                    style: AppStyle.txtMontserrat.copyWith(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(10),
                  const CustomImageView(
                    height: 20,
                    imagePath: AppAssets.ASSETS_IMAGES_GRASSCOPE_PNG,
                  ),
                  const Gap(20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
