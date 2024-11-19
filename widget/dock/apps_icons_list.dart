import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/global_variable.dart';
import '../../core/icons_data.dart';
import '../animation.dart';
import '../app_icons.dart';
import '../hover_message.dart';

/// Dock Apps item {ListView)
DragTarget<int> dockBarAppsIconsList(setState) => DragTarget<int>(
      //* Add to Dock
      onWillAcceptWithDetails: (details) {
        return willAccept(details);
      },
      onAcceptWithDetails: (details) => setState(() {
        GlobalVaribles.onDragCompleted = true;
        try {
          MacIcons.iconsList.insert(GlobalVaribles.currentIndex!,
              GlobalVaribles.screenApps![details.data]);
        } catch (e) {
          print("Apps_icons_list: $e");
        }
        GlobalVaribles.screenApps!.removeAt(details.data);
      }),
      builder: (context, candidateData, rejectedData) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (int index = 0; index < MacIcons.iconsList.length; index++)
              MouseRegion(
                onEnter: (PointerEnterEvent pointer) => setState(() {
                  GlobalVaribles.isEnter = true;
                  GlobalVaribles.currentIndex = index;
                }),
                onExit: (PointerExitEvent pointer) => setState(
                  () {
                    GlobalVaribles.isEnter = false;
                    GlobalVaribles.currentIndex = index;
                  },
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!GlobalVaribles.isOnDrag)
                      if (GlobalVaribles.isEnter)
                        if (GlobalVaribles.currentIndex == index)
                          HoverMessage(index: index),
                    pickfromDock(index, setState),
                  ],
                ),
              ),
          ],
        );
      },
    );

Draggable<int> pickfromDock(int index, setState) {
  return Draggable<int>(
    data: index,
    feedback: AppIcon(icon: MacIcons.iconsList[index].icon!),
    onDragUpdate: (details) => setState(() {
      GlobalVaribles.positionedItem = details.localPosition;
      GlobalVaribles.itemIndex = index;
      GlobalVaribles.isRemoveFromDock = true;
      GlobalVaribles.onDragCompleted = false;
    }),
    onDragEnd: (details) {
      setState(() {
        GlobalVaribles.isRemoveFromDock = false;
      });
    },
    childWhenDragging: AnimatedContainer(
      duration: Duration(milliseconds: GlobalVaribles.timer),
      width: GlobalVaribles.isEnter ? 60 : 0,
    ),
    child: AnimatedAppIcon(index: index),
  );
}

bool willAccept(DragTargetDetails<int> details) {
  if (GlobalVaribles.isEnter) {
    if (GlobalVaribles.isAddToDock) {
      return true;
    }
  }
  return false;
}
