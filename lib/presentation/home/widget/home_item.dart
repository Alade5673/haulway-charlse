import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:haul_way/app_widgets/custom_image_view.dart';
import 'package:haul_way/core/app_assets.dart';
import 'package:haul_way/theme/app_style.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImageView(
          height: 253,
          width: 190,
          imagePath: AppAssets.ASSETS_IMAGES_HOME_IMG2_PNG,
          radius: BorderRadius.circular(10),
        ),
        Text(
          'Beautiful royal dinner gown, the perfect fit for',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppStyle.txtMontserrat.copyWith(fontWeight: FontWeight.w900),
        ),
        const Gap(10),
        Row(
          children: [
            CustomImageView(
              height: 35,
              width: 35,
              fit: BoxFit.cover,
              radius: BorderRadius.circular(
                30,
              ),
              imagePath: AppAssets.ASSETS_IMAGES_LIVE_IMG3_JPEG,
            ),
            const Gap(10),
            Text(
              'Ebiblophile',
              style: AppStyle.txtMontserrat.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
