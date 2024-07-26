import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:haul_way/app_widgets/custom_elevated_button.dart';
import 'package:haul_way/app_widgets/custom_image_view.dart';
import 'package:haul_way/app_widgets/custom_text_field.dart';
import 'package:haul_way/core/app_assets.dart';
import 'package:haul_way/core/app_functions.dart';
import 'package:haul_way/presentation/home/widget/home_item.dart';
import 'package:haul_way/theme/app_colors.dart';
import 'package:haul_way/theme/app_style.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const CustomImageView(
          svgPath: AppAssets.ASSETS_ICONS_HOME_APP_BAR_ICON_SVG,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                isFilled: true,

                hintStyle: AppStyle.txtMontserrat.copyWith(
                  color: AppColors.fromHex('#7A7A7A'),
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),

                width: 400,
                prefix: IconButton(
                  highlightColor: AppColors.primaryClr.withOpacity(0.5),
                  onPressed: () async {},
                  icon: CustomImageView(
                    color: AppColors.fromHex('#7A7A7A'),
                    height: 20,
                    svgPath: AppAssets.ASSETS_ICONS_SEARCH_SVG,
                  ),
                ),
                hintText: 'Search for hauls',
                // readOnly: true,
                margin: const EdgeInsets.only(
                  // top: 7,
                  // bottom: 10,
                  right: 10,
                  left: 10,
                ),
                // width: 402,
                // height: ,
                radius: 38,
                validator: (value) {
                  if (value!.isEmpty) return 'Required';
                  return null;
                },

                fillColor: AppColors.fromHex('#D7D7D7'),

                enabledBorderSide: BorderSide(
                  color: AppColors.fromHex('#243B4D'),
                ),
                // borderSide: BorderSide(color: AppColors.fromHex('#9AA5AD')),
              ),
              const Gap(30),
              CustomElevatedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                padding: const EdgeInsets.only(left: 10, right: 10),
                backgroundColor: AppColors.primaryClr,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CustomImageView(
                      height: 20,
                      svgPath: AppAssets.ASSETS_ICONS_BROADCAST_SVG,
                    ),
                    const Gap(5),
                    Text(
                      'LIVE',
                      style: AppStyle.txtMontserrat.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    7,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: AppColors.primaryClr,
                            child: CustomImageView(
                              radius: BorderRadius.circular(40),
                              height: 55.0.dynH,
                              width: 55.0.dynH,
                              fit: BoxFit.cover,
                              imagePath: AppAssets.ASSETS_IMAGES_LIVE_IMG2_JPEG,
                            ),
                          ),
                          Text(
                            'Covstar',
                            style: AppStyle.txtMontserrat.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(20),
              StaggeredGridView.countBuilder(
                itemCount: 5,
                shrinkWrap: true,
                primary: false,
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemBuilder: (context, index) {
                  return const HomeItem();
                },
                staggeredTileBuilder: (index) {
                  return const StaggeredTile.fit(2);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
