import 'dart:async';

import 'package:flutter_bloc/bloc/block_base.dart';
import 'package:flutter_bloc/repository/modal/result.dart';
import 'package:flutter_bloc/repository/repository.dart';
import 'package:flutter_bloc/repository/repository_impl.dart';

class ImageListBloc implements BlocBase {
  Repository _repository;

  //user future or streams for content delivery
  StreamController _imageListStream;
  StreamController _textStream;

  Stream<Result> get getImageStream => _imageListStream.stream;



  StreamTransformer<String, bool> transformer = StreamTransformer<String,
      bool>.fromHandlers(handleData: (data, sink) {
    if (data.length == 8) {
      sink.add(true);
    } else {
      sink.add(false);
    }
  });

  Stream<bool> get listenTextChange => _textStream.stream.transform(transformer);

  Function(String) get addText => _textStream.sink.add;



  @override
  void init() {
    _imageListStream = StreamController<Result>();
    _textStream = StreamController.broadcast();
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
    _textStream.close();
  }
}
