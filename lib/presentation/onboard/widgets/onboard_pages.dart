import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:haul_way/app_widgets/custom_image_view.dart';
import 'package:haul_way/core/app_functions.dart';
import 'package:haul_way/presentation/onboard/model/onboard_model.dart';
import 'package:haul_way/theme/app_style.dart';

class OnboardPage extends StatelessWidget {
  final OnBoardModel onBoardModel;
  const OnboardPage({
    super.key,
    required this.onBoardModel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      // fit: StackFit.loose,
      children: [
        CustomImageView(
          margin: const EdgeInsets.all(10),
          fit: BoxFit.cover,
          imagePath: onBoardModel.img,
        ),
        Positioned(
          bottom: 130.0.dynH,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  onBoardModel.title,
                  style: AppStyle.txtMontserrat.copyWith(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const Gap(10),
                Text(
                  onBoardModel.description,
                  style: AppStyle.txtMontserrat.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.9,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
