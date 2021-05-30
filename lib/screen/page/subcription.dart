import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psm/provider/video_provider.dart';
import 'package:psm/screen/detail.dart';
import 'package:psm/models/video.dart';

import '../search.dart';

class Subcription extends StatelessWidget {
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
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                    height: 120,
                    width: double.infinity,
                    child: InkWell(
                      child: Container(
                          height: 40,
                          margin: EdgeInsets.only(top: 60),
                          child: Card(
                            child: Container(
                              height: 40,
                              margin: EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text(
                                      "Search",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 16),
                                    child: Icon(Icons.search),
                                  ),
                                ],
                              ),
                              // child: TextFormField(
                              //   cursorColor: Colors.black,
                              //   decoration: new InputDecoration(
                              //       border: InputBorder.none,
                              //       suffixIcon: Icon(
                              //         Icons.search,
                              //         color: Colors.black,
                              //       ),
                              //       focusedBorder: InputBorder.none,
                              //       enabledBorder: InputBorder.none,
                              //       errorBorder: InputBorder.none,
                              //       disabledBorder: InputBorder.none,
                              //       contentPadding: EdgeInsets.only(
                              //           left: 15, bottom: 11, top: 11, right: 15),
                              //       hintText: "Search"),
                              // ),
                            ),
                          )),
                      onTap: () {
                        Navigator.of(context).pushNamed(Search.tag);
                      },
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(bottom: 60, top: 10),
                  child: Stack(
                    children: [
                      ListView.builder(
                        itemCount: videoList.length,
                        padding: EdgeInsets.only(
                          bottom: 120,
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
          ],
        ),
      ),
    );
  }
}
