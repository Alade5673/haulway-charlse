// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:haul_way/core/app_functions.dart';

import 'mod_pks/custom_persist/persistent_bottom_nav_bar_v2.dart';

class CustomBottomStyle extends StatelessWidget {
  final bool showUnderline;
  const CustomBottomStyle({
    super.key,
    this.showUnderline = false,
    required this.navBarConfig,
    this.navBarDecoration = const NavBarDecoration(),
    this.itemAnimationProperties = const ItemAnimation(),
  });

  final NavBarConfig navBarConfig;
  final NavBarDecoration navBarDecoration;

  final ItemAnimation itemAnimationProperties;

  Widget _buildItem(ItemConfig item, bool isSelected) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconTheme(
            data: IconThemeData(
              size: item.iconSize,
              color: isSelected
                  ? item.activeForegroundColor
                  : item.inactiveForegroundColor,
            ),
            child: isSelected ? item.icon : item.inactiveIcon,
          ),
          if (item.title != null)
            Text(
              item.title!,
              style: item.textStyle.apply(
                color: isSelected
                    ? item.activeForegroundColor
                    : item.inactiveForegroundColor,
              ),
            ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final double itemWidth = (MediaQuery.of(context).size.width -
            navBarDecoration.padding.horizontal) /
        navBarConfig.items.length;
    return DecoratedNavBar(
      decoration: navBarDecoration,
      filter: navBarConfig.selectedItem.filter,
      opacity: navBarConfig.selectedItem.opacity,
      height: 40.0.dynH,
      child: Column(
        children: <Widget>[
          const Divider(
            height: 0,
            color: Colors.white,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: navBarConfig.items.map((item) {
                final int index = navBarConfig.items.indexOf(item);
                return InkWell(
                  onTap: () {
                    navBarConfig.onItemSelected(index);
                  },
                  child: Center(
                    child: _buildItem(
                      item,
                      navBarConfig.selectedIndex == index,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // const SizedBox(
          //   height: 5,
          // ),
          Row(
            children: <Widget>[
              AnimatedContainer(
                duration: itemAnimationProperties.duration,
                curve: itemAnimationProperties.curve,
                width: (itemWidth * navBarConfig.selectedIndex) + factor1(),
                height: 4,
              ),
              AnimatedContainer(
                duration: itemAnimationProperties.duration,
                curve: itemAnimationProperties.curve,
                width: itemWidth * factor2(),
                height: 2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: showUnderline
                      ? navBarConfig.selectedItem.activeForegroundColor
                      : null,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  double factor2() {
    switch (navBarConfig.selectedIndex) {
      case 0:
        return 0.8;
      case 4:
        return 0.95;
      case 1:
        return 0.77;
      case 2:
        return 0.83;
      case 3:
        return 0.91;

      default:
        return 1;
    }
  }

  double factor1() {
    switch (navBarConfig.selectedIndex) {
      case 0:
        return 4;

      default:
        return 0;
    }
  }
}
