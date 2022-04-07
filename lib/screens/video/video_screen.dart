import 'dart:convert';

import 'package:blindside_demo/functions/functions.dart';
import 'package:blindside_demo/models/comment.dart';
import 'package:blindside_demo/models/video.dart';
import 'package:blindside_demo/widgets/comment_widget.dart';
import 'package:blindside_demo/widgets/video_widget.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final Video video;
  VideoScreen({Key? key, required this.video}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController videoPlayerController;

  late ChewieController chewieController;
  bool toggleComments = true;
  final _formKey = GlobalKey<FormBuilderState>();
  List<VideoComment> comments = [];
  @override
  void initState() {
    videoPlayerController =
        VideoPlayerController.network(widget.video.videoUrl);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      looping: false,
      autoPlay: true,
      autoInitialize: true,
      showOptions: false,
      aspectRatio: 16 / 9,
    );
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.width * 9 / 16,
                child: Chewie(
                  controller: chewieController,
                ),
              ),
              Positioned(
                top: 24,
                child: IconButton(
                    onPressed: () => Navigator.maybePop(context),
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                    )),
              )
            ],
          ),
          SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.video.title,
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: 8),
                Text(
                  '${widget.video.views} views • 1 month ago',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(height: 8),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Comments',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Switch(
                        value: toggleComments,
                        onChanged: (value) {
                          setState(() {
                            toggleComments = value;
                          });
                        }),
                  ],
                ),
                FormBuilder(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 4, 4, 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38, width: 1.5),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: FormBuilderTextField(
                      name: 'comment',
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      textInputAction: TextInputAction.next,
                      cursorColor: Colors.black,
                      style: Theme.of(context).textTheme.bodyText1,
                      showCursor: true,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            print(_formKey.currentState!.instantValue);
                            comments.add(VideoComment(
                                id: UniqueKey().toString(),
                                comment: _formKey
                                    .currentState!.instantValue['comment'],
                                user: 'user',
                                date: DateTime.now()));
                            _formKey.currentState!.reset();
                            FocusScope.of(context).unfocus();
                          },
                          icon: Icon(
                            Icons.send,
                            size: 20,
                          ),
                        ),
                        border: InputBorder.none,
                        fillColor: Colors.black,
                        hintText: 'Add your comment...',
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                toggleComments
                    ? ListView.builder(
                        itemCount: comments.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CommentWidget(comment: comments[index]);
                        },
                      )
                    : Center(
                        child: Text(
                          'Comments are toggled off',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                Divider(),
                Text(
                  'Related Videos',
                  style: Theme.of(context).textTheme.headline5,
                ),
                FutureBuilder<List<Video>>(
                    future: initData(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        List<Video>? data = snapshot.data;
                        return ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => VideoWidget(
                            video: (widget.video.id != data![index])
                                ? data[index]
                                : data[index + 1],
                          ),
                        );
                      }
                    })
              ],
            ),
          )
        ],
      )),
    );
  }
}
