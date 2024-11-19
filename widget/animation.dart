import 'package:flutter/material.dart';

import '../core/global_variable.dart';
import '../core/icons_data.dart';
import 'app_icons.dart';

class AnimatedAppIcon extends StatelessWidget {
  const AnimatedAppIcon({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: pullOutAnimation(index, MacIcons.iconsList),
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: GlobalVaribles.timer),
      child: AnimatedContainer(
        duration: Duration(milliseconds: GlobalVaribles.timer),
        margin: EdgeInsets.only(
          bottom: iconsSizeAndMargin(
            GlobalVaribles.currentIndex,
            index,
          ).$2,
          left: GlobalVaribles.currentIndex != index + 1
              ? putINAnimation(GlobalVaribles.currentIndex, index)
              : 0,
          right: GlobalVaribles.currentIndex == index + 2
              ? putINAnimation(GlobalVaribles.currentIndex, index)
              : 0,
        ),
        curve: Curves.linear,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(6.0),
        height: iconsSizeAndMargin(GlobalVaribles.currentIndex, index).$1,
        width: iconsSizeAndMargin(GlobalVaribles.currentIndex, index).$1,
        child: AppIcon(
          icon: MacIcons.iconsList[index].icon!,
          size: false,
        ),
      ),
    );
  }
}

/// Put In Animation (Home View to Dock)on;
putINAnimation(int? currentIndex, int index) {
  List list = MacIcons.iconsList;
  double marginVal = 0;
  if (GlobalVaribles.isAddToDock == true) {
    if (GlobalVaribles.isEnter) {
      for (int i = -1; i < list.length; i++) {
        if (currentIndex == index) {
          marginVal = 80;
        }
      }
    }
  }
  return marginVal;
}

/// Icon Size and Margin (for Animation)
(
  double,
  double,
) iconsSizeAndMargin(int? currentIndex, int index) {
  (double, double) sizeAndMarginVal = (GlobalVaribles.defaultIconsSize, 00);
  if (GlobalVaribles.isAddToDock == true) {
    if (GlobalVaribles.isEnter) {
      for (int i = -1; i < index; i++) {
        if (currentIndex == index || currentIndex == index + 1) {
          sizeAndMarginVal = (100, 7);
        } else if (currentIndex == index - 1 || currentIndex == index + 2) {
          sizeAndMarginVal = (85, 5);
        } else if (currentIndex == index - 2 || currentIndex == index + 3) {
          sizeAndMarginVal = (70, 0);
        }
      }
    }
  } else {
    if (GlobalVaribles.isEnter) {
      for (int i = -1; i < index; i++) {
        if (currentIndex == index) {
          sizeAndMarginVal = (120, 10);
        } else if (currentIndex == index + 1 || currentIndex == index - 1) {
          sizeAndMarginVal = (100, 7);
        } else if (currentIndex == index + 2 || currentIndex == index - 2) {
          sizeAndMarginVal = (85, 5);
        } else if (currentIndex == index + 3 || currentIndex == index - 3) {
          sizeAndMarginVal = (70, 0);
        }
      }
    }
  }
  return sizeAndMarginVal;
}

/// Pull Out Animation (Dock to Home View)
double pullOutAnimation(int index, List list) {
  double animation = 1;
  if (GlobalVaribles.isRemoveFromDock) {
    for (int i = -1; i < index; i++) {
      if (GlobalVaribles.itemIndex == index) {
        animation = 0;
      }
    }
  }
  return animation;
}
