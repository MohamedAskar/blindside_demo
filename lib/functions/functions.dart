import 'dart:convert';

import 'package:blindside_demo/models/video.dart';
import 'package:flutter/material.dart';

Future<List<Video>> initData(BuildContext context) async {
  List<Video> videos = [];
  await DefaultAssetBundle.of(context)
      .loadString('assets/json/data.json')
      .then((value) {
    final data = json.decode(value);
    data.forEach((video) {
      videos.add(Video(
          id: video['id'],
          title: video['title'],
          videoUrl: video['videoUrl'],
          views: video['views'],
          thumbnail: video['thumbnail'],
          time: video['time'],
          comments: []));
    });
  });
  return videos;
}

customPageRoute(BuildContext context, Widget route) {
  return Navigator.of(context).push(PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 250),
      opaque: false,
      pageBuilder: (_, animation1, __) {
        return SlideTransition(
            position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                .animate(animation1),
            child: route);
      }));
}
