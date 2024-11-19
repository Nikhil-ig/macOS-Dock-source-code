import 'dart:ui';
import 'package:flutter/material.dart';

import '../../core/global_variable.dart';
import '../../core/model.dart';
import '../animation.dart';
// import '../animation.dart';

/// Dock Background Widget (Blur Bar)
Container blurDockBar(List<AppsModel> iconsList) => Container(
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white12,
          border: Border.all(color: Colors.white12),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          blendMode: BlendMode.srcOver,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (int index = 0; index < iconsList.length; index++)
                Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: GlobalVaribles.timer),
                      alignment: Alignment.bottomCenter,
                      curve: Curves.linear,
                      padding: const EdgeInsets.all(6.0),
                      height: GlobalVaribles.defaultIconsSize,
                      width: GlobalVaribles.isEnter
                          ? iconsSizeAndMargin(
                                  GlobalVaribles.currentIndex!, index)
                              .$1
                          : GlobalVaribles.defaultIconsSize,
                    ),
                    if (GlobalVaribles.isEnter)
                      if (GlobalVaribles.currentIndex == index)
                        AnimatedContainer(
                          duration:
                              Duration(milliseconds: GlobalVaribles.timer),
                          width: GlobalVaribles.isAddToDock
                              ? putINAnimation(
                                  GlobalVaribles.currentIndex, index)
                              : 0,
                        )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
