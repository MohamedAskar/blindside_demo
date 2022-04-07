import 'comment.dart';

class Video {
  final String id;
  final String title;
  final String videoUrl;
  final String views;
  final String thumbnail;
  final String time;
  final List<VideoComment> comments;

  Video(
      {required this.id,
      required this.title,
      required this.videoUrl,
      required this.views,
      required this.thumbnail,
      required this.time,
      required this.comments});
}
