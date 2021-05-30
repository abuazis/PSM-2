class Video {
  final int id;
  final String title;
  final String videoPath;
  final String thumbnailPath;

  Video({
    this.id,
    this.title,
    this.videoPath,
    this.thumbnailPath,
  });
}

List<Video> videoList = [
  Video(
    id: 0,
    title: "Banyak Banget Ziyan Mainan Dinasurus Animal World",
    videoPath: "videos/video_one.mp4",
    thumbnailPath: "images/image_one.jpg",
  ),
  Video(
    id: 1,
    title: "Mereview Mobil Anak Youtubers",
    videoPath: "videos/video_two.mp4",
    thumbnailPath: "images/image_two.jpg",
  ),
  Video(
    id: 2,
    title: "Unboxing Mainan Anak Barbie Color Reveal",
    videoPath: "videos/video_three.mp4",
    thumbnailPath: "images/image_three.jpg",
  ),
];
