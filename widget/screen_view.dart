import 'package:flutter/material.dart';

import '../core/global_variable.dart';
import '../core/icons_data.dart';
import '../core/model.dart';

/// Screen View (Home View)
DragTarget<int> homeScreenApps(setState) {
  return DragTarget<int>(
    onAcceptWithDetails: (details) => setState(() {
      if (GlobalVaribles.isRemoveFromDock) {
        GlobalVaribles.onDragCompleted = true;
        GlobalVaribles.screenApps!.add(AppsModel(
            title: MacIcons.iconsList[details.data].title,
            icon: MacIcons.iconsList[details.data].icon,
            offset: details.offset));
        MacIcons.iconsList.removeAt(details.data);
        GlobalVaribles.isRemoveFromDock = false;
      }
    }),
    builder: (BuildContext context, List<dynamic> candidateData,
            List<dynamic> rejectedData) =>
        GlobalVaribles.itemIndex != null
            ? const SizedBox(child: Stack(fit: StackFit.expand))
            : const SizedBox(),
  );
}
