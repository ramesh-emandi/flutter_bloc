import 'dart:async';

import 'package:flutter_bloc/bloc/block_base.dart';
import 'package:flutter_bloc/repository/modal/result.dart';
import 'package:flutter_bloc/repository/repository.dart';
import 'package:flutter_bloc/repository/repository_impl.dart';

class ImageListBloc implements BlocBase {
  Repository _repository;

  //user future or streams for content delivery
  StreamController _imageListStream;

  Stream<Result> get getImageStream => _imageListStream.stream;

  @override
  void init() {
    _imageListStream = StreamController<Result>();
    _repository = RepositoryImpl();
  }

  getAlbumImage() {
    _imageListStream.sink.add(Result<String>.LoadingState("Loading"));

    _repository.getAlbumImage().then((Result result) {
      if (result is SuccessState) {
        _imageListStream.sink.add(result);
      } else {
        _imageListStream.sink.add(Result<String>.ErrorState("Error"));
      }
    });
    return _repository.getAlbumImage();
  }

  @override
  void dispose() {
    _imageListStream.close();
  }
}
