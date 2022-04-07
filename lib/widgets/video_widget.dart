import 'package:blindside_demo/functions/functions.dart';
import 'package:blindside_demo/models/video.dart';
import 'package:blindside_demo/screens/video/video_screen.dart';
import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    required this.video,
    Key? key,
  }) : super(key: key);

  final Video video;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => customPageRoute(
          context, VideoScreen(key: Key(video.id), video: video)),
      child: Container(
        width: size.width / 1.2,
        margin: const EdgeInsets.only(bottom: 14),
        child: Column(
          children: [
            Container(
              height: size.height / 3.6,
              padding: const EdgeInsets.all(8),
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(video.thumbnail), fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Container(
                  padding: const EdgeInsets.all(4),
                  color: Colors.black87,
                  child: Text(
                    video.time,
                    style: Theme.of(context).textTheme.subtitle2,
                  )),
            ),
            SizedBox(height: 14),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24,
                  child: Icon(Icons.person_outline, size: 32),
                ),
                SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video.title,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${video.views} • 1 month ago',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
