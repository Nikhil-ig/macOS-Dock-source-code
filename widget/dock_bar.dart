import 'package:flutter/material.dart';

import '../core/global_variable.dart';
import '../core/icons_data.dart';
import 'app_icons.dart';
import 'dock/apps_icons_list.dart';
import 'dock/blur_bar.dart';

/// root of Dock Bar
Stack dockBar(setState) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      blurDockBar(MacIcons.iconsList),
      dockBarAppsIconsList(setState),

      //* Home Screen Apps
      GlobalVaribles.itemIndex != null
          ? SizedBox(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  for (int i = 0; i < GlobalVaribles.screenApps!.length; i++)
                    Positioned(
                      top: GlobalVaribles.screenApps != null
                          ? GlobalVaribles.screenApps![i].offset!.dy
                          : null,
                      left: GlobalVaribles.screenApps != null
                          ? GlobalVaribles.screenApps![i].offset!.dx
                          : null,
                      child: addtoDock(setState, i),
                    ),
                ],
              ),
            )
          : const SizedBox()
    ],
  );
}

Draggable<int> addtoDock(setState, int i) {
  return Draggable(
    onDragUpdate: (details) {
      if (!GlobalVaribles.isEnter) {
        setState(() => GlobalVaribles.positionedItem = details.localPosition);
        GlobalVaribles.isAddToDock = true;
        GlobalVaribles.isOnDrag = true;
        GlobalVaribles.onDragCompleted = false;
      }
    },
    onDragCompleted: () {
      setState(() {
        GlobalVaribles.isAddToDock = false;
        GlobalVaribles.isOnDrag = false;
      });
    },
    data: i,
    feedback: Opacity(
        opacity: .7, child: AppIcon(icon: GlobalVaribles.screenApps![i].icon!)),
    // child: GestureDetector(
    // onPanUpdate: (details) {
    //   setState(() {
    //     GlobalVaribles.screenApps![i].offset = details.globalPosition;
    //   });
    // },
    // onPanEnd: (onPanEnd) {
    //   if (GlobalVaribles.isEnter) {
    //     try {
    //       putINAnimation(
    //           GlobalVaribles.currentIndex, GlobalVaribles.itemIndex!);
    //       MacIcons.iconsList.insert(
    //           GlobalVaribles.currentIndex!, GlobalVaribles.screenApps![i]);
    //       GlobalVaribles.screenApps!.removeAt(i);
    //     } catch (e) {
    //       print(e);
    //     }
    //   }
    //   setState(() {});
    // },
    child: AppIcon(icon: GlobalVaribles.screenApps![i].icon!),
  );
  // );
}
