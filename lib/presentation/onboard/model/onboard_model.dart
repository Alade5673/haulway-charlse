import 'package:haul_way/core/app_assets.dart';

class OnBoardModel {
  final String img;
  final String title;
  final String description;

  OnBoardModel({
    required this.img,
    required this.title,
    required this.description,
  });
}

List<OnBoardModel> onBoardPages = [
  OnBoardModel(
    img: AppAssets.ASSETS_IMAGES_ONBOARD_IMG1_PNG,
    title: 'Explore \nTrendy Fashion',
    description:
        'Explore the latest trends in the world of fashion \nyou never have to miss a beat.',
  ),
  OnBoardModel(
    img: AppAssets.ASSETS_IMAGES_ONBOARD_IMG2_PNG,
    title: 'Select \nYour Style',
    description:
        'From our huge collection of Hauls, Lookbook, \nDIY and GRWM, you can choose the best for you.',
  ),
];
