import 'package:dock/core/model.dart';
import 'package:flutter/material.dart';

class GlobalVaribles {
  static String backgroundImage = //"assets/sequoia_wallpaper.png";
      "https://images.pexels.com/photos/807598/pexels-photo-807598.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";
  static int? itemIndex;
  static Offset? positionedItem;
  static List<AppsModel>? screenApps = [];
  static bool isEnter = false;
  static bool isRemoveFromDock = false;
  static bool isRemoveFromScreen = false;
  static bool isAddToDock = false;
  static bool onDragCompleted = false;
  static bool ispick = false;
  static int? currentIndex;
  static double defaultIconsSize = 70;
  static int timer = 250;
  static Offset? offset;
  static bool isOnDrag = false;
}
