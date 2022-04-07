import 'dart:convert';

import 'package:blindside_demo/functions/functions.dart';
import 'package:blindside_demo/models/video.dart';
import 'package:blindside_demo/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Theme.of(context).backgroundColor),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 28,
                ),
                SizedBox(width: 18),
                Icon(
                  Icons.video_collection,
                  color: Colors.black,
                  size: 28,
                ),
                Spacer(),
                CircleAvatar(
                  radius: 18,
                  child: Icon(Icons.person_outline),
                ),
              ],
            ),
            SizedBox(height: 14),
            Text(
              'Popular Videos',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: 14),
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
                      itemCount: data?.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => VideoWidget(
                        video: data![index],
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
