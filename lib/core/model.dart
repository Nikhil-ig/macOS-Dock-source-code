import 'dart:ui';

class AppsModel {
  String? title;
  String? icon;
  Offset? offset;
  Function? onTap;

  AppsModel({this.title, this.icon, this.offset, this.onTap});

  AppsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    offset = json['offset'];
    onTap = json['onTap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = icon;
    data['offset'] = offset;
    data['onTap'] = onTap;
    return data;
  }
}
