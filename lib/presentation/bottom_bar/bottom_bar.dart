import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:haul_way/app_widgets/custom_bottom_style.dart';
import 'package:haul_way/app_widgets/custom_elevated_button.dart';
import 'package:haul_way/app_widgets/custom_image_view.dart';
import 'package:haul_way/core/app_assets.dart';
import 'package:haul_way/presentation/home/home.dart';
import 'package:haul_way/theme/app_colors.dart';
import 'package:haul_way/theme/app_style.dart';

import '../../app_widgets/mod_pks/custom_persist/persistent_bottom_nav_bar_v2.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({super.key});

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  int currentTabIndex = 0;

  final tabCtr = PersistentTabController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: PersistentTabView(
        controller: tabCtr,
        onTabChanged: (value) {
          setState(() {
            currentTabIndex = value;
          });
        },
        handleAndroidBackButtonPress: false,
        popAllScreensOnTapAnyTabs: true,
        tabs: [
          PersistentTabConfig(
            screen: const Home(),
            item: ItemConfig(
              icon: CustomImageView(
                color: iconClr(0),
                svgPath: AppAssets.ASSETS_ICONS_HOME_SVG,
              ),
            ),
          ),
          PersistentTabConfig(
            screen: comingSoon(),
            item: ItemConfig(
              icon: CustomImageView(
                color: iconClr(1),
                svgPath: AppAssets.ASSETS_ICONS_SEARCH_SVG,
              ),
            ),
          ),
          PersistentTabConfig(
            screen: comingSoon(),
            item: ItemConfig(
              icon: CustomImageView(
                color: iconClr(2),
                svgPath: AppAssets.ASSETS_ICONS_MSG_SVG,
              ),
            ),
          ),
          PersistentTabConfig(
            screen: comingSoon(),
            item: ItemConfig(
              icon: CustomImageView(
                color: iconClr(2),
                height: 25,
                radius: BorderRadius.circular(20),
                imagePath: AppAssets.ASSETS_IMAGES_LIVE_IMG2_JPEG,
              ),
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => CustomBottomStyle(
          navBarConfig: navBarConfig,
          navBarDecoration: const NavBarDecoration(color: Colors.white),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomElevatedButton(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                  backgroundColor: AppColors.primaryClr,
                  onPressed: () {},
                  child: const CustomImageView(
                    height: 32,
                    svgPath: AppAssets.ASSETS_ICONS_BROADCAST_SVG,
                  ),
                ),
                const Gap(30),
                CustomElevatedButton(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                  backgroundColor: AppColors.fromHex('#222222'),
                  onPressed: () {},
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color? iconClr(int index) =>
      currentTabIndex == index ? AppColors.primaryClr : null;

  Center comingSoon() {
    return Center(
      child: Text(
        'Coming soon',
        style: AppStyle.txtMontserrat
            .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }
}
