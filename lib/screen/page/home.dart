import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psm/provider/video_provider.dart';
import 'package:psm/screen/detail.dart';
import 'package:psm/models/video.dart';
import 'package:psm/screen/search.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VideoProvider video = Provider.of<VideoProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.red),
                  padding: EdgeInsets.only(left: 16),
                  height: 170,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 5,
                        child: Container(
                          width: 300,
                          margin: EdgeInsets.only(top: 70),
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Hello",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                        fontFamily: 'Helvetica'),
                                  )),
                              Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Asyraf!",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'Helvetica'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          child: Image.asset(
                            'images/icon_home.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      ListView.builder(
                        itemCount: videoList.length,
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
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 65,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 130),
              child: InkWell(
                child: Container(
                  width: 350,
                  height: 65,
                  margin: EdgeInsets.only(top: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "Search",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 250),
                              child: Icon(Icons.search),
                            ),
                          ],
                        )),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(Search.tag);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
