import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {

  // TODO: Repository, DataSource

  bool initialLoading = true;
  List<VideoPost> videos = [];



  Future<void> loadNextPage() async {

    await Future.delayed( const Duration( seconds: 2 ) );

    final List<VideoPost> newVideos = videoPosts.map(
      ( video ) => LocalVideoModel.fromJson(video).toVideoPostEntity()
    ).toList(); // Lo convertimos a List, por que es un Iterable.

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }

}