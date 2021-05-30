import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psm/config/controls.dart';
import 'package:psm/config/data_manager.dart';
import 'package:psm/models/video.dart';
import 'package:psm/provider/video_provider.dart';
import 'package:video_player/video_player.dart';

class Detail extends StatefulWidget {
  final Video video;

  static String tag = "detail-page";

  Detail({this.video});

  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  FlickManager flickManager;
  DataManager dataManager;
  List<Video> videos = videoList;
  String currentVideo;

  @override
  void initState() {
    super.initState();

    currentVideo = videos[widget.video.id].title;

    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.asset(
        videos[widget.video.id].videoPath,
      ),
      onVideoEnd: () {
        dataManager.skipToNextVideo(
          Duration(seconds: 5),
        );
      },
    );

    dataManager = DataManager(
      currentPlaying: videos[widget.video.id].id,
      flickManager: flickManager,
      urls: [
        videos[0].videoPath,
        videos[1].videoPath,
        videos[2].videoPath,
      ],
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  skipToVideo(String path) {
    flickManager.handleChangeVideo(VideoPlayerController.asset(path));
  }

  @override
  Widget build(BuildContext context) {
    VideoProvider video = Provider.of<VideoProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.width * 2.1,
          child: ListView(
            children: [
              Container(
                height: 265,
                alignment: Alignment.center,
                child: FlickVideoPlayer(
                  flickManager: flickManager,
                  systemUIOverlayFullscreen: [],
                  flickVideoWithControls: FlickVideoWithControls(
                    controls: CustomOrientationControls(
                      dataManager: dataManager,
                    ),
                  ),
                  flickVideoWithControlsFullscreen: FlickVideoWithControls(
                    videoFit: BoxFit.fitWidth,
                    controls: CustomOrientationControls(
                      dataManager: dataManager,
                    ),
                  ),
                ),
              ),
              Consumer<VideoProvider>(
                builder: (context, state, _) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      state.title,
                      style: TextStyle(fontSize: 17),
                    ),
                  );
                },
              ),
              Container(
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Image.asset("images/account.png"),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                child: Text("EvanTubeHD\n6.64M subscribers"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0),
                                side: BorderSide(color: Colors.red),
                              ),
                              onPressed: () {},
                              padding: EdgeInsets.all(10.0),
                              color: Colors.red,
                              textColor: Colors.white,
                              child: Text(
                                "SUBSCRIBE",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Center(
                child: Text(
                  "Recommendation",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height + 70,
                child: ListView.builder(
                  itemCount: videoList.length,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(
                    top: 30,
                    bottom: 230,
                  ),
                  itemBuilder: (_, index) => Container(
                    width: double.infinity,
                    child: InkWell(
                      child: Card(
                        child: Container(
                          child: Column(
                            children: [
                              Image.asset(
                                videoList[index].thumbnailPath,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: 173,
                              ),
                              Container(
                                margin: EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    new Flexible(
                                      child: new Text(
                                        videoList[index].title,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      flex: 15,
                                    ),
                                    new Flexible(
                                      flex: 1,
                                      child: new Container(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          "images/opstion_menu.png",
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        video.initPlay(
                          currentPlay: videoList[index].id,
                          title: videoList[index].title,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Detail(
                              video: videoList[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 90,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
